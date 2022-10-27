package admin

import (
	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v4"
	log "github.com/sirupsen/logrus"
	"main/database"
	"main/models"
)

func DeleteUser(c *fiber.Ctx) error {
	userID := c.Locals("userID").(uint)

	// Extract id
	id := c.Params("id")

	// Search for user
	db := database.DB
	var user models.User
	db.First(&user, id)

	// Invalid id
	if user.Email == "" {
		return c.Status(400).JSON(fiber.Map{"status": "error", "message": "No user found"})
	}

	// nobody can't delete root
	if user.ID == 1 {
		log.Warn("Impossible to delete root")
		return c.Status(fiber.StatusForbidden).JSON(fiber.Map{
			"status":  "forbidden",
			"message": "Not enough rights",
		})
	}

	// get creator
	var creator models.User
	database.DB.Find(&creator, userID)

	// get creator and user role
	var creatorRole, userRole models.UserRole
	database.DB.Find(&creatorRole, creator.Role)
	database.DB.Find(&userRole, user.Role)

	if creatorRole.Name == "" {
		return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{
			"status":  "error",
			"message": "role not found",
		})
	}

	if userRole.Name == "" {
		userRole.Hierarchy = 1000
	}

	// validate that creator.Role.hierarchy > user.Role.hierarchy
	if creatorRole.Hierarchy >= userRole.Hierarchy {
		log.Warn("Creator with role hierarchy = ", creatorRole.Hierarchy, " can't delete user with role hierarchy =", userRole.Hierarchy)
		return c.Status(fiber.StatusForbidden).JSON(fiber.Map{
			"status":  "forbidden",
			"message": "Not enough rights",
		})
	}

	// current user
	jwtUser := c.Locals("user").(*jwt.Token)
	claims := jwtUser.Claims.(jwt.MapClaims)
	currentId := claims["id"].(float64)
	var currentUser models.User
	database.DB.Find(&currentUser, currentId)

	// delete user
	db.Unscoped().Delete(&user)

	return c.Status(200).JSON(fiber.Map{"status": "success", "message": "User deleted"})
}
