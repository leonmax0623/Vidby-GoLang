package models

import "gorm.io/gorm"

// User struct
type User struct {
	gorm.Model
	Email    string `gorm:"unique;not null" json:"email"`
	Password string `gorm:"not null" json:"password"`
	Role     int    `json:"role"`
	Name     string `gorm:"not null" json:"name"`
}
