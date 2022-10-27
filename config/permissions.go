package config

import (
	"github.com/go-playground/validator/v10"
	"golang.org/x/exp/slices"
)

const (
	// ReadUsersPermission – permission to see another users on users page
	ReadUsersPermission = "users/read"

	// WriteUsersPermission - permission to see create another users on users page
	WriteUsersPermission = "users/write"

	// ReadLanguagesPermission - permission to see available & source language
	ReadLanguagesPermission = "languages/read"

	// WriteLanguagesPermission - permission to update available & source language
	WriteLanguagesPermission = "languages/write"

	// ReadEmailPermission - permission to see customers emails
	ReadEmailPermission = "emails/read"

	// ReadMainContentPermission - permission to see main content
	ReadMainContentPermission = "main-content/read"

	// WriteMainContentPermission - permission to update main content
	WriteMainContentPermission = "main-content/write"

	// ReadLandingContentPermission - permission to see landing content
	ReadLandingContentPermission = "landing-content/read"

	// WriteLandingContentPermission - permission to update landing content
	WriteLandingContentPermission = "landing-content/write"

	// ReadRolesPermission – permission to read other users roles
	ReadRolesPermission = "roles/read"

	// WriteRolesPermission – permission to edit user roles
	WriteRolesPermission = "roles/write"

	// ReadContentCustomScripts – permission to read global custom scripts & styles
	ReadContentCustomScripts = "content-custom-scripts/read"

	// WriteContentCustomScripts – permission to read global custom scripts & styles
	WriteContentCustomScripts = "content-custom-scripts/write"

	// ReadVoicesPermission – permission to read voices
	ReadVoicesPermission = "voices/read"

	// WriteVoicesPermission – permission to write voices
	WriteVoicesPermission = "voices/write"
)

var PermissionsList = []string{
	ReadUsersPermission,
	WriteUsersPermission,
	ReadLanguagesPermission,
	WriteLanguagesPermission,
	ReadEmailPermission,
	ReadMainContentPermission,
	WriteMainContentPermission,
	ReadLanguagesPermission,
	WriteLandingContentPermission,
	ReadLandingContentPermission,
	ReadContentCustomScripts,
	WriteContentCustomScripts,
	ReadRolesPermission,
	ReadVoicesPermission,
	WriteVoicesPermission,
}

// ValidateRolePermission implements validator.Func
func ValidateRolePermission(fl validator.FieldLevel) bool {
	return slices.Contains(PermissionsList, fl.Field().String())
}
