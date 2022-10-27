package roles

import (
	"github.com/gofiber/fiber/v2"
	"github.com/lib/pq"
	log "github.com/sirupsen/logrus"
	"golang.org/x/exp/slices"
	"main/config"
	"main/database"
	"main/dtos"
	"main/models"
	"main/validators"
)

func CreateRole(c *fiber.Ctx) error {
	userID := c.Locals("userID").(uint)
	isRoot := c.Locals("isRoot").(bool)

	// Extract payload
	var payload Payload
	if err := c.BodyParser(&payload); err != nil {
		log.Error(err)
		return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{"message": "Invalid payload"})
	}

	// validate payload
	if errs := validators.ValidatePayload(payload); errs != nil {
		return c.Status(fiber.StatusBadRequest).JSON(errs)
	}

	// only root have permission to create user, that have permission to create other users
	if slices.Contains(payload.Permissions, config.WriteUsersPermission) && !isRoot {
		log.Warn("Creator can't add role with users/write permission")
		return c.Status(fiber.StatusForbidden).JSON(fiber.Map{
			"status":  "forbidden",
			"message": "Creator can't add role with users/write permission",
		})
	}

	// create role
	role := models.UserRole{
		UserIds:     pq.Int64Array{},
		Permissions: payload.Permissions,
		Name:        payload.Name,
		Hierarchy:   payload.Hierarchy,
		CreatedById: int(userID),
		UpdatedById: int(userID),
	}
	database.DB.Create(&role)

	// return created role
	return c.Status(fiber.StatusOK).JSON(fiber.Map{
		"status":  "success",
		"message": "role created",
		"role": dtos.UserRole{
			Id:          int(role.ID),
			Users:       make([]dtos.UserWithoutRole, 0),
			Permissions: role.Permissions,
			Name:        role.Name,
			Hierarchy:   role.Hierarchy,
		},
	})
}
