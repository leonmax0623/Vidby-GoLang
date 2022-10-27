package models

import (
	"main/database"
	"main/models"

	"github.com/gofiber/fiber/v2"
)

func CreateVideoExample(c *fiber.Ctx) error {

	// extract review
	var videoExample database.VideoExample
	if err := c.BodyParser(&videoExample); err != nil {
		return c.Status(500).JSON(fiber.Map{"status": "error", "message": "Invalid review", "data": err.Error()})
	}

	// creating origin
	originVideo := models.Video{
		LanguageCode: videoExample.Original.Language.Code,
		Source:       videoExample.Original.Source,
		Preview:      videoExample.Original.Preview,
	}
	database.DB.Create(&originVideo)

	// creating translated videos
	var translatedVideosIds []int64
	var translatedVideos []models.Video
	for _, video := range videoExample.Translated {
		translated := models.Video{
			LanguageCode: video.Language.Code,
			Source:       video.Source,
			Preview:      video.Preview,
		}
		database.DB.Create(&translated)
		translatedVideosIds = append(translatedVideosIds, int64(translated.ID))
		translatedVideos = append(translatedVideos, translated)
	}

	example := models.VideoExample{
		OriginalID:    int(originVideo.ID),
		TranslatedIDs: translatedVideosIds,
		Page:          "main/customers",
		CompanyLogo:   videoExample.CompanyLogo,
		Index:         videoExample.Index,
	}
	database.DB.Create(&example)

	return c.Status(fiber.StatusOK).JSON(fiber.Map{
		"message": "Successfully create new video example",
		"video": fiber.Map{
			"id":           int(videoExample.Index),
			"original":     originVideo,
			"translated":   translatedVideos,
			"company-logo": videoExample.CompanyLogo,
			"index":        videoExample.Index,
		},
	})
}

func DeleteVideoExample(c *fiber.Ctx) error {
	id := c.Params("id")

	database.DB.Delete(&models.VideoExample{}, id)

	return c.Status(fiber.StatusOK).JSON(fiber.Map{
		"message": "Successfully remove video example",
	})
}

func UpdateVideoExample(c *fiber.Ctx) error {
	id := c.Params("id")

	// extract review
	var videoExample database.VideoExample
	if err := c.BodyParser(&videoExample); err != nil {
		return c.Status(500).JSON(fiber.Map{"status": "error", "message": "Invalid video", "data": err.Error()})
	}

	updatedModel := models.VideoExample{
		CompanyLogo: videoExample.CompanyLogo,
		Index:       videoExample.Index,
	}

	var model models.VideoExample
	database.DB.First(&model, id)
	database.DB.Model(&model).Select("company_logo", "index").Updates(updatedModel)

	var originVideo models.Video
	database.DB.First(&originVideo, model.OriginalID)

	var translatedVideos []models.Video
	for _, id := range model.TranslatedIDs {
		var translatedVideo models.Video
		database.DB.First(&translatedVideo, id)
		translatedVideos = append(translatedVideos, translatedVideo)
	}

	return c.Status(fiber.StatusOK).JSON(fiber.Map{
		"message": "Successfully create new video example",
		"video": fiber.Map{
			"id":           int(videoExample.Index),
			"original":     originVideo,
			"translated":   translatedVideos,
			"company-logo": videoExample.CompanyLogo,
			"index":        videoExample.Index,
		},
	})
}
