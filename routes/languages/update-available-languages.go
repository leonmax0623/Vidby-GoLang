package languages

import (
	"encoding/json"
	"errors"
	"io/ioutil"
	"main/database"
	"main/models"
	"net/http"
	"time"

	"github.com/gofiber/fiber/v2"
	"github.com/jackc/pgconn"
)

type AvailableLanguage struct {
	Code     string `json:"language"`
	Language string `json:"language_name"`
}

type AvailableLanguageResponse struct {
	Id       int    `json:"id"`
	Code     string `json:"code"`
	Language string `json:"language"`
}

func UpdateAvailableLanguages(c *fiber.Ctx) error {
	languages, lastUpdateTime, err := SaveAvailableLanguages()

	if err != nil {
		return c.Status(500).JSON(&fiber.Map{
			"status":  "error",
			"message": "Failed to update available languages",
			"error":   err.Error(),
		})
	}

	return c.Status(fiber.StatusCreated).JSON(fiber.Map{
		"status":      "success",
		"message":     "Update languages",
		"languages":   languages,
		"last-update": lastUpdateTime,
	})
}

func SaveAvailableLanguages() (*[]AvailableLanguageResponse, string, error) {
	response, err := http.Get("https://vidby.com/api/v1/languages/")

	if err != nil {
		return nil, "", err
	}

	responseData, err := ioutil.ReadAll(response.Body)
	if err != nil {
		return nil, "", err
	}

	var languagesResponse []AvailableLanguage
	err = json.Unmarshal(responseData, &languagesResponse)
	if err != nil {
		return nil, "", err
	}

	var languages []AvailableLanguageResponse
	for _, raw := range languagesResponse {
		language := models.Language{Language: raw.Language, Code: raw.Code}
		err := database.DB.Create(&language).Error
		if err != nil {
			var pgError *pgconn.PgError
			errors.As(err, &pgError)
			if pgError.Code == "23505" {
				database.DB.Model(&language).Where("code = ?", language.Code).Update("language", language.Language)
				database.DB.Where("code = ?", language.Code).First(&language)
			}
		}

		languages = append(languages, AvailableLanguageResponse{
			Id:       int(language.ID),
			Code:     language.Code,
			Language: language.Language,
		})
	}

	// set last update time
	lastUpdateTime := time.Now().Format(time.RFC3339)
	lastUpdateTimeModel := models.UpdateHistory{Date: lastUpdateTime, Parent: "available-languages"}
	database.DB.Create(&lastUpdateTimeModel)

	return &languages, lastUpdateTime, nil
}
