package ansible

module: rax_scaling_policy: {
	module:            "rax_scaling_policy"
	short_description: "Manipulate Rackspace Cloud Autoscale Scaling Policy"
	description: [
		"Manipulate Rackspace Cloud Autoscale Scaling Policy",
	]
	version_added: 1.7
	options: {
		at: description: [
			"The UTC time when this policy will be executed. The time must be formatted according to C(yyyy-MM-dd'T'HH:mm:ss.SSS) such as C(2013-05-19T08:07:08Z)",
		]

		change: description: [
			"The change, either as a number of servers or as a percentage, to make in the scaling group. If this is a percentage, you must set I(is_percent) to C(true) also.",
		]

		cron: description: [
			"The time when the policy will be executed, as a cron entry. For example, if this is parameter is set to C(1 0 * * *)",
		]

		cooldown: description: [
			"The period of time, in seconds, that must pass before any scaling can occur after the previous scaling. Must be an integer between 0 and 86400 (24 hrs).",
		]

		desired_capacity: description: [
			"The desired server capacity of the scaling the group; that is, how many servers should be in the scaling group.",
		]

		is_percent: {
			description: [
				"Whether the value in I(change) is a percent value",
			]
			default: false
			type:    "bool"
		}
		name: {
			description: [
				"Name to give the policy",
			]
			required: true
		}
		policy_type: {
			description: [
				"The type of policy that will be executed for the current release.",
			]
			choices: [
				"webhook",
				"schedule",
			]
			required: true
		}
		scaling_group: {
			description: [
				"Name of the scaling group that this policy will be added to",
			]
			required: true
		}
		state: {
			description: [
				"Indicate desired state of the resource",
			]
			choices: [
				"present",
				"absent",
			]
			default: "present"
		}
	}
	author: "Matt Martz (@sivel)"
	extends_documentation_fragment: [
		"rackspace",
		"rackspace.openstack",
	]
}
