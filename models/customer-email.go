package models

import "gorm.io/gorm"

type CustomerEmail struct {
	gorm.Model
	Email    string `gorm:"not null" json:"email"`
	Source   string `gorm:"not null" json:"source"`
	Language string `gorm:"not null" json:"language"`
}
