package ansible

module: newrelic_deployment: {
	module:            "newrelic_deployment"
	version_added:     "1.2"
	author:            "Matt Coddington (@mcodd)"
	short_description: "Notify newrelic about app deployments"
	description: [
		"Notify newrelic about app deployments (see https://docs.newrelic.com/docs/apm/new-relic-apm/maintenance/deployment-notifications#api)",
	]
	options: {
		token: {
			description: [
				"API token, to place in the x-api-key header.",
			]
			required: true
		}
		app_name: {
			description: [
				"(one of app_name or application_id are required) The value of app_name in the newrelic.yml file used by the application",
			]
			required: false
		}
		application_id: {
			description: [
				"(one of app_name or application_id are required) The application id, found in the URL when viewing the application in RPM",
			]
			required: false
		}
		changelog: {
			description: [
				"A list of changes for this deployment",
			]
			required: false
		}
		description: {
			description: [
				"Text annotation for the deployment - notes for you",
			]
			required: false
		}
		revision: {
			description: [
				"A revision number (e.g., git commit SHA)",
			]
			required: false
		}
		user: {
			description: [
				"The name of the user/process that triggered this deployment",
			]
			required: false
		}
		appname: {
			description: [
				"Name of the application",
			]
			required: false
		}
		environment: {
			description: [
				"The environment for this deployment",
			]
			required: false
		}
		validate_certs: {
			description: [
				"If C(no), SSL certificates will not be validated. This should only be used on personally controlled sites using self-signed certificates.",
			]

			required:      false
			default:       "yes"
			type:          "bool"
			version_added: "1.5.1"
		}
	}

	requirements: []
}
