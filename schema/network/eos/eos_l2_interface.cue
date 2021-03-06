package ansible

module: eos_l2_interface: {
	module:            "eos_l2_interface"
	version_added:     "2.5"
	author:            "Ricardo Carrillo Cruz (@rcarrillocruz)"
	short_description: "Manage L2 interfaces on Arista EOS network devices."
	description: [
		"This module provides declarative management of L2 interfaces on Arista EOS network devices.",
	]

	deprecated: {
		removed_in:  "2.13"
		alternative: "eos_l2_interfaces"
		why:         "Updated modules released with more functionality"
	}
	notes: [
		"Tested against EOS 4.15",
	]
	options: {
		name: {
			description: [
				"Name of the interface",
			]
			required: true
			aliases: ["interface"]
		}
		mode: {
			description: [
				"Mode in which interface needs to be configured.",
			]
			choices: ["access", "trunk"]
		}
		access_vlan: description: [
			"Configure given VLAN in access port. If C(mode=access), used as the access VLAN ID.",
		]

		native_vlan: description: [
			"Native VLAN to be configured in trunk port. If C(mode=trunk), used as the trunk native VLAN ID.",
		]

		trunk_allowed_vlans: {
			description: [
				"List of allowed VLANs in a given trunk port. If C(mode=trunk), these are the ONLY VLANs that will be configured on the trunk, i.e. C(2-10,15).",
			]

			aliases: ["trunk_vlans"]
		}
		aggregate: description: [
			"List of Layer-2 interface definitions.",
		]
		state: {
			description: [
				"Manage the state of the Layer-2 Interface configuration.",
			]
			default: "present"
			choices: ["present", "absent", "unconfigured"]
		}
	}
	extends_documentation_fragment: "eos"
}
