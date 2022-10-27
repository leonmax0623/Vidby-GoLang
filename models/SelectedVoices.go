package models

import (
	"github.com/lib/pq"
	"gorm.io/gorm"
)

type SelectedVoices struct {
	gorm.Model
	UniqueID   int           `gorm:"unique" json:"unique_id"`
	Voices     pq.Int64Array `gorm:"type:integer[]" json:"translated"`
	Comments   string        `gorm:"default:''" json:"comments"`
	Languages  string        `gorm:"default:''" json:"languages"`
	Genders    string        `gorm:"default:''" json:"genders"`
	Favourites string        `gorm:"default:''" json:"favourites"`
}
