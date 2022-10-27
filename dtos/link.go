package dtos

type Link struct {
	Text   string `json:"text" validate:"required"`
	Link   string `json:"link" validate:"required"`
	NewTab *bool  `json:"new-tab" validate:"required"`
}
