package lastmodify

import (
	"os"
	"path/filepath"
	"strings"

	"github.com/gofiber/fiber/v2"
)

func Content(c *fiber.Ctx) error {
	lang := c.Params("lang")
	pathToFiles := filepath.Join("content", lang)
	entries, err := os.ReadDir(pathToFiles)
	if err != nil {
		return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{"status": "error", "error": err.Error()})
	}

	filesLastModify := make(map[string]int64)
	for _, entry := range entries {
		if !entry.IsDir() {
			fileStat, err := os.Stat(filepath.Join(pathToFiles, entry.Name()))
			if err != nil {
				return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{"status": "error", "error": err.Error()})
			}
			filesLastModify[strings.TrimRight(entry.Name(), filepath.Ext(entry.Name()))] = fileStat.ModTime().Unix()
		}
	}

	return c.JSON(filesLastModify)
}
