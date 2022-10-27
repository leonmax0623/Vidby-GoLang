package roles

import (
	"github.com/gofiber/fiber/v2"
	log "github.com/sirupsen/logrus"
	"main/database"
	"main/models"
	"strconv"
)

func DeleteRole(c *fiber.Ctx) error {
	id, err := strconv.Atoi(c.Params("id"))
	if err != nil {
		return c.Status(fiber.StatusNotFound).JSON("")
	}

	// root can't be deleted
	if id == 0 {
		log.Warn("Root can't be deleted")
		return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{
			"status":  "error",
			"message": "Root can't be deleted",
		})
	}

	// Delete role
	database.DB.Delete(&models.UserRole{}, id)

	// Reset role to default
	database.DB.Model(&models.UserRole{}).Where("role = ?", id).Update("role", nil)

	return c.Status(fiber.StatusOK).JSON(fiber.Map{
		"status":  "success",
		"message": "role deleted",
	})
}
