package image

import (
	"fmt"
	"github.com/gofiber/fiber/v2"
	"log"
)

func UploadImage(c *fiber.Ctx) error {
	file, err := c.FormFile("image")

	if err != nil {
		log.Println("image upload error --> ", err)
		return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{"status": "error", "message": "Server error"})
	}

	imageName := c.FormValue("name")
	image := fmt.Sprintf("%s.png", imageName)

	err = c.SaveFile(file, fmt.Sprintf("./content/images/%s", image))
	imageUrl := fmt.Sprintf("/image/%s", image)

	if err != nil {
		log.Println("image save error --> ", err)
		return c.JSON(fiber.Map{"status": 500, "message": "Server error"})
	}

	return c.JSON(fiber.Map{"status": "success", "image": imageUrl})
}

func UploadIcon(c *fiber.Ctx) error {
	file, err := c.FormFile("image")

	if err != nil {
		log.Println("icon upload error --> ", err)
		return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{"status": "error", "message": "Server error"})
	}

	imageName := c.FormValue("name")
	image := fmt.Sprintf("%s.svg", imageName)

	err = c.SaveFile(file, fmt.Sprintf("./content/icons/%s", image))
	imageUrl := fmt.Sprintf("/icon/%s", image)

	if err != nil {
		log.Println("image save error --> ", err)
		return c.JSON(fiber.Map{"status": 500, "message": "Server error"})
	}

	return c.JSON(fiber.Map{"status": "success", "image": imageUrl})
}
