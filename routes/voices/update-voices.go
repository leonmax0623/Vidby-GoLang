package voices

import (
	"encoding/json"
	"errors"
	"github.com/gofiber/fiber/v2"
	"github.com/jackc/pgconn"
	"io/ioutil"
	"main/database"
	"main/models"
	"net/http"
	"time"
)

func UpdateVoices(c *fiber.Ctx) error {
	// perform request
	response, err := http.Get("https://vidby.com/api/v1/tts/voices/")
	if err != nil {
		return err
	}

	// read body
	responseData, err := ioutil.ReadAll(response.Body)
	if err != nil {
		return err
	}

	// parse json
	var raw []models.Voice
	err = json.Unmarshal(responseData, &raw)
	if err != nil {
		return err
	}

	voices := make([]Voice, 0)
	for _, voice := range raw {
		err := database.DB.Create(&voice).Error
		if err != nil {
			var pgError *pgconn.PgError
			errors.As(err, &pgError)
			if pgError.Code == "23505" {
				go database.DB.Model(&voice).Where("id = ?", voice.Id).Updates(models.Voice{
					Code:   voice.Code,
					Name:   voice.Name,
					Gender: voice.Gender,
				})
			}
		}

		voices = append(voices, Voice{
			Id:      int(voice.Id),
			Code:    voice.Code,
			Name:    voice.Name,
			Gender:  voice.Gender,
			Comment: voice.Comment,
		})
	}

	// set last update time
	lastUpdateTime := time.Now().Format(time.RFC3339)
	lastUpdateTimeModel := models.UpdateHistory{Date: lastUpdateTime, Parent: "voices"}
	database.DB.Create(&lastUpdateTimeModel)

	return c.Status(fiber.StatusCreated).JSON(fiber.Map{
		"status":      "success",
		"message":     "Update raw",
		"voices":      voices,
		"last-update": lastUpdateTime,
	})
}
