package admin

import (
	"main/database"
	"main/dtos"
	"main/models"
	"main/utils"
	"main/validators"

	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v4"
	log "github.com/sirupsen/logrus"
)

type UpdateUserRequest struct {
	Name     string `json:"name" validate:"omitempty,required"`
	Role     int    `json:"role" validate:"omitempty,required"`
	Email    string `json:"email" validate:"omitempty,required,email"`
	Password string `json:"password" validate:"omitempty,required,password"`
}

func UpdateUser(c *fiber.Ctx) error {
	id := c.Params("id")
	userId := c.Locals("userID").(uint)

	// search for user
	db := database.DB
	var user models.User
	db.Find(&user, id)

	// current user
	jwtUser := c.Locals("user").(*jwt.Token)
	claims := jwtUser.Claims.(jwt.MapClaims)
	currentId := claims["id"].(float64)
	var currentUser models.User
	database.DB.Find(&currentUser, currentId)

	if user.Email == "" {
		return c.Status(400).JSON(fiber.Map{"status": "error", "message": "No user found"})
	}

	// extract new user
	var updateUserRequest UpdateUserRequest
	if err := c.BodyParser(&updateUserRequest); err != nil {
		return c.Status(500).JSON(fiber.Map{"status": "error", "message": "Invalid new user", "data": err.Error()})
	}

	// validate new user
	if errs := validators.ValidatePayload(updateUserRequest); errs != nil {
		return c.Status(fiber.StatusBadRequest).JSON(errs)
	}

	if updateUserRequest.Name != "" {
		user.Name = updateUserRequest.Name
	}

	if updateUserRequest.Email != "" {
		user.Email = updateUserRequest.Email
	}

	if updateUserRequest.Password != "" {
		hash, err := utils.HashPassword(updateUserRequest.Password)
		if err != nil {
			return c.Status(500).JSON(fiber.Map{"status": "error", "message": "Couldn't hash password", "data": err.Error()})
		}
		user.Password = hash
	}

	// update role
	if updateUserRequest.Role != 1 {
		if updateUserRequest.Role != 0 {
			// get role
			var role models.UserRole
			database.DB.Find(&role, updateUserRequest.Role)
			if role.Name == "" {
				log.Warn("Role with id=", updateUserRequest.Role, " not found")
				return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{
					"status":  "error",
					"message": "role not found",
				})
			}

			user.Role = updateUserRequest.Role
		} else {
			user.Role = 0
		}
	}

	// get role
	var role models.UserRole
	database.DB.Find(&role, user.Role)

	// get creator
	var creator models.User
	database.DB.Find(&creator, userId)

	// get creator and user role
	var creatorRole models.UserRole
	database.DB.Find(&creatorRole, creator.Role)

	if creatorRole.Name == "" {
		log.Warn("creator role not found (id = ", creatorRole.ID, ")")
		return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{
			"status":  "error",
			"message": "role not found",
		})
	}

	// validate that creator.Role.hierarchy > user.Role.hierarchy
	if role.ID != 0 && creatorRole.Hierarchy >= role.Hierarchy {
		log.Warn("Creator with role hierarchy = ", creatorRole.Hierarchy, " can't update user with role hierarchy =", role.Hierarchy)
		return c.Status(fiber.StatusForbidden).JSON(fiber.Map{
			"status":  "forbidden",
			"message": "Not enough rights",
		})
	}

	// Saving user
	db.Save(&user)

	var userRoleModel *dtos.UserRoleWithoutUsers
	if role.Name != "" {
		userRoleModel = &dtos.UserRoleWithoutUsers{
			Id:          user.Role,
			Permissions: role.Permissions,
			Name:        role.Name,
		}
	}

	// return updated user
	newUser := NewUser{
		Id:    int(user.ID),
		Email: user.Email,
		Role:  userRoleModel,
		Name:  user.Name,
	}

	return c.JSON(fiber.Map{
		"status":  "success",
		"message": "User updated",
		"data":    newUser,
	})
}
