package admin

import (
	"errors"
	"main/config"
	"main/database"
	"main/dtos"
	"main/models"
	"main/utils"
	"main/validators"

	"github.com/gofiber/fiber/v2"
	"github.com/jackc/pgconn"
	log "github.com/sirupsen/logrus"
	"golang.org/x/exp/slices"
)

type UserPayload struct {
	Email    string `json:"email" validate:"required,email"`
	Role     *int   `json:"role" validate:"required"`
	Name     string `json:"name" validate:"required"`
	Password string `json:"password" validate:"required,min=8"`
}

type NewUser struct {
	Id    int                        `json:"id"`
	Email string                     `json:"email"`
	Role  *dtos.UserRoleWithoutUsers `json:"role"`
	Name  string                     `json:"name"`
}

func AddUser(c *fiber.Ctx) error {
	db := database.DB
	userId := c.Locals("userID").(uint)
	isRoot := c.Locals("isRoot").(bool)

	// extract user
	var payload UserPayload
	if err := c.BodyParser(&payload); err != nil {
		return c.Status(500).JSON(fiber.Map{"status": "error", "message": "Invalid new user", "data": err.Error()})
	}

	// validate user
	if errs := validators.ValidatePayload(payload); errs != nil {
		return c.Status(fiber.StatusBadRequest).JSON(errs)
	}

	// nobody can change role to root
	if *payload.Role == 1 {
		log.Warn("Nobody can change role to root")
		return c.Status(fiber.StatusForbidden).JSON(fiber.Map{
			"status":  "forbidden",
			"message": "Not enough rights",
		})
	}

	var userRole *int
	if *payload.Role != 0 {
		// get role
		var role models.UserRole
		database.DB.Find(&role, payload.Role)
		if role.Name == "" {
			log.Warn("Role with id=", payload.Role, " not found")
			return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{
				"status":  "error",
				"message": "role not found",
			})
		}

		// only root have permission to create user, that have permission to create other users
		if slices.Contains(role.Permissions, config.WriteUsersPermission) && !isRoot {
			log.Warn("Creator can't grant new user permission to write users")
			return c.Status(fiber.StatusForbidden).JSON(fiber.Map{
				"status":  "forbidden",
				"message": "Not enough rights",
			})
		}

		// get creator
		var creator models.User
		database.DB.Find(&creator, userId)

		// get creator and user role
		var creatorRole models.UserRole
		database.DB.Find(&creatorRole, creator.Role)
		if creatorRole.Name == "" {
			log.Warn("Role with id=", payload.Role, " not found")
			return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{
				"status":  "error",
				"message": "role not found",
			})
		}

		// validate that createRole.hierarchy > payload.Role.hierarchy
		if creatorRole.Hierarchy >= role.Hierarchy {
			log.Warn("Creator with role hierarchy = ", creatorRole.Hierarchy, " can't create user with role hierarchy =", role.Hierarchy)
			return c.Status(fiber.StatusForbidden).JSON(fiber.Map{
				"status":  "forbidden",
				"message": "Not enough rights",
			})
		}

		userRole = payload.Role
	}

	// create database model
	user := models.User{
		Email:    payload.Email,
		Password: payload.Password,
		Name:     payload.Name,
	}

	if userRole != nil {
		user.Role = *userRole
	}

	// hashing password
	hash, err := utils.HashPassword(user.Password)
	if err != nil {
		return c.Status(500).JSON(fiber.Map{"status": "error", "message": "Couldn't hash password", "data": err.Error()})

	}

	// creating user
	user.Password = hash
	if err := db.Create(&user).Error; err != nil {
		var pgError *pgconn.PgError
		errors.As(err, &pgError)
		if pgError.Code == "23505" {
			log.Error("User with email=", user.Email, " not exists")
			return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{
				"status":  "error",
				"message": "User with this Email already exists",
			})
		}

		return c.Status(500).JSON(fiber.Map{"status": "error", "message": "Couldn't create user", "data": err.Error()})
	}

	// get role
	var role models.UserRole
	database.DB.Find(&role, user.Role)

	var userRoleModel *dtos.UserRoleWithoutUsers
	if role.Name != "" {
		userRoleModel = &dtos.UserRoleWithoutUsers{
			Id:          user.Role,
			Permissions: role.Permissions,
			Name:        role.Name,
		}
	}

	// return creating user
	newUser := NewUser{
		Id:    int(user.ID),
		Email: user.Email,
		Role:  userRoleModel,
		Name:  user.Name,
	}

	return c.JSON(fiber.Map{
		"status":  "success",
		"message": "User created",
		"data":    newUser,
	})
}
