package ansible

module: onyx_linkagg: {
	module:            "onyx_linkagg"
	version_added:     "2.5"
	author:            "Samer Deeb (@samerd)"
	short_description: "Manage link aggregation groups on Mellanox ONYX network devices"
	description: [
		"This module provides declarative management of link aggregation groups on Mellanox ONYX network devices.",
	]

	options: {
		name: {
			description: [
				"Name of the link aggregation group.",
			]
			required: true
		}
		mode: {
			description: [
				"Mode of the link aggregation group. A value of C(on) will enable LACP. C(active) configures the link to actively information about the state of the link, or it can be configured in C(passive) mode ie. send link state information only when received them from another link.",
			]

			default: true
			choices: ["on", "active", "passive"]
		}
		members: {
			description: [
				"List of members interfaces of the link aggregation group. The value can be single interface or list of interfaces.",
			]

			required: true
		}
		aggregate: description: "List of link aggregation definitions."
		purge: {
			description: [
				"Purge link aggregation groups not defined in the I(aggregate) parameter.",
			]
			default: false
			type:    "bool"
		}
		state: {
			description: [
				"State of the link aggregation group.",
			]
			default: "present"
			choices: ["present", "absent", "up", "down"]
		}
	}
}
