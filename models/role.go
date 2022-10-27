package models

import (
	"github.com/lib/pq"
	"gorm.io/gorm"
)

type UserRole struct {
	gorm.Model
	UserIds     pq.Int64Array  `gorm:"type:integer[]" json:"user-ids"`
	Permissions pq.StringArray `gorm:"type:text[]" json:"permissions"`
	Name        string         `gorm:"not null" json:"name"`
	Hierarchy   int            `gorm:"not null;default:999" json:"hierarchy"`
	CreatedById int            `gorm:"not null" json:"created-by-id"`
	UpdatedById int            `gorm:"not null" json:"updated-by-id"`
}
