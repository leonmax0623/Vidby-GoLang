package components

import (
	"main/database"

	"github.com/gofiber/fiber/v2"
)

func GetHeader(c *fiber.Ctx) error {
	lang := c.Params("lang")

	landing, err := database.OpenContent(lang, "header")
	if err != nil {
		return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{"status": "error", "error": err.Error()})
	}

	return c.JSON(landing)
}

func GetFooter(c *fiber.Ctx) error {
	lang := c.Params("lang")

	landing, err := database.OpenContent(lang, "footer")
	if err != nil {
		return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{"status": "error", "error": err.Error()})
	}

	return c.JSON(landing)
}
