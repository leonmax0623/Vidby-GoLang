package models

import "gorm.io/gorm"

type Faq struct {
	gorm.Model
	Question string `gorm:"not null" json:"question"`
	Answer   string `gorm:"not null" json:"answer"`
	Language string `gorm:"not null" json:"language"`
}
