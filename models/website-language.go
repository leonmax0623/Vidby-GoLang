package models

import "gorm.io/gorm"

type WebsiteLanguage struct {
	gorm.Model
	Code      string `gorm:"unique;not null" json:"code"`
	Language  string `gorm:"not null" json:"language"`
	Available bool   `gorm:"not null" json:"available"`
}
