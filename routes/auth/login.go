package auth

import (
	"errors"
	"main/config"
	"main/database"
	"main/dtos"
	"main/models"
	"os"
	"time"

	jwt "github.com/dgrijalva/jwt-go"
	"github.com/gofiber/fiber/v2"
	"golang.org/x/crypto/bcrypt"
	"gorm.io/gorm"
)

type LoginInput struct {
	Email    string `json:"email"`
	Password string `json:"password"`
}

func Login(c *fiber.Ctx) error {
	var input LoginInput

	// Parse body
	if err := c.BodyParser(&input); err != nil {
		return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{"status": "error", "message": "Error on login request", "data": err.Error()})
	}
	email := input.Email
	password := input.Password

	// Get user by email
	user, err := getUserByEmail(email)
	if err != nil {
		return c.Status(fiber.StatusUnauthorized).JSON(fiber.Map{"status": "error", "message": "Error on email", "data": err.Error()})
	}

	// no user with this email found
	if user == nil {
		return c.Status(fiber.StatusUnauthorized).JSON(fiber.Map{"status": "error", "message": "User not found", "data": err.Error()})
	}

	// check password hashes
	if !CheckPasswordHash(password, user.Password) {
		return c.Status(fiber.StatusUnauthorized).JSON(fiber.Map{"status": "error", "message": "Invalid password", "data": nil})
	}

	// Creating accessToken
	accessToken, refreshToken, err := CreateTokens(user)
	if err != nil {
		return c.SendStatus(fiber.StatusInternalServerError)
	}

	// Populating role
	var userRole models.UserRole
	database.DB.Find(&userRole, user.Role)
	var role *dtos.UserRoleWithoutUsers
	if userRole.Name != "" {
		role = &dtos.UserRoleWithoutUsers{
			Id:          user.Role,
			Permissions: userRole.Permissions,
			Name:        userRole.Name,
		}
	}

	return c.JSON(fiber.Map{
		"status":  "success",
		"message": "Success login",
		"user": fiber.Map{
			"id":    user.ID,
			"name":  user.Name,
			"email": user.Email,
			"role":  role,
		},
		"tokens": fiber.Map{
			"access":  accessToken,
			"refresh": refreshToken,
		},
	})
}

// Functions
func getUserByEmail(e string) (*models.User, error) {
	db := database.DB
	var user models.User
	if err := db.Where(&models.User{Email: e}).Find(&user).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, nil
		}
		return nil, err
	}
	return &user, nil
}

// CheckPasswordHash compare password with hash
func CheckPasswordHash(password, hash string) bool {
	err := bcrypt.CompareHashAndPassword([]byte(hash), []byte(password))
	return err == nil
}

func CreateTokens(user *models.User) (*string, *string, error) {
	// Creating accessToken
	accessToken := jwt.New(jwt.SigningMethodHS256)

	accessClaims := accessToken.Claims.(jwt.MapClaims)
	accessClaims["id"] = int(user.ID)
	accessClaims["email"] = user.Email
	accessClaims["user_id"] = user.ID
	accessClaims["exp"] = time.Now().Add(time.Hour * 24).Unix()

	// Creating refreshToken
	refreshToken := jwt.New(jwt.SigningMethodHS256)

	refreshClaims := refreshToken.Claims.(jwt.MapClaims)
	refreshClaims["id"] = int(user.ID)
	refreshClaims["email"] = user.Email
	refreshClaims["user_id"] = user.ID
	refreshClaims["exp"] = time.Now().Add(time.Hour * 24 * 30).Unix()

	accessT, err := accessToken.SignedString([]byte(os.Getenv(config.SECRET_ACCESS)))
	if err != nil {
		return nil, nil, err
	}

	refreshT, err := refreshToken.SignedString([]byte(os.Getenv(config.SECRET_REFRESH)))
	if err != nil {
		return nil, nil, err
	}

	return &accessT, &refreshT, nil
}
