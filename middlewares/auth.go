package middlewares

import (
	"github.com/gofiber/fiber/v2"
	jwtware "github.com/gofiber/jwt/v2"
	"github.com/golang-jwt/jwt/v4"
	"main/config"
	"main/database"
	"main/models"
	"os"
)

// Protected protect routes
func Protected() fiber.Handler {
	return jwtware.New(jwtware.Config{
		SigningKey:     []byte(os.Getenv(config.SECRET_ACCESS)),
		ErrorHandler:   jwtError,
		SuccessHandler: extractUserID,
	})
}

// AdminProtected protect routes (only for admin)
func AdminProtected() fiber.Handler {
	return jwtware.New(jwtware.Config{
		SigningKey:     []byte(os.Getenv(config.SECRET_ACCESS)),
		ErrorHandler:   jwtError,
		SuccessHandler: isAdmin,
	})
}

func isAdmin(c *fiber.Ctx) error {
	// Extract id from jwt
	jwtUser := c.Locals("user").(*jwt.Token)
	claims := jwtUser.Claims.(jwt.MapClaims)
	id := claims["id"].(float64)

	// get user by id
	var user models.User
	database.DB.Find(&user, id)

	// check role
	// TODO
	//if user.Role == "admin" || user.Role == "superuser" {
	//	return c.Next()
	//}

	return c.Status(fiber.StatusForbidden).JSON(fiber.Map{
		"status":  "error",
		"message": "Only admins can access this route",
	})
}

func extractUserID(c *fiber.Ctx) error {
	// Extract id from jwt
	jwtUser := c.Locals("user").(*jwt.Token)
	claims := jwtUser.Claims.(jwt.MapClaims)
	id := claims["id"].(float64)
	c.Locals("userID", uint(id))
	return c.Next()
}

func jwtError(c *fiber.Ctx, err error) error {
	if err.Error() == "Missing or malformed JWT" {
		return c.Status(fiber.StatusBadRequest).
			JSON(fiber.Map{"status": "error", "message": "Missing or malformed JWT", "data": nil})
	}
	return c.Status(fiber.StatusUnauthorized).
		JSON(fiber.Map{"status": "error", "message": "Invalid or expired JWT", "data": nil})
}
