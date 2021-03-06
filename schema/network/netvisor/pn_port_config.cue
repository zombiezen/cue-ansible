package ansible

module: pn_port_config: {
	module:            "pn_port_config"
	author:            "Pluribus Networks (@rajaspachipulusu17)"
	version_added:     2.8
	short_description: "CLI command to modify port-config"
	description: [
		"This module can be used to modify a port configuration.",
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
				"State the action to perform. Use C(update) to modify the port-config.",
			]
			required: true
			type:     "str"
			choices: ["update"]
		}
		pn_intf: {
			description: [
				"physical interface.",
			]
			required: false
			type:     "str"
		}
		pn_crc_check_enable: {
			description: [
				"CRC check on ingress and rewrite on egress.",
			]
			required: false
			type:     "bool"
		}
		pn_dscp_map: {
			description: [
				"DSCP map name to enable on port.",
			]
			required: false
			type:     "str"
		}
		pn_autoneg: {
			description: [
				"physical port autonegotiation.",
			]
			required: false
			type:     "bool"
		}
		pn_speed: {
			description: [
				"physical port speed.",
			]
			required: false
			choices: [
				"disable",
				"10m",
				"100m",
				"1g",
				"2.5g",
				"10g",
				"25g",
				"40g",
				"50g",
				"100g",
			]
		}
		pn_port: {
			description: [
				"physical port.",
			]
			required: false
			type:     "str"
		}
		pn_vxlan_termination: {
			description: [
				"physical port vxlan termination setting.",
			]
			required: false
			type:     "bool"
		}
		pn_pause: {
			description: [
				"physical port pause.",
			]
			required: false
			type:     "bool"
		}
		pn_loopback: {
			description: [
				"physical port loopback.",
			]
			required: false
			type:     "bool"
		}
		pn_loop_vlans: {
			description: [
				"looping vlans.",
			]
			required: false
			type:     "str"
		}
		pn_routing: {
			description: [
				"routing.",
			]
			required: false
			type:     "bool"
		}
		pn_edge_switch: {
			description: [
				"physical port edge switch.",
			]
			required: false
			type:     "bool"
		}
		pn_enable: {
			description: [
				"physical port enable.",
			]
			required: false
			type:     "bool"
		}
		pn_description: {
			description: [
				"physical port description.",
			]
			required: false
			type:     "str"
		}
		pn_host_enable: {
			description: [
				"Host facing port control setting.",
			]
			required: false
			type:     "bool"
		}
		pn_allowed_tpid: {
			description: [
				"Allowed TPID in addition to 0x8100 on Vlan header.",
			]
			required: false
			type:     "str"
			choices: ["vlan", "q-in-q", "q-in-q-old"]
		}
		pn_mirror_only: {
			description: [
				"physical port mirror only.",
			]
			required: false
			type:     "bool"
		}
		pn_reflect: {
			description: [
				"physical port reflection.",
			]
			required: false
			type:     "bool"
		}
		pn_jumbo: {
			description: [
				"jumbo frames on physical port.",
			]
			required: false
			type:     "bool"
		}
		pn_egress_rate_limit: {
			description: [
				"max egress port data rate limit.",
			]
			required: false
			type:     "str"
		}
		pn_eth_mode: {
			description: [
				"physical Ethernet mode.",
			]
			required: false
			choices: ["1000base-x", "sgmii", "disabled", "GMII"]
		}
		pn_fabric_guard: {
			description: [
				"Fabric guard configuration.",
			]
			required: false
			type:     "bool"
		}
		pn_local_switching: {
			description: [
				"no-local-switching port cannot bridge traffic to another no-local-switching port.",
			]

			required: false
			type:     "bool"
		}
		pn_lacp_priority: {
			description: [
				"LACP priority from 1 to 65535.",
			]
			required: false
			type:     "str"
		}
		pn_send_port: {
			description: [
				"send port.",
			]
			required: false
			type:     "str"
		}
		pn_port_mac_address: {
			description: [
				"physical port MAC Address.",
			]
			required: false
			type:     "str"
		}
		pn_defer_bringup: {
			description: [
				"defer port bringup.",
			]
			required: false
			type:     "bool"
		}
	}
}
