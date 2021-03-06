package ansible

module: pn_vrouter_interface_ip: {
	module:            "pn_vrouter_interface_ip"
	author:            "Pluribus Networks (@rajaspachipulusu17)"
	version_added:     "2.8"
	short_description: "CLI command to add/remove vrouter-interface-ip"
	description: [
		"This module can be used to add an IP address on interface from a vRouter or remove an IP address on interface from a vRouter.",
	]

	options: {
		pn_cliswitch: {
			description: [
				"Target switch to run the CLI on.",
			]
			required: false
			type:     "str"
		}
		state: {
			description: [
				"State the action to perform. Use C(present) to addvrouter-interface-ip and C(absent) to remove vrouter-interface-ip.",
			]

			required: true
			type:     "str"
			choices: ["present", "absent"]
		}
		pn_bd: {
			description: [
				"interface Bridge Domain.",
			]
			required: false
			type:     "str"
		}
		pn_netmask: {
			description: [
				"netmask.",
			]
			required: false
			type:     "str"
		}
		pn_vnet: {
			description: [
				"interface VLAN VNET.",
			]
			required: false
			type:     "str"
		}
		pn_ip: {
			description: [
				"IP address.",
			]
			required: false
			type:     "str"
		}
		pn_nic: {
			description: [
				"virtual NIC assigned to interface.",
			]
			required: false
			type:     "str"
		}
		pn_vrouter_name: {
			description: [
				"name of service config.",
			]
			required: false
			type:     "str"
		}
	}
}
