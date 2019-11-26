package ansible

module: cp_mgmt_publish: {
	module:            "cp_mgmt_publish"
	short_description: "All the changes done by this user will be seen by all users only after publish is called."
	description: [
		"All the changes done by this user will be seen by all users only after publish is called.",
		"All operations are performed over Web Services API.",
	]
	version_added: "2.9"
	author:        "Or Soffer (@chkp-orso)"
	options: uid: {
		description: [
			"Session unique identifier. Specify it to publish a different session than the one you currently use.",
		]
		type: "str"
	}
	extends_documentation_fragment: "checkpoint_commands"
}
