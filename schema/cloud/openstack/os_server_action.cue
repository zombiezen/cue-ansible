package ansible

module: os_server_action: {
	module:                         "os_server_action"
	short_description:              "Perform actions on Compute Instances from OpenStack"
	extends_documentation_fragment: "openstack"
	version_added:                  "2.0"
	author:                         "Jesse Keating (@omgjlk)"
	description: [
		"Perform server actions on an existing compute instance from OpenStack. This module does not return any data other than changed true/false. When I(action) is 'rebuild', then I(image) parameter is required.",
	]

	options: {
		server: {
			description: [
				"Name or ID of the instance",
			]
			required: true
		}
		wait: {
			description: [
				"If the module should wait for the instance action to be performed.",
			]
			type:    "bool"
			default: "yes"
		}
		timeout: {
			description: [
				"The amount of time the module should wait for the instance to perform the requested action.",
			]

			default: 180
		}
		action: {
			description: [
				"Perform the given action. The lock and unlock actions always return changed as the servers API does not provide lock status.",
			]

			choices: [
				"stop",
				"start",
				"pause",
				"unpause",
				"lock",
				"unlock",
				"suspend",
				"resume",
				"rebuild",
			]
			default: "present"
		}
		image: {
			description: [
				"Image the server should be rebuilt with",
			]
			version_added: "2.3"
		}
		availability_zone: description: [
			"Ignored. Present for backwards compatibility",
		]
	}
	requirements: [
		"python >= 2.7",
		"openstacksdk",
	]
}
