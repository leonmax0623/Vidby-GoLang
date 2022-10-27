package presentation

import (
	"fmt"
	"main/database"
	"main/dtos"
	"main/validators"

	"github.com/gofiber/fiber/v2"
	log "github.com/sirupsen/logrus"
)

func Content(c *fiber.Ctx) error {
	lang := c.Params("lang")
	translation := c.Params("translation")

	landing, err := database.OpenMainContent(lang, translation)
	if err != nil {
		return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{"status": "error", "error": err.Error()})
	}

	return c.JSON(landing)
}

func Update(c *fiber.Ctx) error {
	lang := c.Params("lang")
	translation := c.Params("translation")

	var payload Payload
	if err := c.BodyParser(&payload); err != nil {
		log.Error(err)
		return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{"message": "Invalid payload"})
	}

	if errs := validators.ValidatePayload(payload); errs != nil {
		return c.Status(fiber.StatusBadRequest).JSON(errs)
	}

	if err := database.SaveContent(lang, translation, payload); err != nil {
		return c.Status(fiber.StatusBadRequest).JSON(err.Error())
	}

	return c.Status(fiber.StatusOK).JSON(fiber.Map{"message": fmt.Sprintf("Successfully update %v page", translation)})
}

type Payload struct {
	Seo dtos.SeoPayload `json:"seo" validate:"required,dive"`
	dtos.PrimaryContentBlock
}
