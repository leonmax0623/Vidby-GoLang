package dtos

import "github.com/lib/pq"

type UserRole struct {
	Id          int               `json:"id"`
	Users       []UserWithoutRole `json:"users"`
	Permissions pq.StringArray    `json:"permissions"`
	Name        string            `json:"name"`
	Hierarchy   int               `json:"hierarchy"`
}

type UserRoleWithoutUsers struct {
	Id          int            `json:"id"`
	Permissions pq.StringArray `json:"permissions"`
	Name        string         `json:"name"`
	Hierarchy   int            `json:"hierarchy"`
}

type UserWithoutRole struct {
	Email string `json:"email"`
	Name  string `json:"name"`
}
