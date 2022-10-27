package models

import "gorm.io/gorm"

// ColorfulText struct
type ColorfulText struct {
	gorm.Model
	Lang    string `gorm:"not null" json:"lang"`
	Content string `gorm:"not null" json:"content"`
	Color   string `gorm:"not null" json:"color"`
	Parent  string `gorm:"not null" json:"parent"`
	Index   int    `gorm:"not null" json:"index"`
}
