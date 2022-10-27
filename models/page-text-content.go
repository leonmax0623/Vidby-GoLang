package models

import "gorm.io/gorm"

type PageTextContent struct {
	gorm.Model
	JsonPath string `gorm:"not null" json:"json-path"`
	Parent   string `gorm:"not null" json:"parent"`
	Content  string `gorm:"not null" json:"content"`
	Language string `gorm:"not null" json:"language"`
}

type PageRepeatedTextContent struct {
	gorm.Model
	JsonPath string `gorm:"not null" json:"json-path"`
	Parent   string `gorm:"not null" json:"parent"`
	Content  string `gorm:"not null" json:"content"`
	Language string `gorm:"not null" json:"language"`
	Index    int    `gorm:"not null;default:0" json:"index"`
}
