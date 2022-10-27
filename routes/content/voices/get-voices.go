package voices

import (
	"main/database"

	"github.com/gofiber/fiber/v2"
)

func Content(c *fiber.Ctx) error {
	lang := c.Params("lang")

	landing, err := database.OpenMainContent(lang, "voices")
	if err != nil {
		return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{"status": "error", "error": err.Error()})
	}

	return c.JSON(landing)
}
