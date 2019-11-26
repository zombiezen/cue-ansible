package ansible

module: vyos_vlan: {
	module:            "vyos_vlan"
	version_added:     "2.5"
	author:            "Trishna Guha (@trishnaguha)"
	short_description: "Manage VLANs on VyOS network devices"
	description: [
		"This module provides declarative management of VLANs on VyOS network devices.",
	]

	notes: [
		"Tested against VyOS 1.1.8 (helium).",
		"This module works with connection C(network_cli). See L(the VyOS OS Platform Options,../network/user_guide/platform_vyos.html).",
	]
	options: {
		name: description: [
			"Name of the VLAN.",
		]
		address: description: [
			"Configure Virtual interface address.",
		]
		vlan_id: {
			description: [
				"ID of the VLAN. Range 0-4094.",
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
				"This is a intent option and checks the operational state of the for given vlan C(name) for associated interfaces. If the value in the C(associated_interfaces) does not match with the operational state of vlan on device it will result in failure.",
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
			choices: ["present", "absent"]
		}
	}
	extends_documentation_fragment: "vyos"
}
