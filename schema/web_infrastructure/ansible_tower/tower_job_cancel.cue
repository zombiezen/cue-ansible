package ansible

module: tower_job_cancel: {
	module:            "tower_job_cancel"
	author:            "Wayne Witzel III (@wwitzel3)"
	version_added:     "2.3"
	short_description: "Cancel an Ansible Tower Job."
	description: [
		"Cancel Ansible Tower jobs. See U(https://www.ansible.com/tower) for an overview.",
	]

	options: {
		job_id: {
			description: [
				"ID of the job to cancel",
			]
			required: true
		}
		fail_if_not_running: {
			description: [
				"Fail loudly if the I(job_id) does not reference a running job.",
			]
			default: false
			type:    "bool"
		}
	}
	extends_documentation_fragment: "tower"
}
