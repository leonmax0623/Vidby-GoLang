package admin

import (
	"github.com/gofiber/fiber/v2"
	"main/database"
	"main/dtos"
	"main/models"
)

type User struct {
	Id    int                        `json:"id"`
	Name  string                     `json:"name"`
	Email string                     `json:"email"`
	Role  *dtos.UserRoleWithoutUsers `json:"role"`
}

func GetUsers(c *fiber.Ctx) error {
	var users []models.User
	database.DB.Find(&users)

	var userDtos []User
	for _, user := range users {
		// get role
		var role models.UserRole
		database.DB.Find(&role, user.Role)

		var userRole *dtos.UserRoleWithoutUsers
		if role.Name != "" {
			userRole = &dtos.UserRoleWithoutUsers{
				Id:          user.Role,
				Permissions: role.Permissions,
				Name:        role.Name,
				Hierarchy:   role.Hierarchy,
			}
		}

		userDtos = append(userDtos, User{
			Id:    int(user.ID),
			Name:  user.Name,
			Email: user.Email,
			Role:  userRole,
		})
	}

	return c.Status(200).JSON(fiber.Map{
		"status":  "success",
		"message": "Get users",
		"users":   userDtos,
	})
}
