package validators

import (
	"github.com/go-playground/validator/v10"
	"unicode"
)

func ValidatePassword(fl validator.FieldLevel) bool {
	s := fl.Field().String()

	var (
		hasMinLen      = false
		hasUpper       = false
		hasLower       = false
		hasSpecialChar = false
	)
	if len(s) >= 7 {
		hasMinLen = true
	}
	for _, char := range s {
		switch {
		case unicode.IsUpper(char):
			hasUpper = true
		case unicode.IsLower(char):
			hasLower = true
		case !unicode.IsLetter(char):
			hasSpecialChar = true
		}
	}
	return hasMinLen && hasUpper && hasLower && hasSpecialChar
}
