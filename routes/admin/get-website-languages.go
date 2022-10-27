package admin

import (
	"github.com/gofiber/fiber/v2"
	"main/database"
)

func GetWebsiteLanguages(c *fiber.Ctx) error {
	return c.Status(fiber.StatusOK).JSON(fiber.Map{
		"status":    "success",
		"message":   "successfully fetch website languages",
		"languages": database.GetWebsiteLanguages("admin"),
	})
}
