package ansible

module: nxos_vlans: {
	module:            "nxos_vlans"
	version_added:     2.9
	short_description: "Create VLAN and manage VLAN configurations on NX-OS Interfaces"
	description:       "This module creates and manages VLAN configurations on Cisco NX-OS Interfaces."
	author:            "Trishna Guha (@trishnaguha)"
	notes: [
		"Tested against NXOS 7.3.(0)D1(1) on VIRL",
	]
	options: {
		config: {
			description: "A dictionary of Vlan options"
			type:        "list"
			suboptions: {
				vlan_id: {
					description: [
						"Vlan ID.",
					]
					type:     "int"
					required: true
				}
				name: {
					description: [
						"Name of VLAN.",
					]
					type: "str"
				}
				state: {
					description: [
						"Manage operational state of the vlan.",
					]
					type: "str"
					choices: ["active", "suspend"]
				}
				enabled: {
					description: [
						"Manage administrative state of the vlan.",
					]
					type: "bool"
				}
				mode: {
					description: [
						"Set vlan mode to classical ethernet or fabricpath. This is a valid option for Nexus 5000, 6000 and 7000 series.",
					]

					type: "str"
					choices: ["ce", "fabricpath"]
				}
				mapped_vni: {
					description: [
						"The Virtual Network Identifier (VNI) ID that is mapped to the VLAN.",
					]

					type: "int"
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
