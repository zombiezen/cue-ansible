package ansible

module: tower_label: {
	module:            "tower_label"
	author:            "Wayne Witzel III (@wwitzel3)"
	version_added:     "2.3"
	short_description: "create, update, or destroy Ansible Tower label."
	description: [
		"Create, update, or destroy Ansible Tower labels. See U(https://www.ansible.com/tower) for an overview.",
	]

	options: {
		name: {
			description: [
				"Name to use for the label.",
			]
			required: true
		}
		organization: {
			description: [
				"Organization the label should be applied to.",
			]
			required: true
		}
		state: {
			description: [
				"Desired state of the resource.",
			]
			default: "present"
			choices: ["present", "absent"]
		}
	}
	extends_documentation_fragment: "tower"
}
