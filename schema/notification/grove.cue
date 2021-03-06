package ansible

module: grove: {
	module:            "grove"
	version_added:     1.4
	short_description: "Sends a notification to a grove.io channel"
	description: [
		"The C(grove) module sends a message for a service to a Grove.io channel.",
	]

	options: {
		channel_token: {
			description: [
				"Token of the channel to post to.",
			]
			required: true
		}
		service: {
			description: [
				"Name of the service (displayed as the \"user\" in the message)",
			]
			required: false
			default:  "ansible"
		}
		message: {
			description: [
				"Message content",
			]
			required: true
		}
		url: {
			description: [
				"Service URL for the web client",
			]
			required: false
		}
		icon_url: {
			description: [
				"Icon for the service",
			]
			required: false
		}
		validate_certs: {
			description: [
				"If C(no), SSL certificates will not be validated. This should only be used on personally controlled sites using self-signed certificates.",
			]

			default:       "yes"
			type:          "bool"
			version_added: "1.5.1"
		}
	}
	author: "Jonas Pfenniger (@zimbatm)"
}
