package database

import (
	"encoding/json"
	"errors"
	"fmt"
	"io/ioutil"
	"main/models"
	"os"

	"github.com/gofiber/fiber/v2"
	log "github.com/sirupsen/logrus"
)

func OpenJson(path string) (fiber.Map, error) {
	jsonFile, err := os.Open(path)
	if err != nil {
		return nil, err
	}
	defer func(jsonFile *os.File) {
		err := jsonFile.Close()
		if err != nil {
			fmt.Println("Failed to close content")
		}
	}(jsonFile)
	byteValue, _ := ioutil.ReadAll(jsonFile)
	jsonContent := fiber.Map{}
	err = json.Unmarshal(byteValue, &jsonContent)
	if err != nil {
		return nil, err
	}

	return jsonContent, nil
}

func OpenContent(lang string, key string) (fiber.Map, error) {
	return OpenJson(fmt.Sprintf("content/%s/%s.json", lang, key))
}

func OpenScripts() (fiber.Map, error) {
	return OpenJson("content/scripts.json")
}

func OpenMainContent(lang string, key string) (fiber.Map, error) {
	// Open header
	header, err := OpenContent(lang, "header")
	if err != nil {
		return nil, err
	}

	// open footer
	footer, err := OpenContent(lang, "footer")
	if err != nil {
		return nil, err
	}

	// get available languages
	var langs []models.WebsiteLanguage
	DB.Find(&langs)

	// extract selected & available language
	var selected fiber.Map
	available := make([]fiber.Map, 0)
	for _, l := range langs {
		if l.Code == lang {
			selected = fiber.Map{
				"code":     l.Code,
				"language": l.Language,
			}
		} else {
			available = append(available, fiber.Map{
				"code":     l.Code,
				"language": l.Language,
			})
		}
	}

	if selected == nil {
		log.Error("can't find this language")
		return nil, errors.New("can't find this language")
	}

	footer["available-languages"] = fiber.Map{
		"selected": selected,
		"items":    available,
	}

	// open main page content
	page, err := OpenContent(lang, key)
	if err != nil {
		return nil, err
	}

	// Apply header, footer & scripts
	page["header"] = header
	page["footer"] = footer

	return page, nil
}

func SaveContent(lang string, key string, content interface{}) error {
	file, err := json.MarshalIndent(content, "", "  ")
	if err != nil {
		log.Error(err)
		return err
	}

	err = ioutil.WriteFile(fmt.Sprintf("content/%s/%s.json", lang, key), file, 0644)
	if err != nil {
		log.Error(err)
		return err
	}

	return nil
}
