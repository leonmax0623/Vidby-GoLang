package database

import (
	"encoding/json"
	"fmt"
	"main/models"

	"gorm.io/gorm/clause"
)

func GetBlogArticlePreviews(lang string) ([]models.BlogArticlePreview, error) {
	var raw []models.Blog
	var blogPreviews []models.BlogArticlePreview
	if result := DB.Where("language = ?", lang).Order("created DESC").Find(&raw); result.Error != nil {
		return blogPreviews, fmt.Errorf("get blog article previews: %w", result.Error)
	}

	for _, val := range raw {
		blogPreviews = append(blogPreviews, models.BlogArticlePreview{
			Url:         val.Url,
			Title:       val.Title,
			Author:      val.Author,
			Created:     val.Created,
			Description: val.Description,
			Picture:     val.Picture,
		})
	}
	return blogPreviews, nil
}

func GetBlogArticle(lang string, url string) (models.BlogArticle, error) {
	var raw models.Blog
	var blogArticles models.BlogArticle
	if result := DB.Where("language = ? and url = ?", lang, url).First(&raw); result.Error != nil {
		return blogArticles, fmt.Errorf("get blog article: %w", result.Error)
	}

	blogArticles = models.BlogArticle{
		BlogArticlePreview: models.BlogArticlePreview{
			Url:         raw.Url,
			Title:       raw.Title,
			Author:      raw.Author,
			Created:     raw.Created,
			Description: raw.Description,
			Picture:     raw.Picture,
		},
		Content:        raw.Content,
		Tags:           raw.Tags,
		SeoTitle:       raw.SeoTitle,
		SeoDescription: raw.SeoDescription,
	}

	return blogArticles, nil
}

func UpdateBlogArticle(data []byte, lang string, url string) error {
	var newArticle models.Blog
	if err := json.Unmarshal(data, &newArticle); err != nil {
		return fmt.Errorf("unmarshal %w", err)
	}

	switch {
	case newArticle.Title == "":
		return fmt.Errorf("empty title")
	case newArticle.Content == "":
		return fmt.Errorf("empty content")
	}

	newArticle.Language = lang
	newArticle.Url = url

	if result := DB.Clauses(clause.OnConflict{
		Columns:   []clause.Column{{Name: "url"}, {Name: "language"}},
		UpdateAll: true,
	}).Create(&newArticle); result.Error != nil {
		return fmt.Errorf("create new article in db: %w", result.Error)
	}
	return nil
}

func DeleteBlogArticle(lang string, url string) error {
	if result := DB.Where("language = ? and url = ?", lang, url).Unscoped().Delete(&models.Blog{}); result.Error != nil {
		return fmt.Errorf("delete article in db: %w", result.Error)
	}
	return nil
}
