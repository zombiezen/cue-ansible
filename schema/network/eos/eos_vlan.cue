package ansible

module: eos_vlan: {
	module:            "eos_vlan"
	version_added:     "2.4"
	author:            "Ricardo Carrillo Cruz (@rcarrillocruz)"
	short_description: "Manage VLANs on Arista EOS network devices"
	description: [
		"This module provides declarative management of VLANs on Arista EOS network devices.",
	]

	deprecated: {
		removed_in:  "2.13"
		alternative: "eos_vlans"
		why:         "Updated modules released with more functionality"
	}
	notes: [
		"Tested against EOS 4.15",
	]
	options: {
		name: description: [
			"Name of the VLAN.",
		]
		vlan_id: {
			description: [
				"ID of the VLAN.",
			]
			required: true
		}
		interfaces: description: [
			"List of interfaces that should be associated to the VLAN. The name of interface is case sensitive and should be in expanded format and not abbreviated.",
		]

		associated_interfaces: {
			description: [
				"This is a intent option and checks the operational state of the for given vlan C(name) for associated interfaces. The name of interface is case sensitive and should be in expanded format and not abbreviated. If the value in the C(associated_interfaces) does not match with the operational state of vlan interfaces on device it will result in failure.",
			]

			version_added: "2.5"
		}
		delay: {
			description: [
				"Delay the play should wait to check for declarative intent params values.",
			]
			default: 10
		}
		aggregate: description: "List of VLANs definitions."
		purge: {
			description: [
				"Purge VLANs not defined in the I(aggregate) parameter.",
			]
			default: false
			type:    "bool"
		}
		state: {
			description: [
				"State of the VLAN configuration.",
			]
			default: "present"
			choices: ["present", "absent", "active", "suspend"]
		}
	}
	extends_documentation_fragment: "eos"
}
