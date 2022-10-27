package components

import (
	"main/database"

	"github.com/gofiber/fiber/v2"
)

func GetScripts(c *fiber.Ctx) error {
	// open scripts
	scripts, err := database.OpenScripts()
	if err != nil {
		return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{
			"status":  "error",
			"message": "Failed to open scripts",
			"error":   err.Error(),
		})
	}

	return c.Status(fiber.StatusOK).JSON(scripts)
}
