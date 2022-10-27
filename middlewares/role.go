package middlewares

import (
	"fmt"
	"main/database"
	"main/models"

	"github.com/gofiber/fiber/v2"
	log "github.com/sirupsen/logrus"
	"golang.org/x/exp/slices"
)

func RoleRestricted(permissions ...string) fiber.Handler {
	return func(c *fiber.Ctx) error {
		// extract user id
		userID := c.Locals("userID")

		// get user
		var user models.User
		database.DB.Find(&user, userID)
		if user.Name == "" {
			log.Warn("user with id=", userID, " not found")
			return c.Status(fiber.StatusNotFound).JSON(fiber.Map{
				"status":  "not-found",
				"message": fmt.Sprintf("user with id=%s not found", userID),
			})
		}

		// get user role
		var userRole models.UserRole
		database.DB.Find(&userRole, user.Role)
		if userRole.Name == "" {
			log.Warn("role with id=", user.Role, " not found")
			return c.Status(fiber.StatusNotFound).JSON(fiber.Map{
				"status":  "not-found",
				"message": fmt.Sprintf("role with id=%d not found", user.Role),
			})
		}

		// check is root
		if userRole.ID == 1 {
			c.Locals("isRoot", true)
			return c.Next()
		} else {
			c.Locals("isRoot", false)
		}

		// check is user has access to this resource
		for _, permission := range permissions {
			if slices.Contains(userRole.Permissions, permission) {
				return c.Next()
			}
		}

		log.Warn("user with id=", userID, " have no access to ", permissions)
		return c.Status(fiber.StatusForbidden).JSON(fiber.Map{
			"status":  "forbidden",
			"message": fmt.Sprintf("user with id=%d have no access to %s", userID, permissions),
		})

	}
}
