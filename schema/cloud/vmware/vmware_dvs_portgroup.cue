package ansible

module: vmware_dvs_portgroup: {
	module:            "vmware_dvs_portgroup"
	short_description: "Create or remove a Distributed vSwitch portgroup."
	description: [
		"Create or remove a Distributed vSwitch portgroup.",
	]
	version_added: 2.0
	author: [
		"Joseph Callen (@jcpowermac)",
		"Philippe Dellaert (@pdellaert) <philippe@dellaert.org>",
	]
	notes: [
		"Tested on vSphere 5.5",
		"Tested on vSphere 6.5",
	]
	requirements: [
		"python >= 2.6",
		"PyVmomi",
	]
	options: {
		portgroup_name: {
			description: [
				"The name of the portgroup that is to be created or deleted.",
			]
			required: true
			type:     "str"
		}
		switch_name: {
			description: [
				"The name of the distributed vSwitch the port group should be created on.",
			]
			required: true
			type:     "str"
		}
		vlan_id: {
			description: [
				"The VLAN ID that should be configured with the portgroup, use 0 for no VLAN.",
				"If C(vlan_trunk) is configured to be I(true), this can be a combination of multiple ranges and numbers, example: 1-200, 205, 400-4094.",
				"The valid C(vlan_id) range is from 0 to 4094. Overlapping ranges are allowed.",
			]
			required: true
			type:     "str"
		}
		num_ports: {
			description: [
				"The number of ports the portgroup should contain.",
			]
			required: true
			type:     "int"
		}
		portgroup_type: {
			description: [
				"See VMware KB 1022312 regarding portgroup types.",
			]
			required: true
			choices: [
				"earlyBinding",
				"lateBinding",
				"ephemeral",
			]
			type: "str"
		}
		state: {
			description: [
				"Determines if the portgroup should be present or not.",
			]
			required: true
			type:     "str"
			choices: [
				"present",
				"absent",
			]
			version_added: "2.5"
		}
		vlan_trunk: {
			description: [
				"Indicates whether this is a VLAN trunk or not.",
			]
			required:      false
			default:       false
			type:          "bool"
			version_added: "2.5"
		}
		network_policy: {
			description: [
				"Dictionary which configures the different security values for portgroup.",
				"Valid attributes are:",
				"- C(promiscuous) (bool): indicates whether promiscuous mode is allowed. (default: false)",
				"- C(forged_transmits) (bool): indicates whether forged transmits are allowed. (default: false)",
				"- C(mac_changes) (bool): indicates whether mac changes are allowed. (default: false)",
			]
			required:      false
			version_added: "2.5"
			default: {
				promiscuous:      false
				forged_transmits: false
				mac_changes:      false
			}

			type: "dict"
		}
		teaming_policy: {
			description: [
				"Dictionary which configures the different teaming values for portgroup.",
				"Valid attributes are:",
				"- C(load_balance_policy) (string): Network adapter teaming policy. (default: loadbalance_srcid)",
				"   - choices: [ loadbalance_ip, loadbalance_srcmac, loadbalance_srcid, loadbalance_loadbased, failover_explicit]",
				"   - \"loadbalance_loadbased\" is available from version 2.6 and onwards",
				"- C(inbound_policy) (bool): Indicate whether or not the teaming policy is applied to inbound frames as well. (default: False)",
				"- C(notify_switches) (bool): Indicate whether or not to notify the physical switch if a link fails. (default: True)",
				"- C(rolling_order) (bool): Indicate whether or not to use a rolling policy when restoring links. (default: False)",
			]
			required:      false
			version_added: "2.5"
			default: {
				notify_switches:     true
				load_balance_policy: "loadbalance_srcid"
				inbound_policy:      false
				rolling_order:       false
			}

			type: "dict"
		}
		port_policy: {
			description: [
				"Dictionary which configures the advanced policy settings for the portgroup.",
				"Valid attributes are:",
				"- C(block_override) (bool): indicates if the block policy can be changed per port. (default: true)",
				"- C(ipfix_override) (bool): indicates if the ipfix policy can be changed per port. (default: false)",
				"- C(live_port_move) (bool): indicates if a live port can be moved in or out of the portgroup. (default: false)",
				"- C(network_rp_override) (bool): indicates if the network resource pool can be changed per port. (default: false)",
				"- C(port_config_reset_at_disconnect) (bool): indicates if the configuration of a port is reset automatically after disconnect. (default: true)",
				"- C(security_override) (bool): indicates if the security policy can be changed per port. (default: false)",
				"- C(shaping_override) (bool): indicates if the shaping policy can be changed per port. (default: false)",
				"- C(traffic_filter_override) (bool): indicates if the traffic filter can be changed per port. (default: false)",
				"- C(uplink_teaming_override) (bool): indicates if the uplink teaming policy can be changed per port. (default: false)",
				"- C(vendor_config_override) (bool): indicates if the vendor config can be changed per port. (default: false)",
				"- C(vlan_override) (bool): indicates if the vlan can be changed per port. (default: false)",
			]
			required:      false
			version_added: "2.5"
			default: {
				traffic_filter_override:         false
				network_rp_override:             false
				live_port_move:                  false
				security_override:               false
				vendor_config_override:          false
				port_config_reset_at_disconnect: true
				uplink_teaming_override:         false
				block_override:                  true
				shaping_override:                false
				vlan_override:                   false
				ipfix_override:                  false
			}

			type: "dict"
		}
	}

	extends_documentation_fragment: "vmware.documentation"
}
