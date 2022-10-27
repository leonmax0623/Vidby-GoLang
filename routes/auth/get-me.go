package auth

import (
	"github.com/gofiber/fiber/v2"
	"main/database"
	"main/dtos"
	"main/models"
)

func GetMe(c *fiber.Ctx) error {
	userID := c.Locals("userID")
	var user models.User
	database.DB.Find(&user, userID)

	if user.Name == "" {
		return c.Status(fiber.StatusNotFound).JSON(fiber.Map{"status": "error", "message": "User not found"})
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
			Hierarchy:   role.Hierarchy,
		}
	}

	return c.Status(fiber.StatusOK).JSON(fiber.Map{
		"status": "success",
		"user": fiber.Map{
			"id":    user.ID,
			"name":  user.Name,
			"email": user.Email,
			"role":  userRole,
		},
	})
}
