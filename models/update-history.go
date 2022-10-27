package models

type UpdateHistory struct {
	Date   string `gorm:"not null" json:"date"`
	Parent string `gorm:"not null" json:"parent"`
}
