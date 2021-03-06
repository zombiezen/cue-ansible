package ansible

module: pn_ipv6security_raguard_vlan: {
	module:            "pn_ipv6security_raguard_vlan"
	author:            "Pluribus Networks (@rajaspachipulusu17)"
	version_added:     "2.9"
	short_description: "CLI command to add/remove ipv6security-raguard-vlan"
	description: [
		"This module can be used to Add vlans to RA Guard Policy and Remove vlans to RA Guard Policy.",
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
				"ipv6security-raguard-vlan configuration command.",
			]
			required: false
			type:     "str"
			choices: ["present", "absent"]
			default: "present"
		}
		pn_vlans: {
			description: [
				"Vlans attached to RA Guard Policy.",
			]
			required: true
			type:     "str"
		}
		pn_name: {
			description: [
				"RA Guard Policy Name.",
			]
			required: true
			type:     "str"
		}
	}
}
