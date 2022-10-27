package components

import (
	"main/database"
	"main/dtos"
	"main/validators"

	"github.com/gofiber/fiber/v2"
)

func UpdateHeader(c *fiber.Ctx) error {
	lang := c.Params("lang")

	var payload HeaderPayload
	if err := c.BodyParser(&payload); err != nil {
		return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{"message": "Invalid payload"})
	}

	if errs := validators.ValidatePayload(payload); errs != nil {
		return c.Status(fiber.StatusBadRequest).JSON(errs)
	}

	if err := database.SaveContent(lang, "header", payload); err != nil {
		return c.Status(fiber.StatusBadRequest).JSON(err.Error())
	}

	return c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "Successfully update header"})
}

type HeaderPayload struct {
	Left  []dtos.Link `json:"left" validate:"required,gt=0,dive,required"`
	Right []dtos.Link `json:"right" validate:"required,gt=0,dive,required"`
	Login dtos.Link   `json:"login" validate:"required,dive"`
}
