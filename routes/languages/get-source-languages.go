package languages

import (
	"github.com/gofiber/fiber/v2"
	"main/database"
	"main/dtos"
	"main/models"
)

func GetSourceLanguages(c *fiber.Ctx) error {
	var rawLanguages []models.SourceLanguage
	database.DB.Find(&rawLanguages)
	var languages = dtos.SourceLanguageToDto(&rawLanguages)

	// get last update time
	var lastUpdateTime models.UpdateHistory
	database.DB.Where("parent = ?", "sources-languages").Order("date desc").First(&lastUpdateTime)

	return c.Status(fiber.StatusOK).JSON(fiber.Map{
		"status":      "success",
		"message":     "Successfully get source languages",
		"last-update": lastUpdateTime.Date,
		"languages":   languages,
	})
}
