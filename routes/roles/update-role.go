package roles

import (
	"fmt"
	"github.com/gofiber/fiber/v2"
	log "github.com/sirupsen/logrus"
	"main/database"
	"main/models"
	"main/validators"
)

func UpdateRole(c *fiber.Ctx) error {
	// Extract role id and user id
	id := c.Params("id")
	userID := c.Locals("userID").(uint)

	// Extract payload
	var payload Payload
	if err := c.BodyParser(&payload); err != nil {
		log.Error(err)
		return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{"message": "Invalid payload"})
	}

	// Validate payload
	if errs := validators.ValidatePayload(payload); errs != nil {
		return c.Status(fiber.StatusBadRequest).JSON(errs)
	}

	// Query role
	var role models.UserRole
	database.DB.First(&role, id)
	if role.Name == "" {
		log.Warn("role with id=", id, " not found")
		return c.Status(fiber.StatusNotFound).JSON(fiber.Map{
			"status":  "not-found",
			"message": fmt.Sprintf("role with id=%s not found", id),
		})
	}

	// Update role
	role.Name = payload.Name
	role.Permissions = payload.Permissions
	role.UpdatedById = int(userID)
	role.Hierarchy = payload.Hierarchy
	database.DB.Save(&role)

	return c.Status(fiber.StatusOK).JSON(fiber.Map{
		"status":  "success",
		"message": "role updated",
	})
}
