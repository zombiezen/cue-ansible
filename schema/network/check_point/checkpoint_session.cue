package ansible

module: checkpoint_session: {
	module:            "checkpoint_session"
	short_description: "Manages session objects on Check Point over Web Services API"
	description: [
		"Manages session objects on Check Point devices performing actions like publish and discard. All operations are performed over Web Services API.",
	]

	version_added: "2.8"
	author:        "Ansible by Red Hat (@rcarrillocruz)"
	options: {
		uid: {
			description: [
				"UID of the session.",
			]
			type:     "str"
			required: true
		}
		state: {
			description: [
				"Action to perform on the session object. Valid choices are published and discarded.",
			]
			type: "str"
			choices: ["published", "discarded"]
			default: "published"
		}
	}
}
