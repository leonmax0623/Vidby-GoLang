package auth

import (
	"main/database"
	"main/dtos"
	"main/models"
	"main/routes/admin"
	"main/utils"
	"main/validators"

	"github.com/gofiber/fiber/v2"
)

type UpdateRequest struct {
	Name     string `json:"name" validate:"omitempty,required"`
	Email    string `json:"email" validate:"omitempty,required,email"`
	Password string `json:"password" validate:"omitempty,required,password"`
}

func UpdateMe(c *fiber.Ctx) error {
	userID := c.Locals("userID").(uint)
	var user models.User
	database.DB.First(&user, userID)

	// extract new user
	var updateUserRequest UpdateRequest
	if err := c.BodyParser(&updateUserRequest); err != nil {
		return c.Status(500).JSON(fiber.Map{"status": "error", "message": "Invalid new user", "data": err.Error()})
	}

	// validate new user
	if errs := validators.ValidatePayload(updateUserRequest); errs != nil {
		return c.Status(fiber.StatusBadRequest).JSON(errs)
	}

	if updateUserRequest.Name != "" {
		database.DB.Model(&user).Where("id = ?", userID).Update("name", updateUserRequest.Name)
	}

	if updateUserRequest.Email != "" {
		database.DB.Model(&user).Where("id = ?", userID).Update("email", updateUserRequest.Email)
	}

	if updateUserRequest.Password != "" {
		hash, err := utils.HashPassword(updateUserRequest.Password)
		if err != nil {
			return c.Status(500).JSON(fiber.Map{"status": "error", "message": "Couldn't hash password", "data": err.Error()})
		}
		database.DB.Model(&user).Where("id = ?", userID).Update("password", hash)
	}

	// get role
	var role models.UserRole
	database.DB.Find(&role, user.Role)

	var userRole *dtos.UserRoleWithoutUsers
	if role.Name != "" {
		userRole = &dtos.UserRoleWithoutUsers{
			Id:          user.Role,
			Permissions: role.Permissions,
			Name:        role.Name,
		}
	}

	// return updated user
	newUser := admin.NewUser{
		Id:    int(user.ID),
		Email: user.Email,
		Role:  userRole,
		Name:  user.Name,
	}

	return c.JSON(fiber.Map{
		"status":  "success",
		"message": "User updated",
		"data":    newUser,
	})
}
