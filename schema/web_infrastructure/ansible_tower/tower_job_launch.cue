package ansible

module: tower_job_launch: {
	module:            "tower_job_launch"
	author:            "Wayne Witzel III (@wwitzel3)"
	version_added:     "2.3"
	short_description: "Launch an Ansible Job."
	description: [
		"Launch an Ansible Tower jobs. See U(https://www.ansible.com/tower) for an overview.",
	]

	options: {
		job_template: {
			description: [
				"Name of the job template to use.",
			]
			required: true
		}
		job_explanation: description: [
			"Job explanation field.",
		]
		job_type: {
			description: [
				"Job_type to use for the job, only used if prompt for job_type is set.",
			]
			choices: ["run", "check", "scan"]
		}
		inventory: description: [
			"Inventory to use for the job, only used if prompt for inventory is set.",
		]
		credential: description: [
			"Credential to use for job, only used if prompt for credential is set.",
		]
		extra_vars: description: [
			"Extra_vars to use for the job_template. Prepend C(@) if a file.",
		]
		limit: description: [
			"Limit to use for the I(job_template).",
		]
		tags: description: [
			"Specific tags to use for from playbook.",
		]
		use_job_endpoint: {
			description: [
				"Disable launching jobs from job template.",
			]
			type:    "bool"
			default: "no"
		}
	}
	extends_documentation_fragment: "tower"
}
