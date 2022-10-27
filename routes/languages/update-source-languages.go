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
	"golang.org/x/exp/slices"
)

type SourceLanguage struct {
	Code  string `json:"language"`
	Price int    `json:"price"`
}

type SourceLanguageResponse struct {
	Id       int     `json:"id"`
	Code     string  `json:"code"`
	Language string  `json:"language"`
	Price    float64 `json:"price"`
}

func UpdateSourceLanguages(c *fiber.Ctx) error {
	response, err := http.Get("https://vidby.com/api/v1/cs/prices/")

	if err != nil {
		return c.Status(500).JSON(&fiber.Map{
			"status":  "error",
			"message": "Failed to call vidby api",
			"error":   err.Error(),
		})
	}

	responseData, err := ioutil.ReadAll(response.Body)
	if err != nil {
		return c.Status(500).JSON(&fiber.Map{
			"status":  "error",
			"message": "Failed to parse vidby response",
			"error":   err.Error(),
		})
	}

	var languagesResponse []SourceLanguage
	err = json.Unmarshal(responseData, &languagesResponse)
	if err != nil {
		return c.Status(500).JSON(&fiber.Map{
			"status":  "error",
			"message": "Failed to parse vidby response",
			"error":   err.Error(),
		})
	}

	availableLanguages, _, err := SaveAvailableLanguages()

	var languages []SourceLanguageResponse
	for _, rawLanguage := range languagesResponse {
		index := slices.IndexFunc(
			*availableLanguages,
			func(lang AvailableLanguageResponse) bool { return lang.Code == rawLanguage.Code },
		)
		lang := (*availableLanguages)[index]
		price := float64(rawLanguage.Price) / 100.0

		language := models.SourceLanguage{Language: lang.Language, Code: lang.Code, Price: price}
		err := database.DB.Create(&language).Error
		if err != nil {
			var pgError *pgconn.PgError
			errors.As(err, &pgError)
			if pgError.Code == "23505" {
				database.DB.Model(&language).Where("code = ?", language.Code).Update("language", language.Language)
				database.DB.Where("code = ?", language.Code).First(&language)
			}
		}

		languages = append(languages, SourceLanguageResponse{
			Id:       int(language.ID),
			Code:     lang.Code,
			Language: lang.Language,
			Price:    price,
		})
	}

	// set last update time
	lastUpdateTime := time.Now().Format(time.RFC3339)
	lastUpdateTimeModel := models.UpdateHistory{Date: lastUpdateTime, Parent: "sources-languages"}
	database.DB.Create(&lastUpdateTimeModel)

	return c.Status(fiber.StatusCreated).JSON(fiber.Map{
		"status":      "success",
		"message":     "Update source languages",
		"languages":   languages,
		"last-update": lastUpdateTime,
	})
}
