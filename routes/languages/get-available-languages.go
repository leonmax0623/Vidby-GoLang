package languages

import (
	"github.com/gofiber/fiber/v2"
	"main/database"
	"main/dtos"
	"main/models"
)

func GetAvailableLanguages(c *fiber.Ctx) error {
	var rawLanguages []models.Language
	database.DB.Find(&rawLanguages)
	var languages = dtos.LanguageToDto(&rawLanguages)

	// get last update time
	var lastUpdateTime models.UpdateHistory
	database.DB.Where("parent = ?", "available-languages").Order("date desc").First(&lastUpdateTime)

	return c.Status(fiber.StatusOK).JSON(fiber.Map{
		"status":      "success",
		"message":     "Successfully get languages",
		"last-update": lastUpdateTime.Date,
		"languages":   languages,
	})
}
