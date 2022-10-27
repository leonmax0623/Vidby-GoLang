package image

import (
	"fmt"
	"github.com/gofiber/fiber/v2"
	"log"
	"os"
)

func DeleteImage(c *fiber.Ctx) error {
	imageName := c.Params("name")

	err := os.Remove(fmt.Sprintf("./content/images/%s.png", imageName))
	if err != nil {
		log.Println("image delete error --> ", err)
		return c.JSON(fiber.Map{"status": 500, "message": "Server error"})
	}

	return c.JSON(fiber.Map{"status": "success"})
}

func DeleteIcon(c *fiber.Ctx) error {
	imageName := c.Params("name")

	err := os.Remove(fmt.Sprintf("./content/icons/%s.svg", imageName))
	if err != nil {
		log.Println("image delete error --> ", err)
		return c.JSON(fiber.Map{"status": 500, "message": "Server error"})
	}

	return c.JSON(fiber.Map{"status": "success"})
}
