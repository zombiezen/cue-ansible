package ansible

module: tower_host: {
	module:            "tower_host"
	version_added:     "2.3"
	author:            "Wayne Witzel III (@wwitzel3)"
	short_description: "create, update, or destroy Ansible Tower host."
	description: [
		"Create, update, or destroy Ansible Tower hosts. See U(https://www.ansible.com/tower) for an overview.",
	]

	options: {
		name: {
			description: [
				"The name to use for the host.",
			]
			required: true
		}
		description: description: [
			"The description to use for the host.",
		]
		inventory: {
			description: [
				"Inventory the host should be made a member of.",
			]
			required: true
		}
		enabled: {
			description: [
				"If the host should be enabled.",
			]
			type:    "bool"
			default: "yes"
		}
		variables: description: [
			"Variables to use for the host. Use C(@) for a file.",
		]
		state: {
			description: [
				"Desired state of the resource.",
			]
			choices: ["present", "absent"]
			default: "present"
		}
	}
	extends_documentation_fragment: "tower"
}
