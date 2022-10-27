package utils

import (
	"github.com/lib/pq"
	"golang.org/x/crypto/bcrypt"
)

func HashPassword(password string) (string, error) {
	bytes, err := bcrypt.GenerateFromPassword([]byte(password), 14)
	return string(bytes), err
}

func PqIntArrayToInt(input pq.Int64Array) []int {
	output := make([]int, len(input))
	for index, element := range input {
		output[index] = int(element)
	}
	return output
}
