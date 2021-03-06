package ansible

module: cs_role: {
	module:            "cs_role"
	short_description: "Manages user roles on Apache CloudStack based clouds."
	description: [
		"Create, update, delete user roles.",
	]
	version_added: "2.3"
	author:        "René Moser (@resmo)"
	options: {
		name: {
			description: ["Name of the role."]
			type:     "str"
			required: true
		}
		uuid: {
			description: [
				"ID of the role.",
				"If provided, I(uuid) is used as key.",
			]
			type: "str"
			aliases: ["id"]
		}
		role_type: {
			description: [
				"Type of the role.",
				"Only considered for creation.",
			]
			type:    "str"
			default: "User"
			choices: ["User", "DomainAdmin", "ResourceAdmin", "Admin"]
		}
		description: {
			description: ["Description of the role."]
			type: "str"
		}
		state: {
			description: ["State of the role."]
			type:    "str"
			default: "present"
			choices: ["present", "absent"]
		}
	}
	extends_documentation_fragment: "cloudstack"
}
