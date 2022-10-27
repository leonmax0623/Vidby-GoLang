package components

import (
	"encoding/json"
	"github.com/gofiber/fiber/v2"
	log "github.com/sirupsen/logrus"
	"io/ioutil"
	"main/validators"
)

func UpdateScripts(c *fiber.Ctx) error {
	var payload CustomScriptsPayload
	if err := c.BodyParser(&payload); err != nil {
		return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{"message": "Invalid payload"})
	}

	// validate
	if errs := validators.ValidatePayload(payload); errs != nil {
		return c.Status(fiber.StatusBadRequest).JSON(errs)
	}

	// Marshal json
	file, err := json.MarshalIndent(payload, "", "  ")
	if err != nil {
		log.Error(err)
		return err
	}

	// Save as a file
	err = ioutil.WriteFile("content/scripts.json", file, 0644)
	if err != nil {
		log.Error(err)
		return err
	}

	return c.Status(fiber.StatusOK).JSON(fiber.Map{
		"status":  "success",
		"message": "Successfully update scripts",
	})
}

type CustomScriptsPayload struct {
	Global        ScriptItem `json:"global" validate:"required,dive"`
	Products      ScriptItem `json:"products" validate:"required,dive"`
	Customers     ScriptItem `json:"customers" validate:"required,dive"`
	Investors     ScriptItem `json:"investors" validate:"required,dive"`
	About         ScriptItem `json:"about" validate:"required,dive"`
	Prices        ScriptItem `json:"prices" validate:"required,dive"`
	Voices        ScriptItem `json:"voices" validate:"required,dive"`
	Landing       ScriptItem `json:"landing" validate:"required,dive"`
	PrivacyPolicy ScriptItem `json:"privacyPolicy" validate:"required,dive"`
	TermsOfUse    ScriptItem `json:"termsOfUse" validate:"required,dive"`
}

type ScriptItem struct {
	InsideHead string `json:"inside-head" validate:"omitempty,required"`
	BodyStart  string `json:"body-start" validate:"omitempty,required"`
	BodyEnd    string `json:"body-end" validate:"omitempty,required"`
}
