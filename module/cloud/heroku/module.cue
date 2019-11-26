package heroku

heroku_collaborator :: {

	// Heroku API key

	api_key?: string

	// List of Heroku App names

	apps: string

	// Create or remove the heroku collaborator

	state?: string

	// Suppress email invitation when creating collaborator

	suppress_invitation?: bool

	// User ID or e-mail

	user: string
}