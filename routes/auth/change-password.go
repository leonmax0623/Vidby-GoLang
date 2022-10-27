package auth

import (
	"main/database"
	"main/models"
	"main/utils"
	"main/validators"

	"github.com/gofiber/fiber/v2"
)

type Payload struct {
	OldPassword string `json:"old" validate:"required"`
	NewPassword string `json:"new" validate:"required,password"`
}

func ChangePassword(c *fiber.Ctx) error {
	// extract user id
	userID := c.Locals("userID").(uint)

	// extract user
	var payload Payload
	if err := c.BodyParser(&payload); err != nil {
		return c.Status(500).JSON(fiber.Map{"status": "error", "message": "Invalid new user", "data": err.Error()})
	}

	// validate new user
	if errs := validators.ValidatePayload(payload); errs != nil {
		return c.Status(fiber.StatusBadRequest).JSON(errs)
	}

	// get new user
	var user models.User
	database.DB.Find(&user, userID)

	// check old password
	if !CheckPasswordHash(payload.OldPassword, user.Password) {
		return c.Status(fiber.StatusUnauthorized).JSON(fiber.Map{"status": "error", "message": "Invalid current password", "data": nil})
	}

	// hashing password
	hash, err := utils.HashPassword(payload.NewPassword)
	if err != nil {
		return c.Status(500).JSON(fiber.Map{"status": "error", "message": "Couldn't hash password", "data": err.Error()})
	}

	// Updating password
	database.DB.Model(&models.User{}).Where("id = ?", userID).Update("password", hash)

	return c.Status(fiber.StatusOK).JSON(fiber.Map{
		"status": "success",
	})
}
