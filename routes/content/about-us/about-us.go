package about_us

import (
	"main/database"

	"github.com/gofiber/fiber/v2"
)

func Content(c *fiber.Ctx) error {
	lang := c.Params("lang")

	landing, err := database.OpenMainContent(lang, "about")
	if err != nil {
		return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{"status": "error", "error": err.Error()})
	}

	return c.JSON(landing)
}
