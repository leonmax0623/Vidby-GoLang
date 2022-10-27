package voices

import (
	"main/database"
	"main/dtos"
	"main/validators"

	"github.com/gofiber/fiber/v2"
	log "github.com/sirupsen/logrus"
)

func UpdateVoices(c *fiber.Ctx) error {
	lang := c.Params("lang")

	var payload Payload
	if err := c.BodyParser(&payload); err != nil {
		log.Error(err)
		return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{"message": "Invalid payload"})
	}

	if errs := validators.ValidatePayload(payload); errs != nil {
		return c.Status(fiber.StatusBadRequest).JSON(errs)
	}

	if err := database.SaveContent(lang, "voices", payload); err != nil {
		return c.Status(fiber.StatusBadRequest).JSON(err.Error())
	}

	return c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "Successfully update voices"})
}

type Payload struct {
	Seo          dtos.SeoPayload     `json:"seo" validate:"required,dive"`
	Title        string              `json:"title" validate:"required"`
	Button       string              `json:"button" validate:"required"`
	Columns      ColumnsPayload      `json:"columns" validate:"required,dive"`
	Filters      FiltersPayload      `json:"filters" validate:"required,dive"`
	FoundMessage FoundMessagePayload `json:"foundMessage" validate:"required,dive"`
	Popup        PopupPayload        `json:"popup" validate:"required,dive"`
}

type ColumnsPayload struct {
	Language  string `json:"language" validate:"required"`
	Gender    string `json:"gender" validate:"required"`
	VoiceId   string `json:"voiceId" validate:"required"`
	Listen    string `json:"listen" validate:"required"`
	Favorites string `json:"favorites" validate:"required"`
	Comments  string `json:"comments" validate:"required"`
}

type FiltersPayload struct {
	ResetFilter string `json:"resetFilter" validate:"required"`
	Search      string `json:"search" validate:"required"`
	NotFound    string `json:"notFound" validate:"required"`
}

type FoundMessagePayload struct {
	Idle     string `json:"idle" validate:"required"`
	Filtered string `json:"filtered" validate:"required"`
	NotFound string `json:"notFound" validate:"required"`
}

type PopupPayload struct {
	Title  string `json:"title" validate:"required"`
	Button string `json:"button" validate:"required"`
}
