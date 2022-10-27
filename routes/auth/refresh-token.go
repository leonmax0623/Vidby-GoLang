package auth

import (
	"fmt"
	"main/config"
	"main/database"
	"main/models"
	"os"

	"github.com/gofiber/fiber/v2"
	jwt "github.com/golang-jwt/jwt/v4"
)

type RefreshTokenPayload struct {
	Token string `json:"token"`
}

func RefreshToken(c *fiber.Ctx) error {
	var payload RefreshTokenPayload
	if err := c.BodyParser(&payload); err != nil {
		return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{"status": "error", "message": "Error on refresh", "data": err.Error()})
	}

	secret := []byte(os.Getenv(config.SECRET_REFRESH))
	token, err := jwt.Parse(payload.Token, func(token *jwt.Token) (interface{}, error) {
		// Don't forget to validate the alg is what you expect:
		if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
			return nil, fmt.Errorf("unexpected signing method: %v", token.Header["alg"])
		}

		return secret, nil
	})

	if err != nil {
		return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{"status": "error", "message": "Error on refresh", "data": err.Error()})
	}

	if claims, ok := token.Claims.(jwt.MapClaims); ok && token.Valid {
		id := claims["id"].(float64)

		// Creating tokens
		var user models.User
		database.DB.Find(&user, id)
		accessToken, refreshToken, nil := CreateTokens(&user)
		if err != nil {
			return c.SendStatus(fiber.StatusInternalServerError)
		}

		return c.JSON(fiber.Map{
			"status":  "success",
			"message": "Success login",
			"user": fiber.Map{
				"id":    user.ID,
				"name":  user.Name,
				"email": user.Email,
				"role":  user.Role,
			},
			"tokens": fiber.Map{
				"access":  accessToken,
				"refresh": refreshToken,
			},
		})
	}

	return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{"status": "error", "message": "Error on refresh", "data": err.Error()})

}
