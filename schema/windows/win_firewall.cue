package ansible

module: win_firewall: {
	module:            "win_firewall"
	version_added:     "2.4"
	short_description: "Enable or disable the Windows Firewall"
	description: [
		"Enable or Disable Windows Firewall profiles.",
	]
	requirements: [
		"This module requires Windows Management Framework 5 or later.",
	]
	options: {
		profiles: {
			description: [
				"Specify one or more profiles to change.",
			]
			type: "list"
			choices: ["Domain", "Private", "Public"]
			default: ["Domain", "Private", "Public"]
		}
		state: {
			description: [
				"Set state of firewall for given profile.",
			]
			type: "str"
			choices: ["disabled", "enabled"]
		}
	}
	seealso: [{
		module: "win_firewall_rule"
	}]
	author: ["Michael Eaton (@michaeldeaton)"]
}
