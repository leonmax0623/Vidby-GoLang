package models

import "gorm.io/gorm"

// PriceAdvantage struct
type PriceAdvantage struct {
	gorm.Model
	Parent string `gorm:"not null" json:"parent"`
	Text   string `gorm:"not null" json:"key"`
	Index  int    `gorm:"not null" json:"index"`
	Lang   string `gorm:"not null;default:en" json:"lang"`
}
