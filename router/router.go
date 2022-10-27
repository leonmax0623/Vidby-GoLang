package router

import (
	"main/config"
	"main/middlewares"
	"main/routes"
	adminRoutes "main/routes/admin"
	authRoutes "main/routes/auth"
	blogRoutes "main/routes/blog"
	aboutUsRoutes "main/routes/content/about-us"
	contentBlogRoutes "main/routes/content/blog"
	componentsRoutes "main/routes/content/components"
	contentCustomerRoutes "main/routes/content/customers"
	contentInvestorsRoutes "main/routes/content/investors"
	"main/routes/content/landing"
	mediaRoutes "main/routes/content/media"
	"main/routes/content/presentation"
	pricesRoutes "main/routes/content/prices"
	privacyPolicyRoutes "main/routes/content/privacy-policy"
	contentProductRoutes "main/routes/content/products"
	termsOfUseRoutes "main/routes/content/term-of-use"
	voicesContentRoutes "main/routes/content/voices"
	customersRoutes "main/routes/customers"
	imageRoutes "main/routes/image"
	languagesRoutes "main/routes/languages"
	rolesRoutes "main/routes/roles"
	voicesRoutes "main/routes/voices"

	lastmodifyRoutes "main/routes/content/lastmodify"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/logger"
)

// SetupRoutes setup router api
func SetupRoutes(app *fiber.App) {
	// Middleware
	api := app.Group("/api", logger.New())

	// Auth
	auth := api.Group("/auth")
	auth.Post("/login", authRoutes.Login)
	auth.Post("/refresh", authRoutes.RefreshToken)
	auth.Put("/update-me", middlewares.Protected(), authRoutes.UpdateMe)
	auth.Get("/get-me", middlewares.Protected(), authRoutes.GetMe)
	auth.Put("/update-password", middlewares.Protected(), authRoutes.ChangePassword)

	// Admin
	admin := api.Group("/admin")
	admin.Post("/add-user", middlewares.Protected(), middlewares.RoleRestricted(config.WriteUsersPermission), adminRoutes.AddUser)
	admin.Put("/update-user/:id", middlewares.Protected(), middlewares.RoleRestricted(config.WriteUsersPermission), adminRoutes.UpdateUser)
	admin.Delete("/delete-user/:id", middlewares.Protected(), middlewares.RoleRestricted(config.WriteUsersPermission), adminRoutes.DeleteUser)
	admin.Get("/users", middlewares.Protected(), middlewares.RoleRestricted(config.ReadUsersPermission), adminRoutes.GetUsers)

	// Languages
	languages := api.Group("/languages")
	languages.Post("/update-available", middlewares.Protected(), middlewares.RoleRestricted(config.WriteLanguagesPermission), languagesRoutes.UpdateAvailableLanguages)
	languages.Get("/available", languagesRoutes.GetAvailableLanguages)
	languages.Post("/update-source", middlewares.Protected(), middlewares.RoleRestricted(config.WriteLanguagesPermission), languagesRoutes.UpdateSourceLanguages)
	languages.Get("/sources", languagesRoutes.GetSourceLanguages)
	languages.Get("/website", middlewares.Protected(), languagesRoutes.GetWebsiteLanguages)
	languages.Post("/website", middlewares.Protected(), languagesRoutes.AddWebsiteLanguage)
	languages.Put("/website/:id", middlewares.Protected(), languagesRoutes.UpdateIsDisabled)
	languages.Delete("/website/:id", middlewares.Protected(), languagesRoutes.RemoveWebsiteLanguage)

	// Voices
	voices := api.Group("/voices")
	voices.Get("/", voicesRoutes.GetVoices)
	voices.Get("/selected/:id", voicesRoutes.GetSelectedVoices)
	voices.Post("/selected", voicesRoutes.SaveSelectedVoices)
	voices.Put("/", middlewares.Protected(), middlewares.RoleRestricted(config.WriteVoicesPermission), voicesRoutes.UpdateVoices)

	// Page content
	content := api.Group("/content/:lang")
	content.Get("/main/products", contentProductRoutes.Content)
	content.Get("/main/customers", contentCustomerRoutes.Content)
	content.Get("/main/investors", contentInvestorsRoutes.Content)
	content.Get("/main/media", mediaRoutes.Content)
	content.Get("/main/about-us", aboutUsRoutes.Content)
	content.Get("/main/prices", pricesRoutes.Content)
	content.Get("/main/terms-of-use", termsOfUseRoutes.Content)
	content.Get("/main/privacy-policy", privacyPolicyRoutes.Content)
	content.Get("/main/blog", contentBlogRoutes.Content)
	content.Get("/main/presentation/:translation", presentation.Content)
	content.Get("/landing", landing.GetLandingContent)
	content.Get("/main/voices", voicesContentRoutes.Content)
	content.Get("/last-modify", lastmodifyRoutes.Content)
	content.Get("/main/components/header", componentsRoutes.GetHeader)
	content.Get("/main/components/footer", componentsRoutes.GetFooter)

	content.Put("/main/components/header", middlewares.Protected(), middlewares.RoleRestricted(config.WriteMainContentPermission), componentsRoutes.UpdateHeader)
	content.Put("/main/components/footer", middlewares.Protected(), middlewares.RoleRestricted(config.WriteMainContentPermission), componentsRoutes.UpdateFooter)
	content.Put("/main/products", middlewares.Protected(), middlewares.RoleRestricted(config.WriteMainContentPermission), contentProductRoutes.UpdateProducts)
	content.Put("/main/customers", middlewares.Protected(), middlewares.RoleRestricted(config.WriteMainContentPermission), contentCustomerRoutes.UpdateCustomers)
	content.Put("/main/investors", middlewares.Protected(), middlewares.RoleRestricted(config.WriteMainContentPermission), contentInvestorsRoutes.UpdateInvestors)
	content.Put("/main/about", middlewares.Protected(), middlewares.RoleRestricted(config.WriteMainContentPermission), aboutUsRoutes.UpdateAboutUs)
	content.Put("/main/prices", middlewares.Protected(), middlewares.RoleRestricted(config.WriteMainContentPermission), pricesRoutes.UpdatePrices)
	content.Put("/main/privacy-policy", middlewares.Protected(), middlewares.RoleRestricted(config.WriteMainContentPermission), privacyPolicyRoutes.UpdatePrivacyPolicy)
	content.Put("/main/blog", middlewares.Protected(), middlewares.RoleRestricted(config.WriteMainContentPermission), contentBlogRoutes.UpdateBlog)
	content.Get("/main/presentation/:translation", middlewares.Protected(), middlewares.RoleRestricted(config.WriteMainContentPermission), presentation.Update)
	content.Put("/main/terms-of-use", middlewares.Protected(), middlewares.RoleRestricted(config.WriteMainContentPermission), termsOfUseRoutes.UpdateTermsOfUse)
	content.Put("/main/voices", middlewares.Protected(), middlewares.RoleRestricted(config.WriteMainContentPermission), voicesContentRoutes.UpdateVoices)
	content.Put("/landing", middlewares.Protected(), middlewares.RoleRestricted(config.WriteMainContentPermission), landing.UpdateLanding)

	//Blog content
	blog := api.Group("/blog/:lang")
	blog.Get("/article-previews", blogRoutes.GetBlogArticlePreviews)

	blog.Get("/article/:url", blogRoutes.GetBlogArticle)
	blog.Put("/article/:url", blogRoutes.UpdateBlogArticle)
	blog.Delete("/article/:url", blogRoutes.DeleteBlogArticle)

	scripts := api.Group("/content/scripts")
	scripts.Put("/", middlewares.Protected(), middlewares.RoleRestricted(config.WriteContentCustomScripts), componentsRoutes.UpdateScripts)
	scripts.Get("/", componentsRoutes.GetScripts)

	// Customers
	customer := api.Group("/customer")
	customer.Post("/send-coupon-email", middlewares.ValidateRecaptcha, customersRoutes.SendCouponEmail)
	customer.Post("/send-calc-email", middlewares.ValidateRecaptcha, customersRoutes.SendCalcEmail)
	customer.Get("/saved-emails", middlewares.Protected(), middlewares.RoleRestricted(config.ReadEmailPermission), customersRoutes.GetSavedEmails)

	// Image & Icon
	app.Static("/image", "./content/images")
	app.Static("/icon", "./content/icons")
	image := api.Group("/image")
	image.Post("/", middlewares.Protected(), middlewares.RoleRestricted(config.WriteMainContentPermission, config.WriteLandingContentPermission), imageRoutes.UploadImage)
	image.Delete("/:name", middlewares.Protected(), middlewares.RoleRestricted(config.WriteMainContentPermission, config.WriteLandingContentPermission), imageRoutes.DeleteImage)
	icon := api.Group("/icon")
	icon.Post("/", middlewares.RoleRestricted(config.WriteMainContentPermission, config.WriteLandingContentPermission), imageRoutes.UploadIcon)
	icon.Delete("/:name", middlewares.RoleRestricted(config.WriteMainContentPermission, config.WriteLandingContentPermission), imageRoutes.DeleteIcon)

	api.Get("/ping", routes.Ping)

	// Roles
	roles := api.Group("/roles")
	roles.Post("/", middlewares.Protected(), middlewares.RoleRestricted(config.WriteRolesPermission), rolesRoutes.CreateRole)
	roles.Get("/", middlewares.Protected(), rolesRoutes.GetAllRoles)
	roles.Put("/:id", middlewares.Protected(), middlewares.RoleRestricted(config.WriteRolesPermission), rolesRoutes.UpdateRole)
	roles.Delete("/:id", middlewares.Protected(), middlewares.RoleRestricted(config.WriteRolesPermission), rolesRoutes.DeleteRole)
}
