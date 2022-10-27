package blog

import (
	"main/database"

	"github.com/gofiber/fiber/v2"
)

func GetBlogArticlePreviews(c *fiber.Ctx) error {
	lang := c.Params("lang")

	blogPreviews, err := database.GetBlogArticlePreviews(lang)
	if err != nil {
		return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{"status": "error", "error": err.Error()})
	}
	return c.JSON(blogPreviews)
}

func GetBlogArticle(c *fiber.Ctx) error {
	lang := c.Params("lang")
	url := c.Params("url")

	blogArticle, err := database.GetBlogArticle(lang, url)
	if err != nil {
		return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{"status": "error", "error": err.Error()})
	}

	return c.JSON(blogArticle)
}

func UpdateBlogArticle(c *fiber.Ctx) error {
	lang := c.Params("lang")
	url := c.Params("url")

	if err := database.UpdateBlogArticle(c.Body(), lang, url); err != nil {
		return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{"status": "error", "error": err.Error()})
	}
	return c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "Successfully update article"})
}

func DeleteBlogArticle(c *fiber.Ctx) error {
	lang := c.Params("lang")
	url := c.Params("url")

	if err := database.DeleteBlogArticle(lang, url); err != nil {
		return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{"status": "error", "error": err.Error()})
	}
	return c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "Successfully delete article"})
}
