package models

import "gorm.io/gorm"

type Review struct {
	gorm.Model
	AuthorProfilePicture string `gorm:"not null" json:"author-profile-picture"`
	AuthorName           string `gorm:"not null" json:"author-name"`
	AuthorProfession     string `gorm:"not null" json:"author-profession"`
	AuthorCompany        string `gorm:"not null" json:"author-company"`
	AuthorCompanyUrl     string `gorm:"not null" json:"author-company-url"`
	Stars                int    `gorm:"not null" json:"stars"`
	Content              string `gorm:"not null" json:"content"`
	FullContentUrl       string `json:"full-content-url"`
	Lang                 string `gorm:"not null;default:en" json:"lang"`
}
