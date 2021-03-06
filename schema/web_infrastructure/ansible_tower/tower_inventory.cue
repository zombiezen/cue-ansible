package ansible

module: tower_inventory: {
	module:            "tower_inventory"
	version_added:     "2.3"
	author:            "Wayne Witzel III (@wwitzel3)"
	short_description: "create, update, or destroy Ansible Tower inventory."
	description: [
		"Create, update, or destroy Ansible Tower inventories. See U(https://www.ansible.com/tower) for an overview.",
	]

	options: {
		name: {
			description: [
				"The name to use for the inventory.",
			]
			required: true
		}
		description: description: [
			"The description to use for the inventory.",
		]
		organization: {
			description: [
				"Organization the inventory belongs to.",
			]
			required: true
		}
		variables: description: [
			"Inventory variables. Use C(@) to get from file.",
		]
		kind: {
			description: [
				"The kind field. Cannot be modified after created.",
			]
			default: ""
			choices: ["", "smart"]
			version_added: "2.7"
		}
		host_filter: {
			description: [
				"The host_filter field. Only useful when C(kind=smart).",
			]
			version_added: "2.7"
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
