package dtos

import "main/models"

type WebsiteLanguage struct {
	Id        int    `json:"id"`
	Code      string `json:"code"`
	Language  string `json:"language"`
	Available bool   `json:"available"`
}

func WebsiteLanguageDto(languages *[]models.WebsiteLanguage) []WebsiteLanguage {
	var langs []WebsiteLanguage
	for _, lang := range *languages {
		langs = append(langs, WebsiteLanguage{
			Id:        int(lang.ID),
			Code:      lang.Code,
			Language:  lang.Language,
			Available: lang.Available,
		})
	}
	return langs
}
