package languages

import (
	"fmt"
	"main/database"
	"main/dtos"
	"main/models"
	"os"

	"github.com/gofiber/fiber/v2"
	cp "github.com/otiai10/copy"
)

func GetWebsiteLanguages(c *fiber.Ctx) error {
	var rawLanguages []models.WebsiteLanguage
	database.DB.Find(&rawLanguages)

	return c.Status(fiber.StatusOK).JSON(fiber.Map{
		"status":    "success",
		"message":   "Successfully get languages",
		"languages": dtos.WebsiteLanguageDto(&rawLanguages),
	})
}

type AddWebsiteLanguagePayload = struct {
	Code     string `json:"code"`
	Language string `json:"language"`
}

func AddWebsiteLanguage(c *fiber.Ctx) error {
	// extract payload
	var payload AddWebsiteLanguagePayload
	if err := c.BodyParser(&payload); err != nil {
		return c.Status(500).JSON(fiber.Map{"status": "error", "message": "Invalid payload", "data": err.Error()})
	}

	model := models.WebsiteLanguage{
		Code:      payload.Code,
		Language:  payload.Language,
		Available: false,
	}

	if err := cp.Copy("content/en", fmt.Sprintf("content/%s", payload.Code)); err != nil {
		return c.Status(500).JSON(fiber.Map{"status": "error", "message": "Failed to copy content", "data": err.Error()})
	}

	if res := database.DB.Create(&model); res.Error != nil {
		return c.Status(500).JSON(fiber.Map{"message": "failed to create model", "err": res.Error})
	}

	return c.Status(fiber.StatusOK).JSON(fiber.Map{
		"status":   "success",
		"message":  "Successfully create languages",
		"language": model,
	})
}

func RemoveWebsiteLanguage(c *fiber.Ctx) error {
	id := c.Params("id")

	var lang models.WebsiteLanguage
	database.DB.Find(&lang, id)

	if lang.Code == "en" {
		return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{
			"status":  "error",
			"message": "You can't remove en language",
		})
	}

	database.DB.Unscoped().Delete(&models.WebsiteLanguage{}, id)

	if err := os.RemoveAll(fmt.Sprintf("content/%s", lang.Code)); err != nil {
		return c.Status(fiber.StatusOK).JSON(fiber.Map{
			"status":  "error",
			"message": "Failed to delete folder",
			"err":     err.Error(),
		})
	}

	return c.Status(fiber.StatusOK).JSON(fiber.Map{
		"status":  "success",
		"message": "Successfully create languages",
	})
}

type UpdateIsDisabledPayload = struct {
	Disabled bool `json:"disabled"`
}

func UpdateIsDisabled(c *fiber.Ctx) error {
	id := c.Params("id")

	// extract payload
	var payload UpdateIsDisabledPayload
	if err := c.BodyParser(&payload); err != nil {
		return c.Status(500).JSON(fiber.Map{"status": "error", "message": "Invalid payload", "data": err.Error()})
	}

	database.DB.Model(&models.WebsiteLanguage{}).Where("id = ?", id).Update("available", !payload.Disabled)

	return c.Status(fiber.StatusOK).JSON(fiber.Map{
		"status":  "success",
		"message": "Successfully update language",
	})
}
