package ansible

module: iosxr_lag_interfaces: {
	module:            "iosxr_lag_interfaces"
	version_added:     2.9
	short_description: "Manages attributes of LAG/Ether-Bundle interfaces on IOS-XR devices."
	description: [
		"This module manages the attributes of LAG/Ether-Bundle interfaces on IOS-XR devices.",
	]
	notes: [
		"Tested against IOS-XR 6.1.3.",
		"This module works with connection C(network_cli). See L(the IOS-XR Platform Options,../network/user_guide/platform_iosxr.html).",
	]
	author: "Nilashish Chakraborty (@NilashishC)"
	options: {
		config: {
			description: "A provided Link Aggregation Group (LAG) configuration."
			type:        "list"
			elements:    "dict"
			suboptions: {
				name: {
					description: [
						"Name/Identifier of the LAG/Ether-Bundle to configure.",
					]
					type:     "str"
					required: true
				}
				members: {
					description: [
						"List of member interfaces for the LAG/Ether-Bundle.",
					]
					type:     "list"
					elements: "dict"
					suboptions: {
						member: {
							description: [
								"Name of the member interface.",
							]
							type: "str"
						}
						mode: {
							description: [
								"Specifies the mode of the operation for the member interface.",
								"Mode 'active' runs LACP in active mode.",
								"Mode 'on' does not run LACP over the port.",
								"Mode 'passive' runs LACP in passive mode over the port.",
								"Mode 'inherit' runs LACP as configured in the bundle.",
							]
							choices: ["on", "active", "passive", "inherit"]
							type: "str"
						}
					}
				}
				mode: {
					description: [
						"LAG mode.",
						"Mode 'active' runs LACP in active mode over the port.",
						"Mode 'on' does not run LACP over the port.",
						"Mode 'passive' runs LACP in passive mode over the port.",
					]
					choices: ["on", "active", "passive"]
					type: "str"
				}
				links: {
					description: [
						"This dict contains configurable options related to LAG/Ether-Bundle links.",
					]
					type: "dict"
					suboptions: {
						max_active: {
							description: [
								"Specifies the limit on the number of links that can be active in the LAG/Ether-Bundle.",
								"Refer to vendor documentation for valid values.",
							]
							type: "int"
						}
						min_active: {
							description: [
								"Specifies the minimum number of active links needed to bring up the LAG/Ether-Bundle.",
								"Refer to vendor documentation for valid values.",
							]
							type: "int"
						}
					}
				}
				load_balancing_hash: {
					description: [
						"Specifies the hash function used for traffic forwarded over the LAG/Ether-Bundle.",
						"Option 'dst-ip' uses the destination IP as the hash function.",
						"Option 'src-ip' uses the source IP as the hash function.",
					]
					type: "str"
					choices: ["dst-ip", "src-ip"]
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
