package ansible

module: github_webhook_info: {
	module:            "github_webhook_info"
	short_description: "Query information about GitHub webhooks"
	version_added:     "2.8"
	description: [
		"Query information about GitHub webhooks",
		"This module was called C(github_webhook_facts) before Ansible 2.9. The usage did not change.",
	]
	requirements: [
		"PyGithub >= 1.3.5",
	]
	options: {
		repository: {
			description: [
				"Full name of the repository to configure a hook for",
			]
			required: true
			aliases: [
				"repo",
			]
		}
		user: {
			description: [
				"User to authenticate to GitHub as",
			]
			required: true
		}
		password: {
			description: [
				"Password to authenticate to GitHub with",
			]
			required: false
		}
		token: {
			description: [
				"Token to authenticate to GitHub with",
			]
			required: false
		}
		github_url: {
			description: [
				"Base URL of the github api",
			]
			required: false
			default:  "https://api.github.com"
		}
	}

	author: ["Chris St. Pierre (@stpierre)"]
}
