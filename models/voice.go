package models

type Voice struct {
	Id      uint   `gorm:"primarykey" json:"id"`
	Code    string `json:"language"`
	Name    string `json:"name"`
	Comment string `json:"comment"`
	Gender  string `json:"gender"`
}
