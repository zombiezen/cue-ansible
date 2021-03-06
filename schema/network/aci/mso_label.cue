package ansible

module: mso_label: {
	module:            "mso_label"
	short_description: "Manage labels"
	description: [
		"Manage labels on Cisco ACI Multi-Site.",
	]
	author: [
		"Dag Wieers (@dagwieers)",
	]
	version_added: "2.8"
	options: {
		label: {
			description: [
				"The name of the label.",
			]
			type:     "str"
			required: true
			aliases: ["name"]
		}
		type: {
			description: [
				"The type of the label.",
			]
			type: "str"
			choices: ["site"]
			default: "site"
		}
		state: {
			description: [
				"Use C(present) or C(absent) for adding or removing.",
				"Use C(query) for listing an object or multiple objects.",
			]
			type: "str"
			choices: ["absent", "present", "query"]
			default: "present"
		}
	}
	extends_documentation_fragment: "mso"
}
