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

type SendCouponEmailPayload = struct {
	Email    string `json:"email" validate:"required,email"`
	Language string `json:"language" validate:"required"`
}

func SendCouponEmail(c *fiber.Ctx) error {
	var payload SendCouponEmailPayload
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
		Source:   "landing/form",
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
					"coupon_amount": "10",
				},
			},
		},
		"template_id": "d-5d891fb09eee4da997789fd6f73bbd30",
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
