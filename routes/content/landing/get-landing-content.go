package landing

import (
	"main/database"

	"github.com/gofiber/fiber/v2"
)

func GetLandingContent(c *fiber.Ctx) error {
	lang := c.Params("lang")

	// open content
	landing, err := database.OpenContent(lang, "landing")
	if err != nil {
		return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{"status": "error", "error": err.Error()})
	}

	// open scripts
	scripts, err := database.OpenScripts()

	// apply scripts
	landing["scripts"] = scripts

	return c.JSON(landing)
}
