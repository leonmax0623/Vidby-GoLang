package landing

import (
	"main/database"
	"main/dtos"
	"main/routes/content/components"
	"main/routes/content/customers"
	"main/validators"

	"github.com/gofiber/fiber/v2"
	log "github.com/sirupsen/logrus"
)

func UpdateLanding(c *fiber.Ctx) error {
	lang := c.Params("lang")

	var payload Payload
	if err := c.BodyParser(&payload); err != nil {
		log.Error(err)
		return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{"message": "Invalid payload"})
	}

	if errs := validators.ValidatePayload(payload); errs != nil {
		return c.Status(fiber.StatusBadRequest).JSON(errs)
	}

	if err := database.SaveContent(lang, "landing", payload); err != nil {
		return c.Status(fiber.StatusBadRequest).JSON(err.Error())
	}

	return c.Status(fiber.StatusOK).JSON(fiber.Map{"message": "Successfully update landing page"})
}

type Payload struct {
	Seo                 dtos.SeoPayload          `json:"seo" validate:"required,dive"`
	Header              components.HeaderPayload `json:"header" validate:"required,dive"`
	Main                MainPayload              `json:"main" validate:"required,dive"`
	Advantages          AdvantagesPayload        `json:"advantages" validate:"required,dive"`
	Benefits            []*BenefitPayload        `json:"benefits" validate:"required,dive"`
	HowItWorks          HowItWorksPayload        `json:"how-it-works" validate:"required,dive"`
	Examples            ExamplesPayload          `json:"examples" validate:"required,dive,required"`
	Pricing             PricingPayload           `json:"pricing" validate:"required,dive"`
	Calculator          CalculatorPayload        `json:"calculator" validate:"required,dive"`
	Discount            DiscountPayload          `json:"discount" validate:"required,dive"`
	Reviews             customers.ReviewsSection `json:"reviews" validate:"required,dive"`
	Faq                 FaqPayload               `json:"faq" validate:"required,dive"`
	Banner              BannerPayload            `json:"banner" validate:"required,dive"`
	Footer              FooterPayload            `json:"footer" validate:"required,dive"`
	GetEmailModal       GetEmailModalPayload     `json:"get-email-modal" validate:"required,dive"`
	SupportedLangsModal SupportedModalPayload    `json:"supported-langs-modal" validate:"required,dive"`
	ThanksModal         ThanksModalPayload       `json:"thanks-modal" validate:"required,dive"`
	Form                FormPyload               `json:"form" validate:"required,dive"`
}

type MainPayload struct {
	dtos.PrimaryContentBlock
	Button dtos.Link         `json:"button" validate:"required,dive"`
	Widget MainWidgetPayload `json:"widget" validate:"required,dive"`
}

type MainWidgetPayload struct {
	Title string `json:"title" validate:"required"`
	Video string `json:"video" validate:"required"`
}

type BenefitPayload struct {
	Content string `json:"content" validate:"required"`
	Image   string `json:"image" validate:"required"`
	Height  int    `json:"height" validate:"required"`
}

type AdvantagesPayload struct {
	Title      string             `json:"title" validate:"required"`
	Advantages []AdvantagePayload `json:"advantages" validate:"required,dive,dive"`
}

type AdvantagePayload struct {
	dtos.PrimaryContentBlock
	Image string `json:"image" validate:"required"`
}

type HowItWorksPayload struct {
	Title string           `json:"title" validate:"required"`
	Items []HowItWorksItem `json:"items" validate:"required,dive,dive"`
}

type HowItWorksItem struct {
	Text   string     `json:"text" validate:"required"`
	Image  string     `json:"image" validate:"required"`
	Icon   string     `json:"icon" validate:"required"`
	Button *dtos.Link `json:"button" validate:"omitempty,dive"`
}

type ExamplesPayload struct {
	Title      string                           `json:"title" validate:"required"`
	Videos     []*customers.VideoExamplePayload `json:"videos" validate:"required,dive,required"`
	Original   string                           `json:"original" validate:"required"`
	Translated string                           `json:"translated" validate:"required"`
}

