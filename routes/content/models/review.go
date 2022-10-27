package models

import (
	"main/database"
	"main/dtos"
	"main/models"

	"github.com/gofiber/fiber/v2"
)

func CreateReview(c *fiber.Ctx) error {
	lang := c.Params("lang")

	// extract review
	var review dtos.Review
	if err := c.BodyParser(&review); err != nil {
		return c.Status(500).JSON(fiber.Map{"status": "error", "message": "Invalid review", "data": err.Error()})
	}

	model := models.Review{
		AuthorProfilePicture: review.Author.ProfileImage,
		AuthorName:           review.Author.Name,
		AuthorProfession:     review.Author.Profession,
		AuthorCompany:        review.Author.Company.Company,
		AuthorCompanyUrl:     review.Author.Company.Url,
		Stars:                review.Stars,
		Content:              review.Content,
		FullContentUrl:       review.FullContentUrl,
		Lang:                 lang,
	}
	database.DB.Create(&model)

	return c.Status(fiber.StatusOK).JSON(fiber.Map{
		"message": "Successfully create customers new review",
		"review": fiber.Map{
			"id": model.ID,
			"author": fiber.Map{
				"profile-image": model.AuthorProfilePicture,
				"name":          model.AuthorName,
				"profession":    model.AuthorProfession,
				"company": fiber.Map{
					"company": model.AuthorCompany,
					"url":     model.AuthorCompanyUrl,
				},
			},
			"stars":            model.Stars,
			"content":          model.Content,
			"full-content-url": model.FullContentUrl,
		},
	})
}

func DeleteReview(c *fiber.Ctx) error {
	id := c.Params("id")

	database.DB.Delete(&models.Review{}, id)

	return c.Status(fiber.StatusOK).JSON(fiber.Map{
		"message": "Successfully remove review",
	})
}

func UpdateReview(c *fiber.Ctx) error {
	id := c.Params("id")

	// extract review
	var review dtos.Review
	if err := c.BodyParser(&review); err != nil {
		return c.Status(500).JSON(fiber.Map{"status": "error", "message": "Invalid review", "data": err.Error()})
	}

	updatedModel := models.Review{
		AuthorProfilePicture: review.Author.ProfileImage,
		AuthorName:           review.Author.Name,
		AuthorProfession:     review.Author.Profession,
		AuthorCompany:        review.Author.Company.Company,
		AuthorCompanyUrl:     review.Author.Company.Url,
		Stars:                review.Stars,
		Content:              review.Content,
		FullContentUrl:       review.FullContentUrl,
	}

	var model models.Review
	database.DB.First(&model, id)
	database.DB.Model(&model).Updates(updatedModel)

	return c.Status(fiber.StatusOK).JSON(fiber.Map{
		"message": "Successfully update review",
		"review": fiber.Map{
			"id": model.ID,
			"author": fiber.Map{
				"profile-image": model.AuthorProfilePicture,
				"name":          model.AuthorName,
				"profession":    model.AuthorProfession,
				"company": fiber.Map{
					"company": model.AuthorCompany,
					"url":     model.AuthorCompanyUrl,
				},
			},
			"stars":            model.Stars,
			"content":          model.Content,
			"full-content-url": model.FullContentUrl,
		},
	})
}
