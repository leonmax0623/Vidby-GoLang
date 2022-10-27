package models

import (
	"github.com/lib/pq"
	"gorm.io/gorm"
)

type VideoExample struct {
	gorm.Model
	OriginalID    int           `gorm:"not null" json:"original"`
	TranslatedIDs pq.Int64Array `gorm:"type:integer[]" json:"translated"`
	Page          string        `gorm:"not null;default:main/customers'" json:"page"`
	CompanyLogo   string        `json:"company_logo"`
	Index         int           `json:"index"`
}
