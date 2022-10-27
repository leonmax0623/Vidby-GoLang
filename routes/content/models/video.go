package models

import (
	"main/database"
	"main/models"
	"strconv"

	"github.com/gofiber/fiber/v2"
)

func CreateVideo(c *fiber.Ctx) error {
	exampleId := c.Params("exampleId")

	// extract review
	var video database.Video
	if err := c.BodyParser(&video); err != nil {
		return c.Status(500).JSON(fiber.Map{"status": "error", "message": "Invalid video", "data": err.Error()})
	}

	// create model
	model := models.Video{
		LanguageCode: video.Language.Code,
		Source:       video.Source,
		Preview:      video.Preview,
	}
	database.DB.Create(&model)

	// connect to example
	var example models.VideoExample
	database.DB.First(&example, exampleId)
	database.DB.Model(&example).Update("translated", append(example.TranslatedIDs, int64(model.ID)))

	return c.Status(fiber.StatusOK).JSON(fiber.Map{
		"message": "Successfully create new video",
		"video":   model,
	})
}

func UpdateVideo(c *fiber.Ctx) error {
	id := c.Params("id")

	// extract review
	var video database.Video
	if err := c.BodyParser(&video); err != nil {
		return c.Status(500).JSON(fiber.Map{"status": "error", "message": "Invalid video", "data": err.Error()})
	}

	modelToUpdate := models.Video{
		LanguageCode: video.Language.Code,
		Source:       video.Source,
		Preview:      video.Preview,
	}
	var model models.Video
	database.DB.First(&model, id)
	database.DB.Model(&model).Select("language", "source", "preview").Updates(modelToUpdate)

	return c.Status(fiber.StatusOK).JSON(fiber.Map{
		"message": "Successfully update video",
		"video":   model,
	})
}

func DeleteVideo(c *fiber.Ctx) error {
	id, _ := strconv.Atoi(c.Params("id"))
	exampleId := c.Params("exampleId")

	database.DB.Delete(&models.Video{}, id)

	// remove from example
	var example models.VideoExample
	database.DB.First(&example, exampleId)

	var translated []int64
	for i, currId := range example.TranslatedIDs {
		if currId == int64(id) {
			translated = append(example.TranslatedIDs[:i], example.TranslatedIDs[i+1:]...)
		}
	}

	database.DB.Model(&example).Update("translated", translated)

	return c.Status(fiber.StatusOK).JSON(fiber.Map{
		"message": "Successfully delete video",
	})
}
