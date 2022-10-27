package investors

import (
	"main/database"
	"main/dtos"
	"main/validators"

	"github.com/gofiber/fiber/v2"
	log "github.com/sirupsen/logrus"
)

func UpdateInvestors(c *fiber.Ctx) error {
	lang := c.Params("lang")

	var payload Payload
	if err := c.BodyParser(&payload); err != nil {
		log.Error(err)
		return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{"message": "Invalid payload"})
	}

	if errs := validators.ValidatePayload(payload); errs != nil {
		return c.Status(fiber.StatusBadRequest).JSON(errs)
	}

	if err := database.SaveContent(lang, "investors", payload); err != nil {
		return c.Status(fiber.StatusBadRequest).JSON(err.Error())
	}

	return c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "Successfully update investors page"})
}

type Payload struct {
	Seo          dtos.SeoPayload          `json:"seo" validate:"required,dive"`
	Main         MainPayload              `json:"main-section" validate:"required,dive"`
	Invest       InvestPayload            `json:"invest-section" validate:"required,dive"`
	HoldTokenize HoldTokenizePayload      `json:"hold-tokenize-section" validate:"required,dive"`
	Equity       dtos.PrimaryContentBlock `json:"equity-structure-section" validate:"required,dive"`
	Trade        dtos.PrimaryContentBlock `json:"trade-history-section" validate:"required,dive"`
	Form         Form                     `json:"form" validate:"required,dive"`
	Share        dtos.PrimaryContentBlock `json:"share-register" validate:"required,dive"`
	Business     dtos.PrimaryContentBlock `json:"business-reports" validate:"required,dive"`
}

type MainPayload struct {
	dtos.PrimaryContentBlock
	Image string `json:"image" validate:"required"`
}

type InvestPayload struct {
	dtos.PrimaryContentBlock
	Hint                        string `json:"hint" validate:"required"`
	RegistrationAgreementButton string `json:"registration-agreement-button" validate:"required"`
	TokenHolderButton           string `json:"token-holder-agreement-button" validate:"required"`
}

type HoldTokenizePayload struct {
	dtos.PrimaryContentBlock
	Buttons ButtonLinksPayload `json:"buttons-link" validate:"required,dive"`
	Image   string             `json:"image" validate:"required"`
}

type ButtonLinksPayload struct {
	Appstore   string `json:"appstore" validate:"required"`
	GooglePlay string `json:"google-play" validate:"required"`
}

type Form struct {
	Title string `json:"title" validate:"required"`
}
