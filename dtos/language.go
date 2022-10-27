package dtos

import "main/models"

type LanguageDto struct {
	Id       int    `json:"id"`
	Code     string `json:"code"`
	Language string `json:"language"`
}

func LanguageToDto(models *[]models.Language) []LanguageDto {
	var languages []LanguageDto
	for _, raw := range *models {
		languages = append(languages, LanguageDto{Id: int(raw.ID), Code: raw.Code, Language: raw.Language})
	}
	return languages
}

type SourceLanguageDto struct {
	Id       int     `json:"id"`
	Code     string  `json:"code"`
	Language string  `json:"language"`
	Price    float64 `json:"price"`
}

func SourceLanguageToDto(models *[]models.SourceLanguage) []SourceLanguageDto {
	var languages []SourceLanguageDto
	for _, raw := range *models {
		languages = append(languages, SourceLanguageDto{
			Id:       int(raw.ID),
			Code:     raw.Code,
			Language: raw.Language,
			Price:    raw.Price,
		})
	}
	return languages
}

type WebsiteLanguagePayload struct {
	Code     string `json:"code" validate:"required"`
	Language string `json:"language" validate:"required"`
}
