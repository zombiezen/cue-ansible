package ansible

module: checkpoint_task_facts: {
	module:            "checkpoint_task_facts"
	short_description: "Get task objects facts on Check Point over Web Services API"
	description: [
		"Get task objects facts on Check Point devices. All operations are performed over Web Services API.",
	]

	version_added: "2.8"
	author:        "Ansible by Red Hat (@rcarrillocruz)"
	options: task_id: {
		description: [
			"ID of the task object.",
		]
		type:     "str"
		required: true
	}
}
