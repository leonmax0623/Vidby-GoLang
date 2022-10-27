package customers

import (
	"bytes"
	"encoding/json"
	"fmt"
	"main/database"
	"main/models"
	"main/validators"
	"net/http"

	"github.com/gofiber/fiber/v2"
	log "github.com/sirupsen/logrus"
)

type SendCalcEmailPayload = struct {
	Email     string    `json:"email" validate:"required,email"`
	Language  string    `json:"language" validate:"required"`
	Variables Variables `json:"variables" validate:"required,dive"`
}

type Variables = struct {
	VideoLength         string `json:"video_length" validate:"required"`
	SourceLanguage      string `json:"source_language" validate:"required"`
	NewLanguages        int64  `json:"new_languages" validate:"required"`
	TranslationAccuracy string `json:"translation_accuracy" validate:"required"`
	ProductionTime      string `json:"production_time" validate:"required"`
	OrderCost           string `json:"order_cost" validate:"required"`
	Discount            string `json:"discount" validate:"required"`
	Total               string `json:"total" validate:"required"`
	CouponAmount        string `json:"coupon_amount" validate:"required"`
}

func SendCalcEmail(c *fiber.Ctx) error {
	var payload SendCalcEmailPayload
	if err := c.BodyParser(&payload); err != nil {
		return c.Status(400).JSON(fiber.Map{"status": "error", "message": "Invalid payload", "data": err.Error()})
	}

	// Validate
	if errs := validators.ValidatePayload(payload); errs != nil {
		return c.Status(fiber.StatusBadRequest).JSON(errs)
	}

	// Save customer email to database
	customer := models.CustomerEmail{
		Email:    payload.Email,
		Source:   "landing/calc",
		Language: payload.Language,
	}
	database.DB.Create(&customer)

	body, err := json.Marshal(fiber.Map{
		"from": fiber.Map{
			"email": "support@vidby.com",
		},
		"personalizations": []fiber.Map{
			{
				"to": []fiber.Map{
					{"email": payload.Email},
				},
				"dynamic_template_data": fiber.Map{
					"video_length":         payload.Variables.VideoLength,
					"source_language":      payload.Variables.SourceLanguage,
					"new_languages":        payload.Variables.NewLanguages,
					"translation_accuracy": payload.Variables.TranslationAccuracy,
					"production_time":      payload.Variables.ProductionTime,
					"order_cost":           payload.Variables.OrderCost,
					"discount":             payload.Variables.Discount,
					"total":                payload.Variables.Total,
					"coupon_amount":        payload.Variables.CouponAmount,
				},
			},
		},
		"template_id": "d-6a360e85da004cf5a5ac10d4f2f5e59f",
	})

	if err != nil {
		log.Error(err)
		return c.Status(400).JSON(fiber.Map{"status": "error", "message": "Invalid payload", "data": err.Error()})
	}

	client := &http.Client{}
	req, _ := http.NewRequest("POST", "https://api.sendgrid.com/v3/mail/send", bytes.NewBuffer(body))
	req.Header.Set("Content-Type", "application/json")
	req.Header.Set("Authorization", fmt.Sprintf("Bearer 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"))
	response, err := client.Do(req)

	if err != nil || response.Status != "202 Accepted" {
		log.Error(err, ". Status: ", response.Status)
		return c.Status(400).JSON(fiber.Map{"status": "error", "message": "Invalid payload", "data": err.Error()})
	}

	return c.Status(fiber.StatusOK).JSON(fiber.Map{"status": "success"})
}
