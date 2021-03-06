package ansible

module: vyos_lldp_interface: {
	module:            "vyos_lldp_interface"
	version_added:     "2.4"
	author:            "Ricardo Carrillo Cruz (@rcarrillocruz)"
	short_description: "Manage LLDP interfaces configuration on VyOS network devices"
	description: [
		"This module provides declarative management of LLDP interfaces configuration on VyOS network devices.",
	]

	deprecated: {
		removed_in:  "2.13"
		alternative: "vyos_lldp_interfaces"
		why:         "Updated modules released with more functionality."
	}
	notes: [
		"Tested against VYOS 1.1.7",
	]
	options: {
		name: {
			description: [
				"Name of the interface LLDP should be configured on.",
			]
			type: "str"
		}
		aggregate: {
			description: "List of interfaces LLDP should be configured on."
			type:        "list"
		}
		state: {
			description: [
				"State of the LLDP configuration.",
			]
			default: "present"
			choices: ["present", "absent", "enabled", "disabled"]
			type: "str"
		}
	}
	extends_documentation_fragment: "vyos"
}
