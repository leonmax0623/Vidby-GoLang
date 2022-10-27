package prices

import (
	"main/database"
	"main/dtos"
	"main/validators"

	"github.com/gofiber/fiber/v2"
	log "github.com/sirupsen/logrus"
)

func UpdatePrices(c *fiber.Ctx) error {
	lang := c.Params("lang")

	var payload Payload
	if err := c.BodyParser(&payload); err != nil {
		log.Error(err)
		return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{"message": "Invalid payload"})
	}

	if errs := validators.ValidatePayload(payload); errs != nil {
		return c.Status(fiber.StatusBadRequest).JSON(errs)
	}

	if err := database.SaveContent(lang, "prices", payload); err != nil {
		return c.Status(fiber.StatusBadRequest).JSON(err.Error())
	}

	return c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "Successfully update prices page"})
}

type Payload struct {
	Seo    dtos.SeoPayload `json:"seo" validate:"required,dive"`
	Hints  HintsPayload    `json:"hints" validate:"required,dive"`
	Title  string          `json:"title" validate:"required"`
	Prices []*PricePayload `json:"prices" validate:"required,dive,dive"`
}

type HintsPayload struct {
	First  string `json:"1" validate:"required"`
	Second string `json:"2" validate:"required"`
}

type PricePayload struct {
	Advantages  []*string         `json:"advantages" validate:"required,dive,required"`
	Button      dtos.Link         `json:"button" validate:"required,dive"`
	Description string            `json:"description" validate:"required"`
	Price       PriceValuePayload `json:"price" validate:"required,dive"`
	Title       string            `json:"title" validate:"required"`
}

type PriceValuePayload struct {
	Main   PriceValueContentPayload `json:"main" validate:"required,dive"`
	Second PriceValueContentPayload `json:"second" validate:"required,dive"`
}

type PriceValueContentPayload struct {
	Price string `json:"price" validate:"required"`
	Plan  string `json:"plan" validate:"required"`
}
