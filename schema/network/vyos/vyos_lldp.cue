package ansible

module: vyos_lldp: {
	module:            "vyos_lldp"
	version_added:     "2.4"
	author:            "Ricardo Carrillo Cruz (@rcarrillocruz)"
	short_description: "Manage LLDP configuration on VyOS network devices"
	description: [
		"This module provides declarative management of LLDP service on VyOS network devices.",
	]

	deprecated: {
		removed_in:  "2.13"
		alternative: "vyos_lldp_global"
		why:         "Updated modules released with more functionality."
	}
	notes: [
		"Tested against VYOS 1.1.7",
	]
	options: {
		interfaces: {
			description: [
				"Name of the interfaces.",
			]
			type: "list"
		}
		state: {
			description: [
				"State of the link aggregation group.",
			]
			default: "present"
			choices: ["present", "absent", "enabled", "disabled"]
			type: "str"
		}
	}
	extends_documentation_fragment: "vyos"
}
