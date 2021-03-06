package ansible

module: tower_workflow_launch: {
	module:            "tower_workflow_launch"
	author:            "John Westcott IV (@john-westcott-iv)"
	version_added:     "2.8"
	short_description: "Run a workflow in Ansible Tower"
	description: [
		"Launch an Ansible Tower workflows. See U(https://www.ansible.com/tower) for an overview.",
	]

	options: {
		workflow_template: {
			description: [
				"The name of the workflow template to run.",
			]
			required: true
		}
		extra_vars: {
			description: [
				"Any extra vars required to launch the job.",
			]
			required: false
		}
		wait: {
			description: [
				"Wait for the workflow to complete.",
			]
			required: false
			default:  true
			type:     "bool"
		}
		timeout: description: [
			"If waiting for the workflow to complete this will abort after this amount of seconds",
		]
	}

	requirements: [
		"python >= 2.6",
	]
	extends_documentation_fragment: "tower"
}
