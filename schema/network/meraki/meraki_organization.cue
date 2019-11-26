package ansible

module: meraki_organization: {
	module:            "meraki_organization"
	short_description: "Manage organizations in the Meraki cloud"
	version_added:     "2.6"
	description: [
		"Allows for creation, management, and visibility into organizations within Meraki.",
	]
	options: {
		state: {
			description: [
				"Create or modify an organization.",
				"C(org_id) must be specified if multiple organizations of the same name exist.",
				"C(absent) WILL DELETE YOUR ENTIRE ORGANIZATION, AND ALL ASSOCIATED OBJECTS, WITHOUT CONFIRMATION. USE WITH CAUTION.",
			]
			choices: ["absent", "present", "query"]
			default: "present"
		}
		clone: description: [
			"Organization to clone to a new organization.",
		]
		org_name: {
			description: [
				"Name of organization.",
				"If C(clone) is specified, C(org_name) is the name of the new organization.",
			]
			aliases: ["name", "organization"]
		}
		org_id: {
			description: [
				"ID of organization.",
			]
			aliases: ["id"]
			type: "str"
		}
	}
	author: [
		"Kevin Breit (@kbreit)",
	]
	extends_documentation_fragment: "meraki"
}
