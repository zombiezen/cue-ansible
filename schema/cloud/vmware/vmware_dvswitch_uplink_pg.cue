package ansible

module: vmware_dvswitch_uplink_pg: {
	module:            "vmware_dvswitch_uplink_pg"
	short_description: "Manage uplink portproup configuration of a Distributed Switch"
	description: [
		"This module can be used to configure the uplink portgroup of a Distributed Switch.",
	]
	version_added: 2.8
	author: [
		"Christian Kotte (@ckotte)",
	]
	notes: [
		"Tested on vSphere 6.5 and 6.7",
	]
	requirements: [
		"python >= 2.6",
		"PyVmomi",
	]
	options: {
		switch: {
			description: [
				"The name of the Distributed Switch.",
			]
			type:     "str"
			required: true
			aliases: ["dvswitch"]
		}
		name: {
			description: [
				"The name of the uplink portgroup.",
				"The current name will be used if not specified.",
			]
			type: "str"
		}
		description: {
			description: [
				"The description of the uplink portgroup.",
			]
			type: "str"
		}
		advanced: {
			description: [
				"Dictionary which configures the advanced policy settings for the uplink portgroup.",
				"Valid attributes are:",
				"- C(port_config_reset_at_disconnect) (bool): indicates if the configuration of a port is reset automatically after disconnect. (default: true)",
				"- C(block_override) (bool): indicates if the block policy can be changed per port. (default: true)",
				"- C(netflow_override) (bool): indicates if the NetFlow policy can be changed per port. (default: false)",
				"- C(traffic_filter_override) (bool): indicates if the traffic filter can be changed per port. (default: false)",
				"- C(vendor_config_override) (bool): indicates if the vendor config can be changed per port. (default: false)",
				"- C(vlan_override) (bool): indicates if the vlan can be changed per port. (default: false)",
			]
			required: false
			default: {
				port_config_reset_at_disconnect: true
				block_override:                  true
				vendor_config_override:          false
				vlan_override:                   false
				netflow_override:                false
				traffic_filter_override:         false
			}

			aliases: ["port_policy"]
			type: "dict"
		}
		vlan_trunk_range: {
			description: [
				"The VLAN trunk range that should be configured with the uplink portgroup.",
				"This can be a combination of multiple ranges and numbers, example: [ 2-3967, 4049-4092 ].",
			]
			type: "list"
			default: ["0-4094"]
		}
		lacp: {
			description: [
				"Dictionary which configures the LACP settings for the uplink portgroup.",
				"The options are only used if the LACP support mode is set to 'basic'.",
				"The following parameters are required:",
				"- C(status) (str): Indicates if LACP is enabled. (default: disabled)",
				"- C(mode) (str): The negotiating state of the uplinks/ports. (default: passive)",
			]
			required: false
			default: {
				status: "disabled"
				mode:   "passive"
			}

			type: "dict"
		}
		netflow_enabled: {
			description: [
				"Indicates if NetFlow is enabled on the uplink portgroup.",
			]
			type:    "bool"
			default: false
		}
		block_all_ports: {
			description: [
				"Indicates if all ports are blocked on the uplink portgroup.",
			]
			type:    "bool"
			default: false
		}
	}
	extends_documentation_fragment: "vmware.documentation"
}
