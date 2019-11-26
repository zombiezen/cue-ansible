package ansible

module: ios_linkagg: {
	module:            "ios_linkagg"
	version_added:     "2.5"
	author:            "Trishna Guha (@trishnaguha)"
	short_description: "Manage link aggregation groups on Cisco IOS network devices"
	description: [
		"This module provides declarative management of link aggregation groups on Cisco IOS network devices.",
	]

	notes: [
		"Tested against IOS 15.2",
	]
	options: {
		group: description: [
			"Channel-group number for the port-channel Link aggregation group. Range 1-255.",
		]

		mode: {
			description: [
				"Mode of the link aggregation group.",
			]
			choices: ["active", "on", "passive", "auto", "desirable"]
		}
		members: description: [
			"List of members of the link aggregation group.",
		]
		aggregate: description: "List of link aggregation definitions."
		state: {
			description: [
				"State of the link aggregation group.",
			]
			default: "present"
			choices: ["present", "absent"]
		}
		purge: {
			description: [
				"Purge links not defined in the I(aggregate) parameter.",
			]
			default: false
			type:    "bool"
		}
	}
	extends_documentation_fragment: "ios"
}
