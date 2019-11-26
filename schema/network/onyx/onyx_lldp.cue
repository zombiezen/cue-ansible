package ansible

module: onyx_lldp: {
	module:            "onyx_lldp"
	version_added:     "2.5"
	author:            "Samer Deeb (@samerd)"
	short_description: "Manage LLDP configuration on Mellanox ONYX network devices"
	description: [
		"This module provides declarative management of LLDP service configuration on Mellanox ONYX network devices.",
	]

	options: state: {
		description: [
			"State of the LLDP protocol configuration.",
		]
		default: "present"
		choices: ["present", "absent"]
	}
}
