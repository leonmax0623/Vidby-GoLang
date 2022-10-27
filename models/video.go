package models

import "gorm.io/gorm"

type Video struct {
	gorm.Model
	LanguageCode string `json:"language"`
	Source       string `gorm:"not null" json:"source"`
	Preview      string `gorm:"" json:"preview"`
}
