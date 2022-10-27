package roles

type Payload struct {
	Permissions []string `json:"permissions" validate:"required,dive,required,role-permission"`
	Name        string   `json:"name" validate:"required"`
	Hierarchy   int      `json:"hierarchy" validate:"required,min=1,max=999"`
}
