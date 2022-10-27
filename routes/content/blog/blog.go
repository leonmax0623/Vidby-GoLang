package blog

import (
	"main/database"
	"main/dtos"
	"main/validators"

	"github.com/gofiber/fiber/v2"
	log "github.com/sirupsen/logrus"
)

func Content(c *fiber.Ctx) error {
	lang := c.Params("lang")

	landing, err := database.OpenMainContent(lang, "blog")
	if err != nil {
		return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{"status": "error", "error": err.Error()})
	}

	return c.JSON(landing)
}

func UpdateBlog(c *fiber.Ctx) error {
	lang := c.Params("lang")

	var payload Payload
	if err := c.BodyParser(&payload); err != nil {
		log.Error(err)
		return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{"message": "Invalid payload"})
	}

	if errs := validators.ValidatePayload(payload); errs != nil {
		return c.Status(fiber.StatusBadRequest).JSON(errs)
	}

	if err := database.SaveContent(lang, "blog", payload); err != nil {
		return c.Status(fiber.StatusBadRequest).JSON(err.Error())
	}

	return c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "Successfully update blog page"})
}

type Payload struct {
	Seo dtos.SeoPayload `json:"seo" validate:"required,dive"`
}
