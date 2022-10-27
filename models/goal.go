package models

import "gorm.io/gorm"

type Goal struct {
	gorm.Model
	Date     string `gorm:"not null" json:"date"`
	Achieved bool   `gorm:"not null" json:"achieved"`
	Text     string `gorm:"not null" json:"text"`
	Selected bool   `gorm:"not null" json:"selected"`
	Lang     string `gorm:"not null" json:"lang"`
}
