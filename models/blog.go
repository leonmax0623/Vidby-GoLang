package models

type BlogArticlePreview struct {
	Url         string `gorm:"primaryKey;not null" json:"url"`
	Title       string `gorm:"not null" json:"title"`
	Author      string `json:"author"`
	Created     int64  `gorm:"autoCreateTime" json:"created"`
	Description string `json:"description"`
	Picture     string `json:"picture"`
}

type BlogArticle struct {
	BlogArticlePreview
	Content        string `gorm:"not null" json:"content"`
	Tags           string `json:"tags"`
	SeoTitle       string `json:"seo-title"`
	SeoDescription string `json:"seo-description"`
}

type Blog struct {
	BlogArticle
	Language string `gorm:"primaryKey;not null" json:"language"`
	Updated  int64  `gorm:"autoUpdateTime"`
}
