package ansible

module: ios_vlan: {
	module:            "ios_vlan"
	version_added:     "2.5"
	author:            "Trishna Guha (@trishnaguha)"
	short_description: "Manage VLANs on IOS network devices"
	description: [
		"This module provides declarative management of VLANs on Cisco IOS network devices.",
	]

	deprecated: {
		removed_in:  "2.13"
		alternative: "ios_vlans"
		why:         "Newer and updated modules released with more functionality in Ansible 2.9"
	}
	notes: [
		"Tested against IOS 15.2",
	]
	options: {
		name: description: [
			"Name of the VLAN.",
		]
		vlan_id: {
			description: [
				"ID of the VLAN. Range 1-4094.",
			]
			required: true
		}
		interfaces: {
			description: [
				"List of interfaces that should be associated to the VLAN.",
			]
			required: true
		}
		associated_interfaces: {
			description: [
				"This is a intent option and checks the operational state of the for given vlan C(name) for associated interfaces. If the value in the C(associated_interfaces) does not match with the operational state of vlan interfaces on device it will result in failure.",
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
	extends_documentation_fragment: "ios"
}
