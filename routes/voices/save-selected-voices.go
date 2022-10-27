package voices

import (
	"encoding/json"
	"fmt"
	"main/database"
	"main/models"
	"strings"

	"github.com/gofiber/fiber/v2"
	"golang.org/x/exp/rand"
)

type SaveSelectedVoicesPayload = struct {
	Ids        []int64        `json:"ids"`
	Comments   map[int]string `json:"comments"`
	Languages  []string       `json:"languages"`
	Genders    []string       `json:"genders"`
	Favourites []string       `json:"favourites"`
}

func SaveSelectedVoices(c *fiber.Ctx) error {

	var payload SaveSelectedVoicesPayload
	if err := c.BodyParser(&payload); err != nil {
		return c.Status(400).JSON(fiber.Map{"status": "error", "message": "Invalid payload", "data": err.Error()})
	}

	comments, err := json.Marshal(payload.Comments)
	if err != nil {
		return c.Status(400).JSON(fiber.Map{"status": "error", "message": "Invalid comments", "data": err.Error()})
	}

	id := rand.Intn(10000000)
	fmt.Println(id)
	model := models.SelectedVoices{
		UniqueID:   id,
		Voices:     payload.Ids,
		Comments:   string(comments),
		Languages:  strings.Join(payload.Languages, ","),
		Genders:    strings.Join(payload.Genders, ","),
		Favourites: strings.Join(payload.Favourites, ","),
	}
	result := database.DB.Create(&model)
	if result.Error != nil {
		fmt.Println(result.Error)
	}

	return c.JSON(fiber.Map{"id": model.UniqueID})
}
