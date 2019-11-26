package ansible

module: onyx_igmp_interface: {
	module:            "onyx_igmp_interface"
	version_added:     "2.8"
	author:            "Anas Badaha (@anasb)"
	short_description: "Configures IGMP interface parameters"
	description: [
		"This module provides declarative management of IGMP interface configuration on Mellanox ONYX network devices.",
	]

	notes: [
		"Tested on ONYX 3.6.8130",
	]
	options: {
		name: {
			description: [
				"interface name that we want to configure IGMP on it",
			]
			required: true
		}
		state: {
			description: [
				"IGMP Interface state.",
			]
			choices: ["enabled", "disabled"]
			default: "enabled"
		}
	}
}
