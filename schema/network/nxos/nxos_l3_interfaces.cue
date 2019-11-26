package ansible

module: nxos_l3_interfaces: {
	module:            "nxos_l3_interfaces"
	version_added:     2.9
	short_description: "Manages Layer-3 Interfaces attributes of NX-OS Interfaces"
	description:       "This module manages Layer-3 interfaces attributes of NX-OS Interfaces."
	author:            "Trishna Guha (@trishnaguha)"
	notes: [
		"Tested against NXOS 7.3.(0)D1(1) on VIRL",
	]
	options: {
		config: {
			description: "A dictionary of Layer-3 interface options"
			type:        "list"
			elements:    "dict"
			suboptions: {
				name: {
					description: [
						"Full name of L3 interface, i.e. Ethernet1/1.",
					]
					type:     "str"
					required: true
				}
				ipv4: {
					description: [
						"IPv4 address and attributes of the L3 interface.",
					]
					type:     "list"
					elements: "dict"
					suboptions: {
						address: {
							description: [
								"IPV4 address of the L3 interface.",
							]
							type: "str"
						}
						tag: {
							description: [
								"URIB route tag value for local/direct routes.",
							]
							type: "int"
						}
						secondary: {
							description: [
								"A boolean attribute to manage addition of secondary IP address.",
							]
							type:    "bool"
							default: false
						}
					}
				}
				ipv6: {
					description: [
						"IPv6 address and attributes of the L3 interface.",
					]
					type:     "list"
					elements: "dict"
					suboptions: {
						address: {
							description: [
								"IPV6 address of the L3 interface.",
							]
							type: "str"
						}
						tag: {
							description: [
								"URIB route tag value for local/direct routes.",
							]
							type: "int"
						}
					}
				}
			}
		}

		state: {
			description: [
				"The state of the configuration after module completion.",
			]
			type: "str"
			choices: [
				"merged",
				"replaced",
				"overridden",
				"deleted",
			]
			default: "merged"
		}
	}
}
