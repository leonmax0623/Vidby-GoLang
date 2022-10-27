package models

import "gorm.io/gorm"

// Advantages struct
type Advantages struct {
	gorm.Model
	Image    string `gorm:"not null" json:"image"`
	Title    string `gorm:"not null" json:"title"`
	Content  string `gorm:"not null" json:"content"`
	Language string `gorm:"not null" json:"lang"`
	Index    string `gorm:"not null" json:"index"`
}
