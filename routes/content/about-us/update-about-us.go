package about_us

import (
	"main/database"
	"main/dtos"
	"main/validators"

	"github.com/gofiber/fiber/v2"
	log "github.com/sirupsen/logrus"
)

func UpdateAboutUs(c *fiber.Ctx) error {
	lang := c.Params("lang")

	var payload Payload
	if err := c.BodyParser(&payload); err != nil {
		log.Error(err)
		return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{"message": "Invalid payload"})
	}

	if errs := validators.ValidatePayload(payload); errs != nil {
		return c.Status(fiber.StatusBadRequest).JSON(errs)
	}

	if err := database.SaveContent(lang, "about", payload); err != nil {
		return c.Status(fiber.StatusBadRequest).JSON(err.Error())
	}

	return c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "Successfully update customers page"})
}

type Payload struct {
	Seo              dtos.SeoPayload   `json:"seo" validate:"required,dive"`
	Main             MainPayload       `json:"main-section" validate:"required,dive"`
	Commitment       CommitmentPayload `json:"commitment-section" validate:"required,dive"`
	StartTranslation StartTranslation  `json:"start-translation-section" validate:"required,dive"`
}

type MainPayload struct {
	Title   string                   `json:"title" validate:"required"`
	Mission dtos.PrimaryContentBlock `json:"mission" validate:"required,dive"`
	Story   dtos.PrimaryContentBlock `json:"story" validate:"required,dive"`
	Goals   []*GoalPayload           `json:"goals" validate:"required,dive,dive"`
}

type GoalPayload struct {
	Date     string `json:"date" validate:"required"`
	Achieved *bool  `json:"achieved" validate:"required"`
	Text     string `json:"text" validate:"required"`
	Selected *bool  `json:"selected" validate:"required"`
}

type CommitmentPayload struct {
	dtos.PrimaryContentBlock
	Image        string `json:"image" validate:"required"`
	BlurredImage string `json:"blurred-image" validate:"required"`
}

type StartTranslation struct {
	Title  string    `json:"title" validate:"required"`
	Button dtos.Link `json:"button" validate:"required,dive"`
}
