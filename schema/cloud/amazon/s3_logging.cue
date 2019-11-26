package ansible

module: s3_logging: {
	module:            "s3_logging"
	short_description: "Manage logging facility of an s3 bucket in AWS"
	description: [
		"Manage logging facility of an s3 bucket in AWS",
	]
	version_added: "2.0"
	author:        "Rob White (@wimnat)"
	options: {
		name: {
			description: [
				"Name of the s3 bucket.",
			]
			required: true
			type:     "str"
		}
		state: {
			description: [
				"Enable or disable logging.",
			]
			default: "present"
			choices: ["present", "absent"]
			type: "str"
		}
		target_bucket: {
			description: [
				"The bucket to log to. Required when state=present.",
			]
			type: "str"
		}
		target_prefix: {
			description: [
				"The prefix that should be prepended to the generated log files written to the target_bucket.",
			]
			default: ""
			type:    "str"
		}
	}
	extends_documentation_fragment: [
		"aws",
		"ec2",
	]
}
