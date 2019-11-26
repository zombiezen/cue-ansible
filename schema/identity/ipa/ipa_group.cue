package ansible

module: ipa_group: {
	module:            "ipa_group"
	author:            "Thomas Krahn (@Nosmoht)"
	short_description: "Manage FreeIPA group"
	description: [
		"Add, modify and delete group within IPA server",
	]
	options: {
		cn: {
			description: [
				"Canonical name.",
				"Can not be changed as it is the unique identifier.",
			]
			required: true
			aliases: ["name"]
		}
		description: description: [
			"Description of the group.",
		]
		external: {
			description: [
				"Allow adding external non-IPA members from trusted domains.",
			]
			type: "bool"
		}
		gidnumber: {
			description: [
				"GID (use this option to set it manually).",
			]
			aliases: ["gid"]
		}
		group: description: [
			"List of group names assigned to this group.",
			"If an empty list is passed all groups will be removed from this group.",
			"If option is omitted assigned groups will not be checked or changed.",
			"Groups that are already assigned but not passed will be removed.",
		]
		nonposix: {
			description: [
				"Create as a non-POSIX group.",
			]
			type: "bool"
		}
		user: description: [
			"List of user names assigned to this group.",
			"If an empty list is passed all users will be removed from this group.",
			"If option is omitted assigned users will not be checked or changed.",
			"Users that are already assigned but not passed will be removed.",
		]
		state: {
			description: [
				"State to ensure",
			]
			default: "present"
			choices: ["present", "absent"]
		}
	}
	extends_documentation_fragment: "ipa.documentation"
	version_added:                  "2.3"
}
