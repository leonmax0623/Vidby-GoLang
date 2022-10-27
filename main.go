package main

import (
	"log"
	"main/config"
	"main/database"
	"main/router"
	"main/validators"
	"os"
	"time"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/cors"
	"golang.org/x/exp/rand"
)

func main() {
	rand.Seed(uint64(time.Now().UnixNano()))
	config.LoadEnv()
	validators.SetupValidator()

	app := fiber.New()
	app.Use(cors.New(cors.Config{
		AllowOrigins: os.Getenv(config.CORS_ORIGIN),
	}))

	database.ConnectDB()

	router.SetupRoutes(app)
	log.Fatal(app.Listen(":8001"))
}