type PricingPayload struct {
	Title  string               `json:"title" validate:"required"`
	Fast   FastPricingPayload   `json:"fast" validate:"required,dive"`
	Expert ExpertPricingPayload `json:"expert" validate:"required,dive"`
}

type FastPricingPayload struct {
	Advantages []*string `json:"advantages" validate:"required,dive,required"`
	Button     dtos.Link `json:"button" validate:"required,dive"`
	Time       string    `json:"time" validate:"required"`
	Title      string    `json:"title" validate:"required"`
	Price      string    `json:"price" validate:"required"`
}

type ExpertPricingPayload struct {
	Advantages []*string         `json:"advantages" validate:"required,dive,required"`
	Button     dtos.Link         `json:"button" validate:"required,dive"`
	Time       string            `json:"time" validate:"required"`
	Title      string            `json:"title" validate:"required"`
	Price      PriceValuePayload `json:"price" validate:"required,dive"`
}

type PriceValuePayload struct {
	First  PriceValueContentPayload `json:"1" validate:"required,dive"`
	Second PriceValueContentPayload `json:"2" validate:"required,dive"`
}

type PriceValueContentPayload struct {
	Price   string `json:"price" validate:"required"`
	Subtext string `json:"subtext" validate:"required"`
}

type CalculatorPayload struct {
	Accuracy    string `json:"accuracy" validate:"required"`
	Accuracy80  string `json:"accuracy-80" validate:"required"`
	Accuracy99  string `json:"accuracy-99" validate:"required"`
	Accuracy992 string `json:"accuracy-99-2" validate:"required"`
	Button      string `json:"button" validate:"required"`
	Cost        string `json:"cost" validate:"required"`
	Discount    string `json:"discount" validate:"required"`
	Min         string `json:"min" validate:"required"`
	NOfNewLangs string `json:"n-of-new-langs" validate:"required"`
	Result      string `json:"result" validate:"required"`
	SourceLang  string `json:"source-lang" validate:"required"`
	Time        string `json:"time" validate:"required"`
	Title       string `json:"title" validate:"required"`
	Total       string `json:"total" validate:"required"`
	VideoLength string `json:"video-length" validate:"required"`
	Tooltip     string `json:"tooltip" validate:"required"`
}

type DiscountPayload struct {
	Title string              `json:"title" validate:"required"`
	Form  DiscountFormPayload `json:"form" validate:"required"`
}

type DiscountFormPayload struct {
	Title  string `json:"title" validate:"required"`
	Button string `json:"button" validate:"required"`
}

type FaqPayload struct {
	Title string           `json:"title" validate:"required"`
	Faqs  []FaqItemPayload `json:"faqs" validate:"required,dive,dive"`
}

type FaqItemPayload struct {
	Question string `json:"question" validate:"required"`
	Answer   string `json:"answer" validate:"required"`
}

type BannerPayload struct {
	Title  string    `json:"title" validate:"required"`
	Button dtos.Link `json:"button" validate:"required,dive"`
}

type GetEmailModalPayload struct {
	Title     string `json:"title" validate:"required"`
	Agreement string `json:"agreement" validate:"required"`
	Button    string `json:"button" validate:"required"`
	Label     string `json:"label" validate:"required"`
}

type SupportedModalPayload struct {
	Title       string `json:"title" validate:"required"`
	Placeholder string `json:"placeholder" validate:"required"`
}

type ThanksModalPayload struct {
	Title  string `json:"title" validate:"required"`
	Button string `json:"button" validate:"required"`
}

type FormPyload struct {
	Required     string `json:"required" validate:"required"`
	InvalidEmail string `json:"invalid-email" validate:"required"`
	Success      string `json:"success" validate:"required"`
	Error        string `json:"error" validate:"required"`
}

type FooterPayload struct {
	components.FooterPayload
	Language string `json:"language" validate:"required"`
}
