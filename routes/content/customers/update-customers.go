package customers

import (
	"main/database"
	"main/dtos"
	"main/validators"

	"github.com/gofiber/fiber/v2"
	log "github.com/sirupsen/logrus"
)

func UpdateCustomers(c *fiber.Ctx) error {
	lang := c.Params("lang")

	var payload Payload
	if err := c.BodyParser(&payload); err != nil {
		log.Error(err)
		return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{"message": "Invalid payload"})
	}

	if errs := validators.ValidatePayload(payload); errs != nil {
		return c.Status(fiber.StatusBadRequest).JSON(errs)
	}

	if err := database.SaveContent(lang, "customers", payload); err != nil {
		return c.Status(fiber.StatusBadRequest).JSON(err.Error())
	}

	return c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "Successfully update customers"})
}

type Payload struct {
	Seo      dtos.SeoPayload `json:"seo" validate:"required,dive,required"`
	Main     MainPayload     `json:"main_section" validate:"required,dive,required"`
	Examples ExamplesPayload `json:"examples_section" validate:"required,dive,required"`
	Reviews  ReviewsSection  `json:"reviews_section" validate:"required,dive,required"`
}

type MainPayload struct {
	Content   string    `json:"content" validate:"required"`
	Title     string    `json:"title" validate:"required"`
	Customers []*string `json:"customers" validate:"required,dive,required"`
}

type ExamplesPayload struct {
	Title  string                 `json:"title" validate:"required"`
	Videos []*VideoExamplePayload `json:"videos" validate:"required,dive,required"`
	Button dtos.Link              `json:"button" validate:"required,dive,required"`
}

type VideoExamplePayload struct {
	Original    VideoPayload    `json:"original" validate:"required,dive,required"`
	Translated  []*VideoPayload `json:"translated" validate:"required,dive,required"`
	CompanyLogo string          `json:"company_logo" validate:"required"`
}

type VideoPayload struct {
	Language dtos.WebsiteLanguagePayload `json:"language" validate:"required,dive,required"`
	Source   string                      `json:"source" validate:"required"`
	Preview  string                      `json:"preview" validate:"required"`
}

type ReviewsSection struct {
	Title        string    `json:"title" validate:"required"`
	FullTextHere string    `json:"full-text-here" validate:"required"`
	Reviews      []*Review `json:"reviews" validate:"required,dive,required"`
}

type Review struct {
	Author         Author `json:"author" validate:"required,dive,required"`
	Stars          int    `json:"stars" validate:"required,gte=0,lte=5"`
	Content        string `json:"content" validate:"required"`
	FullContentUrl string `json:"full-content-url" validate:"omitempty,url"`
}

type Author struct {
	ProfileImage string  `json:"profile-image" validate:"required"`
	Name         string  `json:"name" validate:"required"`
	Profession   string  `json:"profession" validate:"required"`
	Company      Company `json:"company" validate:"required,dive,required"`
}

type Company struct {
	Company string `json:"company" validate:"required"`
	Url     string `json:"url" validate:"required"`
}
