package customers

import (
	"github.com/gofiber/fiber/v2"
	log "github.com/sirupsen/logrus"
	"main/database"
	"main/models"
	"time"
)

type SavedEmailDto struct {
	Date   time.Time `json:"date"`
	Email  string    `json:"email"`
	Source string    `json:"source"`
}

// GetSavedEmails return customers email (admin console)
func GetSavedEmails(c *fiber.Ctx) error {
	// get emails from database
	var raw []models.CustomerEmail
	if res := database.DB.Find(&raw); res.Error != nil {
		log.Error("Failed to get customers emails. ", res.Error)
		return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{
			"status":  "error",
			"message": "Failed to get customers emails",
			"error":   res.Error,
		})
	}

	// map models.CustomerEmail to SavedEmailDto
	emails := make([]SavedEmailDto, 0)
	for _, model := range raw {
		emails = append(emails, SavedEmailDto{
			Date:   model.CreatedAt,
			Email:  model.Email,
			Source: model.Source,
		})
	}

	// return emails
	return c.Status(fiber.StatusOK).JSON(fiber.Map{
		"status": "success",
		"data":   emails,
	})
}
