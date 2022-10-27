package dtos

import "main/models"

type Goal struct {
	Date     string `json:"date"`
	Achieved bool   `json:"achieved"`
	Text     string `json:"text"`
	Selected bool   `json:"selected"`
}

func GoalToDto(rawGoals *[]models.Goal) *[]Goal {
	var goals []Goal
	for _, raw := range *rawGoals {
		goals = append(goals, Goal{
			Date:     raw.Date,
			Achieved: raw.Achieved,
			Text:     raw.Text,
			Selected: raw.Selected,
		})
	}
	return &goals
}
