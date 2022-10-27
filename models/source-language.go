package models

import "gorm.io/gorm"

type SourceLanguage struct {
	gorm.Model
	Code     string  `gorm:"unique;not null" json:"code"`
	Language string  `gorm:"not null" json:"language"`
	Price    float64 `gorm:"not null" json:"price"`
}
