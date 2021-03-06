package ansible

module: eos_interfaces: {
	module:            "eos_interfaces"
	version_added:     2.9
	short_description: "Manages interface attributes of Arista EOS interfaces"
	description: ["This module manages the interface attributes of Arista EOS interfaces."]
	author: ["Nathaniel Case (@qalthos)"]
	notes: [
		"Tested against Arista EOS 4.20.10M",
		"This module works with connection C(network_cli). See the L(EOS Platform Options,../network/user_guide/platform_eos.html).",
	]

	options: {
		config: {
			description: "The provided configuration"
			type:        "list"
			suboptions: {
				name: {
					description: [
						"Full name of the interface, e.g. GigabitEthernet1.",
					]
					type:     "str"
					required: true
				}
				description: {
					description: [
						"Interface description",
					]
					type: "str"
				}
				duplex: {
					description: [
						"Interface link status. Applicable for Ethernet interfaces only.",
						"Values other than C(auto) must also set I(speed).",
						"Ignored when I(speed) is set above C(1000).",
					]
					type: "str"
				}
				enabled: {
					default: true
					description: [
						"Administrative state of the interface.",
						"Set the value to C(true) to administratively enable the interface or C(false) to disable it.",
					]

					type: "bool"
				}
				mtu: {
					description: [
						"MTU for a specific interface. Must be an even number between 576 and 9216. Applicable for Ethernet interfaces only.",
					]

					type: "int"
				}
				speed: {
					description: [
						"Interface link speed. Applicable for Ethernet interfaces only.",
					]
					type: "str"
				}
			}
		}
		state: {
			choices: [
				"merged",
				"replaced",
				"overridden",
				"deleted",
			]
			default: "merged"
			description: [
				"The state of the configuration after module completion.",
			]
			type: "str"
		}
	}
}
