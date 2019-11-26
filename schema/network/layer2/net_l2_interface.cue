package ansible

module: net_l2_interface: {
	module:            "net_l2_interface"
	version_added:     "2.4"
	author:            "Ganesh Nalawade (@ganeshrn)"
	short_description: "Manage Layer-2 interface on network devices"
	description: [
		"This module provides declarative management of Layer-2 interface on network devices.",
	]

	deprecated: {
		removed_in:  "2.13"
		alternative: "Use platform-specific \"[netos]_l2_interfaces\" module"
		why:         "Updated modules released with more functionality"
	}
	extends_documentation_fragment: "network_agnostic"
	options: {
		name: description: [
			"Name of the interface excluding any logical unit number.",
		]
		aggregate: description: [
			"List of Layer-2 interface definitions.",
		]
		mode: {
			description: [
				"Mode in which interface needs to be configured.",
			]
			default: "access"
			choices: ["access", "trunk"]
		}
		access_vlan: description: [
			"Configure given VLAN in access port.",
		]
		trunk_vlans: description: [
			"List of VLANs to be configured in trunk port.",
		]
		native_vlan: description: [
			"Native VLAN to be configured in trunk port.",
		]
		trunk_allowed_vlans: description: [
			"List of allowed VLAN's in a given trunk port.",
		]
		state: {
			description: [
				"State of the Layer-2 Interface configuration.",
			]
			default: "present"
			choices: ["present", "absent"]
		}
	}
}
