package models

import "gorm.io/gorm"

type Language struct {
	gorm.Model
	Code     string `gorm:"not null;unique" json:"code"`
	Language string `gorm:"not null" json:"language"`
	Icon     string `gorm:"not null" json:"icon"`
}
