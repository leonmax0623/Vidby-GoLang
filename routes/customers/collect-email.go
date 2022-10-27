package customers

import (
	"main/database"
	"main/models"

	"github.com/gofiber/fiber/v2"
)

type CollectEmailPayload = struct {
	Email    string `json:"email"`
	Source   string `json:"source"`
	Language string `json:"language"`
}

func CollectEmail(c *fiber.Ctx) error {
	var payload CollectEmailPayload
	if err := c.BodyParser(&payload); err != nil {
		return c.Status(400).JSON(fiber.Map{"status": "error", "message": "Invalid payload", "data": err.Error()})
	}

	if payload.Source != "landing/calculator" && payload.Source != "landing/form" {
		return c.Status(400).JSON(fiber.Map{"status": "error", "message": "Invalid source"})
	}

	customer := models.CustomerEmail{
		Email:    payload.Email,
		Source:   payload.Source,
		Language: payload.Language,
	}
	database.DB.Create(&customer)

	return c.Status(fiber.StatusOK).JSON(fiber.Map{"status": "success"})
}
