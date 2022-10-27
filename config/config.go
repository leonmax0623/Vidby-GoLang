package config

import (
	"github.com/joho/godotenv"
	log "github.com/sirupsen/logrus"
	"os"
)

func LoadEnv() {
	// load .env file
	err := godotenv.Load(".env")

	if err != nil {
		log.Warning(".env file not found. Using global env")
	}

	vars := []string{DB_PORT, DB_HOST, DB_USER, DB_PASSWORD, DB_NAME, SECRET_ACCESS, SECRET_REFRESH, SERVER_URL, CORS_ORIGIN, RECAPTCHA_V3_SECRET, RECAPTCHA_V2_SECRET}

	for _, variable := range vars {
		if os.Getenv(variable) == "" {
			log.Error("variable ", variable, " is not set")
			panic("failed to find env variable")
		}
	}
}

const (
	DB_PORT             = "DB_PORT"
	DB_HOST             = "DB_HOST"
	DB_USER             = "DB_USER"
	DB_PASSWORD         = "DB_PASSWORD"
	DB_NAME             = "DB_NAME"
	SECRET_ACCESS       = "SECRET_ACCESS"
	SECRET_REFRESH      = "SECRET_REFRESH"
	SERVER_URL          = "SERVER_URL"
	CORS_ORIGIN         = "CORS_ORIGIN"
	RECAPTCHA_V3_SECRET = "RECAPTCHA_V3_SECRET"
	RECAPTCHA_V2_SECRET = "RECAPTCHA_V2_SECRET"
)
