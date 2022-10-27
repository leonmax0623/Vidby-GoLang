package products

import (
	"main/database"
	"main/dtos"
	"main/validators"

	"github.com/gofiber/fiber/v2"
)

func UpdateProducts(c *fiber.Ctx) error {
	lang := c.Params("lang")

	// extract payload
	var payload Payload
	if err := c.BodyParser(&payload); err != nil {
		return c.Status(500).JSON(fiber.Map{"status": "error", "message": "Invalid payload", "data": err.Error()})
	}

	if errs := validators.ValidatePayload(payload); errs != nil {
		return c.Status(fiber.StatusBadRequest).JSON(errs)
	}

	if err := database.SaveContent(lang, "products", payload); err != nil {
		return c.Status(fiber.StatusBadRequest).JSON(err.Error())
	}

	return c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "Successfully update products.json page"})
}

type Payload struct {
	Seo        dtos.SeoPayload   `json:"seo" validate:"required,dive"`
	Main       MainPayload       `json:"main_section" validate:"required,dive"`
	Advantages AdvantagesPayload `json:"advantages_section" validate:"required,dive"`
	Develop    DevelopPayload    `json:"develop_section"  validate:"required,dive"`
}

type MainPayload struct {
	dtos.PrimaryContentBlock
	Button dtos.Link `json:"button" validate:"required,dive"`
}

type AdvantagesPayload struct {
	Advantages []*AdvantagePayload `json:"advantages" validate:"required,dive,required"`
	Title      string              `json:"title" validate:"required"`
}

type AdvantagePayload struct {
	dtos.PrimaryContentBlock
	Icon string `json:"icon" validate:"required"`
}

type DevelopPayload struct {
	dtos.PrimaryContentBlock
	Card DevelopCardPayload `json:"card" validate:"required,dive"`
}

type DevelopCardPayload struct {
	Title  string                    `json:"title" validate:"required"`
	First  DevelopCardSectionPayload `json:"1" validate:"required,dive"`
	Second DevelopCardSectionPayload `json:"2" validate:"required,dive"`
}

type DevelopCardSectionPayload struct {
	Title string   `json:"title" validate:"required"`
	Items []string `json:"items" validate:"required,dive,required"`
}
