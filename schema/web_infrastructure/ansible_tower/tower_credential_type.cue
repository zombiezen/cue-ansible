package ansible

module: tower_credential_type: {
	module:            "tower_credential_type"
	author:            "Adrien Fleury (@fleu42)"
	version_added:     "2.7"
	short_description: "Create, update, or destroy custom Ansible Tower credential type."
	description: [
		"Create, update, or destroy Ansible Tower credential type. See U(https://www.ansible.com/tower) for an overview.",
	]

	options: {
		name: {
			description: [
				"The name of the credential type.",
			]
			required: true
		}
		description: {
			description: [
				"The description of the credential type to give more detail about it.",
			]
			required: false
		}
		kind: {
			description: [
				"The type of credential type being added. Note that only cloud and net can be used for creating credential types. Refer to the Ansible for more information.",
			]

			choices: ["ssh", "vault", "net", "scm", "cloud", "insights"]
			required: false
		}
		inputs: {
			description: [
				"Enter inputs using either JSON or YAML syntax. Refer to the Ansible Tower documentation for example syntax.",
			]

			required: false
		}
		injectors: {
			description: [
				"Enter injectors using either JSON or YAML syntax. Refer to the Ansible Tower documentation for example syntax.",
			]

			required: false
		}
		state: {
			description: [
				"Desired state of the resource.",
			]
			required: false
			default:  "present"
			choices: ["present", "absent"]
		}
		validate_certs: {
			description: [
				"Tower option to avoid certificates check.",
			]
			required: false
			type:     "bool"
			aliases: ["tower_verify_ssl"]
		}
	}
	extends_documentation_fragment: "tower"
}
