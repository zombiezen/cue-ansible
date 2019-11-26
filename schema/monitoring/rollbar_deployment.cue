package ansible

module: rollbar_deployment: {
	module:            "rollbar_deployment"
	version_added:     1.6
	author:            "Max Riveiro (@kavu)"
	short_description: "Notify Rollbar about app deployments"
	description: [
		"Notify Rollbar about app deployments (see https://rollbar.com/docs/deploys_other/)",
	]

	options: {
		token: {
			description: [
				"Your project access token.",
			]
			required: true
		}
		environment: {
			description: [
				"Name of the environment being deployed, e.g. 'production'.",
			]
			required: true
		}
		revision: {
			description: [
				"Revision number/sha being deployed.",
			]
			required: true
		}
		user: {
			description: [
				"User who deployed.",
			]
			required: false
		}
		rollbar_user: {
			description: [
				"Rollbar username of the user who deployed.",
			]
			required: false
		}
		comment: {
			description: [
				"Deploy comment (e.g. what is being deployed).",
			]
			required: false
		}
		url: {
			description: [
				"Optional URL to submit the notification to.",
			]
			required: false
			default:  "https://api.rollbar.com/api/1/deploy/"
		}
		validate_certs: {
			description: [
				"If C(no), SSL certificates for the target url will not be validated. This should only be used on personally controlled sites using self-signed certificates.",
			]

			required: false
			default:  "yes"
			type:     "bool"
		}
	}
}
