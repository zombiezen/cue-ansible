package ansible

module: pushover: {
	module:            "pushover"
	version_added:     "2.0"
	short_description: "Send notifications via U(https://pushover.net)"
	description: [
		"Send notifications via pushover, to subscriber list of devices, and email addresses. Requires pushover app on devices.",
	]

	notes: [
		"You will require a pushover.net account to use this module. But no account is required to receive messages.",
	]

	options: {
		msg: {
			description: [
				"What message you wish to send.",
			]
			required: true
		}
		app_token: {
			description: [
				"Pushover issued token identifying your pushover app.",
			]
			required: true
		}
		user_key: {
			description: [
				"Pushover issued authentication key for your user.",
			]
			required: true
		}
		title: {
			description: [
				"Message title.",
			]
			required:      false
			version_added: "2.8"
		}
		pri: {
			description: [
				"Message priority (see U(https://pushover.net) for details).",
			]
			required: false
		}
	}

	author: "Jim Richardson (@weaselkeeper)"
}
