package ansible

module: eos_lldp_interfaces: {
	module:            "eos_lldp_interfaces"
	version_added:     2.9
	short_description: "Manage Link Layer Discovery Protocol (LLDP) attributes of interfaces on Arista EOS devices."
	description: [
		"This module manages Link Layer Discovery Protocol (LLDP) attributes of interfaces on Arista EOS devices.",
	]
	author: "Nathaniel Case (@Qalthos)"
	notes: [
		"Tested against Arista EOS 4.20.10M",
		"This module works with connection C(network_cli). See the L(EOS Platform Options,../network/user_guide/platform_eos.html).",
	]

	options: {
		config: {
			description: "A dictionary of LLDP interfaces options."
			type:        "list"
			elements:    "dict"
			suboptions: {
				name: {
					description: [
						"Full name of the interface (i.e. Ethernet1).",
					]
					type: "str"
				}
				receive: {
					description: [
						"Enable/disable LLDP RX on an interface.",
					]
					type: "bool"
				}
				transmit: {
					description: [
						"Enable/disable LLDP TX on an interface.",
					]
					type: "bool"
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
