package middlewares

import (
	"github.com/gofiber/fiber/v2"
	log "github.com/sirupsen/logrus"
	recaptcha2 "github.com/xinguang/go-recaptcha"
	"main/config"
	"main/validators"
	"os"
)

type CaptchaPayload struct {
	Captcha        string `json:"captcha" validate:"required"`
	CaptchaVersion string `json:"captcha-version" validate:"required,oneof=V3 V2"`
}

// ValidateRecaptcha protect routes with recaptcha validation
func ValidateRecaptcha(c *fiber.Ctx) error {
	var payload CaptchaPayload

	if err := c.BodyParser(&payload); err != nil {
		return c.Status(400).JSON(fiber.Map{"status": "error", "message": "Invalid payload", "data": err})
	}

	// Validate
	if errs := validators.ValidatePayload(payload); errs != nil {
		return c.Status(fiber.StatusBadRequest).JSON(errs)
	}

	// validate Captcha
	if payload.CaptchaVersion == "V3" {
		recaptcha, _ := recaptcha2.NewWithSecert(os.Getenv(config.RECAPTCHA_V3_SECRET))
		err := recaptcha.VerifyWithOptions(payload.Captcha, recaptcha2.VerifyOption{Threshold: 0.3})

		if err != nil {
			log.Error("Recaptcha V3 is invalid ", err)
			return c.Status(400).JSON(fiber.Map{"status": "error", "message": "Invalid recaptcha", "data": err})
		}
	} else {
		recaptcha, _ := recaptcha2.NewWithSecert(os.Getenv(config.RECAPTCHA_V2_SECRET))
		err := recaptcha.Verify(payload.Captcha)

		if err != nil {
			log.Error("Recaptcha V2 is invalid ", err)
			return c.Status(400).JSON(fiber.Map{"status": "error", "message": "Invalid recaptcha", "data": err})
		}
	}

	return c.Next()
}
