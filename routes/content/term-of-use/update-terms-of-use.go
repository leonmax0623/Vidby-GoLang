package term_of_use

import (
	"main/database"
	"main/dtos"
	"main/validators"

	"github.com/gofiber/fiber/v2"
	log "github.com/sirupsen/logrus"
)

func UpdateTermsOfUse(c *fiber.Ctx) error {
	lang := c.Params("lang")

	var payload Payload
	if err := c.BodyParser(&payload); err != nil {
		log.Error(err)
		return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{"message": "Invalid payload"})
	}

	if errs := validators.ValidatePayload(payload); errs != nil {
		return c.Status(fiber.StatusBadRequest).JSON(errs)
	}

	if err := database.SaveContent(lang, "terms-of-use", payload); err != nil {
		return c.Status(fiber.StatusBadRequest).JSON(err.Error())
	}

	return c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "Successfully update terms of use page"})
}

type Payload struct {
	Seo dtos.SeoPayload `json:"seo" validate:"required,dive"`
	dtos.PrimaryContentBlock
}
