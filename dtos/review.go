package dtos

import "main/models"

type ReviewAuthorCompany struct {
	Company string `json:"company"`
	Url     string `json:"url"`
}

type ReviewAuthor struct {
	ProfileImage string              `json:"profile-image"`
	Name         string              `json:"name"`
	Profession   string              `json:"profession"`
	Company      ReviewAuthorCompany `json:"company"`
}

type Review struct {
	Author         ReviewAuthor `json:"author"`
	Stars          int          `json:"stars"`
	Content        string       `json:"content"`
	FullContentUrl string       `json:"full-content-url"`
}

func ReviewsToDto(rawReviews *[]models.Review) *[]Review {
	var reviews []Review
	for _, raw := range *rawReviews {
		reviews = append(reviews, Review{
			Author: ReviewAuthor{
				ProfileImage: raw.AuthorProfilePicture,
				Name:         raw.AuthorName,
				Profession:   raw.AuthorProfession,
				Company: ReviewAuthorCompany{
					Company: raw.AuthorCompany,
					Url:     raw.AuthorCompanyUrl,
				},
			},
			Stars:          raw.Stars,
			Content:        raw.Content,
			FullContentUrl: raw.FullContentUrl,
		})
	}

	return &reviews
}
