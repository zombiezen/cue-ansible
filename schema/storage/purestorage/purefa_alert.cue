package ansible

module: purefa_alert: {
	module:            "purefa_alert"
	version_added:     "2.9"
	short_description: "Configure Pure Storage FlashArray alert email settings"
	description: [
		"Configure alert email configuration for Pure Storage FlashArrays.",
		"Add or delete an individual syslog server to the existing list of serves.",
	]

	author: [
		"Simon Dodsley (@sdodsley)",
	]
	options: {
		state: {
			type: "str"
			description: [
				"Create or delete alert email",
			]
			default: "present"
			choices: ["absent", "present"]
		}
		address: {
			type: "str"
			description: [
				"Email address (valid format required)",
			]
			required: true
		}
		enabled: {
			type:    "bool"
			default: true
			description: [
				"Set specified email address to be enabled or disabled",
			]
		}
	}
	extends_documentation_fragment: ["purestorage.fa"]
}
