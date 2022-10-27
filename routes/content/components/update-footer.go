package components

import (
	"main/database"
	"main/dtos"
	"main/validators"

	"github.com/gofiber/fiber/v2"
)

func UpdateFooter(c *fiber.Ctx) error {
	lang := c.Params("lang")

	var payload FooterPayload
	if err := c.BodyParser(&payload); err != nil {
		return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{"message": "Invalid payload"})
	}

	if errs := validators.ValidatePayload(payload); errs != nil {
		return c.Status(fiber.StatusBadRequest).JSON(errs)
	}

	if err := database.SaveContent(lang, "footer", payload); err != nil {
		return c.Status(fiber.StatusBadRequest).JSON(err.Error())
	}

	return c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "Successfully update footer"})
}

type FooterPayload struct {
	Service            FooterSectionPayload            `json:"service" validate:"required,dive"`
	LegalConditions    FooterSectionPayload            `json:"legal-conditions" validate:"required,dive"`
	Contacts           StringItemsFooterSectionPayload `json:"contacts" validate:"required,dive"`
	FollowUs           FooterSectionPayload            `json:"follow-us" validate:"required,dive"`
	PaymentMethods     StringItemsFooterSectionPayload `json:"payment-methods" validate:"required,dive"`
	AvailableLanguages AvailableLangsPayload           `json:"available-languages" validate:"required,dive"`
}

type AvailableLangsPayload struct {
	Selected dtos.WebsiteLanguagePayload   `json:"selected" validate:"required,dive"`
	Items    []dtos.WebsiteLanguagePayload `json:"items" validate:"required,dive"`
}

type BottomPayload struct {
	AllRightsReserved string `json:"all-rights-reserved" validate:"required"`
	Company           string `json:"company" validate:"required"`
}

type StringItemsFooterSectionPayload struct {
	Title string   `json:"title" validate:"required"`
	Items []string `json:"items" validate:"required,dive,required"`
}

type FooterSectionPayload struct {
	Title string      `json:"title" validate:"required"`
	Items []dtos.Link `json:"items" validate:"required,dive,required"`
}
