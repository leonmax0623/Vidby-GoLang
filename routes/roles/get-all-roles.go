package roles

import (
	"github.com/gofiber/fiber/v2"
	"main/database"
	"main/dtos"
	"main/models"
)

func GetAllRoles(c *fiber.Ctx) error {
	// Extract raw user roles
	var raw []models.UserRole
	database.DB.Where("id != ?", 1).Order("hierarchy asc").Find(&raw)

	// Foreach user role fetch new role
	roles := make([]dtos.UserRole, 0)
	for _, model := range raw {
		var rawUsers []models.User
		database.DB.Where("role = ?", model.ID).Find(&rawUsers)

		users := make([]dtos.UserWithoutRole, 0)
		for _, userModel := range rawUsers {
			users = append(users, dtos.UserWithoutRole{
				Email: userModel.Email,
				Name:  userModel.Name,
			})
		}

		roles = append(roles, dtos.UserRole{
			Id:          int(model.ID),
			Users:       users,
			Permissions: model.Permissions,
			Name:        model.Name,
			Hierarchy:   model.Hierarchy,
		})
	}

	return c.Status(fiber.StatusOK).JSON(fiber.Map{
		"status":  "success",
		"message": "fetch all roles",
		"roles":   roles,
	})
}
