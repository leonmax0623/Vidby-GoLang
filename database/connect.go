package database

import (
	"fmt"
	"main/config"
	"main/models"
	"os"
	"strconv"

	log "github.com/sirupsen/logrus"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

// ConnectDB connect to db
func ConnectDB() {
	var err error
	p := os.Getenv(config.DB_PORT)
	port, err := strconv.ParseUint(p, 10, 32)
	dsn := fmt.Sprintf(
		"host=%s port=%d user=%s password=%s dbname=%s sslmode=disable",
		os.Getenv(config.DB_HOST), port, os.Getenv(config.DB_USER),
		os.Getenv(config.DB_PASSWORD), os.Getenv(config.DB_NAME),
	)
	log.Info("connection to database ", dsn)
	DB, err = gorm.Open(postgres.Open(dsn), &gorm.Config{
		//Logger: logger.New(
		//	defaultLog.New(os.Stdout, "\r\n", defaultLog.LstdFlags),
		//	logger.Config{
		//		SlowThreshold:             200 * time.Millisecond,
		//		LogLevel:                  logger.Silent,
		//		IgnoreRecordNotFoundError: false,
		//		Colorful:                  true,
		//	}),
	})

	if err != nil {
		log.Error("failed to connect database ", err)
		panic("failed to connect database")
	}

	log.Info("Connection Opened to Database")
	err = DB.AutoMigrate(
		&models.User{},
		&models.ColorfulText{},
		&models.Advantages{},
		&models.Language{},
		&models.Video{},
		&models.VideoExample{},
		&models.PriceAdvantage{},
		&models.SourceLanguage{},
		&models.PageTextContent{},
		&models.UpdateHistory{},
		&models.Review{},
		&models.Goal{},
		&models.WebsiteLanguage{},
		&models.Faq{},
		&models.CustomerEmail{},
		&models.PageRepeatedTextContent{},
		&models.SelectedVoices{},
		&models.UserRole{},
		&models.Voice{},
		&models.Blog{},
	)
	if err != nil {
		log.Error("failed to migrate database", err)
		panic("failed to migrate database")
	}
	log.Info("Database successfully migrated")

}
