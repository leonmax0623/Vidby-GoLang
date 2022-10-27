package voices

import (
	"github.com/gofiber/fiber/v2"
	"main/database"
	"main/models"
)

type Voice struct {
	Id      int    `json:"id"`
	Code    string `json:"code"`
	Name    string `json:"name"`
	Comment string `json:"comment"`
	Gender  string `json:"gender"`
}

func GetVoices(c *fiber.Ctx) error {

	// get raw models from database
	raw := make([]models.Voice, 0)
	database.DB.Find(&raw)

	// convert raw models to dto
	voices := make([]Voice, len(raw))
	for i, voice := range raw {
		voices[i] = Voice{
			Id:      int(voice.Id),
			Code:    voice.Code,
			Name:    voice.Name,
			Comment: voice.Comment,
			Gender:  voice.Gender,
		}
	}

	// get last update time
	var lastUpdateTime models.UpdateHistory
	database.DB.Where("parent = ?", "voices").Order("date desc").First(&lastUpdateTime)

	return c.Status(fiber.StatusOK).JSON(fiber.Map{
		"status":      "success",
		"message":     "Successfully get voices",
		"last-update": lastUpdateTime.Date,
		"voices":      voices,
	})
}
