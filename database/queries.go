package database

import (
	"golang.org/x/exp/slices"
	"main/dtos"
	"main/models"
	"regexp"
	"sort"
)

type ColorfulText struct {
	Content string `json:"content"`
	Color   string `json:"color"`
}

func GetColorfulText(parent string, lang string) []ColorfulText {
	var colorfulText []models.ColorfulText
	DB.Where("parent = ? AND lang = ?", parent, lang).Order("index asc").Find(&colorfulText)
	var dtos []ColorfulText
	for _, colorfulText := range colorfulText {
		dtos = append(dtos, ColorfulText{Content: colorfulText.Content, Color: colorfulText.Color})
	}
	return dtos
}

type Advantage struct {
	Image   string `json:"image"`
	Title   string `json:"title"`
	Content string `json:"content"`
}

func GetAdvantages(lang string) []Advantage {
	var advantages []models.Advantages
	DB.Where("language = ?", lang).Order("index asc").Find(&advantages)

	var ans []Advantage
	for _, advantage := range advantages {
		ans = append(ans, Advantage{
			Image:   advantage.Image,
			Title:   advantage.Title,
			Content: advantage.Content,
		})
	}

	return ans
}

type Language struct {
	Language string `json:"language"`
	Code     string `json:"code"`
	Icon     string `json:"icon"`
}

type Video struct {
	Language Language `json:"language"`
	Source   string   `json:"source"`
	Preview  string   `json:"preview"`
}

type VideoExample struct {
	Original    Video   `json:"original"`
	Translated  []Video `json:"translated"`
	CompanyLogo string  `json:"company_logo"`
	Index       int
}

func GetVideoExamples(page string) []VideoExample {
	var videoExamples []models.VideoExample
	DB.Where("page = ?", page).Order("index asc").Find(&videoExamples)

	var dtos []VideoExample
	for _, example := range videoExamples {
		var translated []Video
		var translatedModels []models.Video
		DB.Where("id IN ?", []int64(example.TranslatedIDs)).Find(&translatedModels)

		for _, video := range translatedModels {
			var language models.Language
			DB.Where("code = ?", video.LanguageCode).First(&language)

			shortLangRegEx := regexp.MustCompile(`/*\([^)]*\)*/g`)

			translated = append(translated, Video{
				Language: Language{
					Language: shortLangRegEx.ReplaceAllString(language.Language, ""),
					Code:     language.Code,
					Icon:     language.Icon,
				},
				Source:  video.Source,
				Preview: video.Preview,
			})
		}

		var original models.Video
		DB.Where("id = ?", example.OriginalID).First(&original)

		var language Language
		DB.Where("code = ?", original.LanguageCode).First(&language)

		dtos = append(dtos, VideoExample{
			Original: Video{
				Language: Language{
					Language: language.Language,
					Code:     language.Code,
					Icon:     language.Icon,
				},
				Source:  original.Source,
				Preview: original.Preview,
			},
			Translated:  translated,
			CompanyLogo: example.CompanyLogo,
			Index:       example.Index,
		})
	}

	sort.SliceStable(dtos, func(i, j int) bool {
		return dtos[i].Index < dtos[j].Index
	})

	return dtos
}

func GetPriceAdvantages(price string, lang string) []string {
	var priceAdvantages []models.PriceAdvantage
	DB.Where("parent = ? AND lang = ?", price, lang).Order("index asc").Find(&priceAdvantages)

	var advantages []string
	for _, priceAdvantage := range priceAdvantages {
		advantages = append(advantages, priceAdvantage.Text)
	}

	return advantages
}

type Header struct {
	Products  string `json:"products.json"`
	Customers string `json:"customers"`
	Investors string `json:"investors"`
	AboutUs   string `json:"about_us"`
	Prices    string `json:"prices"`
	Login     string `json:"login"`
}

func PageTextContentByKey(content *[]models.PageTextContent, key string) string {
	index := slices.IndexFunc(
		*content,
		func(lang models.PageTextContent) bool { return lang.JsonPath == key },
	)
	if index == -1 {
		return ""
	}
	return (*content)[index].Content
}

func RepeatedPageTextContentByKey(raw *[]models.PageRepeatedTextContent, key string) []string {
	var content []string
	for _, val := range *raw {
		if val.JsonPath == key {
			content = append(content, val.Content)
		}
	}

	return content
}

func PageTextContentModelByKey(content *[]models.PageTextContent, key string) models.PageTextContent {
	index := slices.IndexFunc(
		*content,
		func(lang models.PageTextContent) bool { return lang.JsonPath == key },
	)
	return (*content)[index]
}

func UpdatePageTextContentModelByKey(content *[]models.PageTextContent, key string, text string) {
	model := PageTextContentModelByKey(content, key)
	DB.Model(&model).Update("content", text)
}

func GetMainHeader(lang string) Header {
	var content []models.PageTextContent
	DB.Where("parent = ? AND language = ?", "main/header", lang).Find(&content)
	return Header{
		Products:  PageTextContentByKey(&content, "header/products.json"),
		Customers: PageTextContentByKey(&content, "header/customers"),
		Investors: PageTextContentByKey(&content, "header/investors"),
		AboutUs:   PageTextContentByKey(&content, "header/about_us"),
		Prices:    PageTextContentByKey(&content, "header/prices"),
		Login:     PageTextContentByKey(&content, "header/login"),
	}
}

func GetWebsiteLanguages(source string) []dtos.WebsiteLanguage {
	var languages []models.WebsiteLanguage
	if source == "admin" {
		DB.Find(&languages)
	} else {
		DB.Where("available = ?", true).Find(&languages)
	}
	return dtos.WebsiteLanguageDto(&languages)
}

type Faq = struct {
	Id       int    `json:"id"`
	Question string `json:"question"`
	Answer   string `json:"answer"`
	Language string `json:"language"`
}

func GetFaqs(lang string) []Faq {
	var raw []models.Faq
	DB.Where("language = ?", lang).Find(&raw)
	var faq []Faq
	for _, val := range raw {
		faq = append(faq, Faq{
			Id:       int(val.ID),
			Question: val.Question,
			Answer:   val.Answer,
			Language: val.Language,
		})
	}
	return faq
}
