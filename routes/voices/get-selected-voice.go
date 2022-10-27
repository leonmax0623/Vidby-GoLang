package voices

import (
	"encoding/json"
	"errors"
	"github.com/gofiber/fiber/v2"
	"gorm.io/gorm"
	"main/database"
	"main/models"
	"strings"
)

func GetSelectedVoices(c *fiber.Ctx) error {
	id := c.Params("id")

	var voice models.SelectedVoices
	err := database.DB.Where("unique_id = ?", id).First(&voice)
	if errors.Is(err.Error, gorm.ErrRecordNotFound) {
		return c.Status(fiber.StatusNotFound).JSON(fiber.Map{"status": "not-found"})
	}

	var comments map[int]string
	err2 := json.Unmarshal([]byte(voice.Comments), &comments)
	if err2 != nil {
		return c.Status(fiber.StatusNotFound).JSON(fiber.Map{"status": "not-found"})
	}

	languages := make([]string, 0)
	if voice.Languages != "" {
		languages = strings.Split(voice.Languages, ",")
	}

	genders := make([]string, 0)
	if voice.Genders != "" {
		genders = strings.Split(voice.Genders, ",")
	}

	favourites := make([]string, 0)
	if voice.Favourites != "" {
		favourites = strings.Split(voice.Favourites, ",")
	}

	return c.JSON(fiber.Map{
		"ids":        voice.Voices,
		"comments":   comments,
		"languages":  languages,
		"genders":    genders,
		"favourites": favourites,
	})
}
