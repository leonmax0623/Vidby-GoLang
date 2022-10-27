package validators

import (
	"github.com/go-playground/validator/v10"
	log "github.com/sirupsen/logrus"
	"main/config"
	"main/dtos"
)

var validate *validator.Validate

func SetupValidator() {
	validate = validator.New()

	// password
	err := validate.RegisterValidation("password", ValidatePassword)
	if err != nil {
		log.Error("failed to register password validator ", err)
		panic("failed to register password validator")
	}

	// Role
	err = validate.RegisterValidation("role-permission", config.ValidateRolePermission)
	if err != nil {
		log.Error("failed to register role validator ", err)
		panic("failed to register role validator")
	}
}

func ValidatePayload(payload interface{}) []*dtos.ErrorResponse {
	var errors []*dtos.ErrorResponse
	err := validate.Struct(payload)
	if err != nil {
		for _, err := range err.(validator.ValidationErrors) {
			var element dtos.ErrorResponse
			element.FailedField = err.StructNamespace()
			element.Tag = err.Tag()
			element.Value = err.Param()
			errors = append(errors, &element)
		}
	}
	return errors
}
