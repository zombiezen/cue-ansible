package ansible

module: pn_vrouter_bgp: {
	module:            "pn_vrouter_bgp"
	author:            "Pluribus Networks (@rajaspachipulusu17)"
	version_added:     "2.9"
	short_description: "CLI command to add/modify/remove vrouter-bgp"
	description: [
		"This module can be used to add Border Gateway Protocol neighbor to a vRouter modify Border Gateway Protocol neighbor to a vRouter and remove Border Gateway Protocol neighbor from a vRouter.",
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
				"vrouter-bgp configuration command.",
			]
			required: false
			type:     "str"
			choices: ["present", "absent", "update"]
			default: "present"
		}
		pn_neighbor: {
			description: [
				"IP address for BGP neighbor.",
			]
			required: true
			type:     "str"
		}
		pn_vrouter_name: {
			description: [
				"name of service config.",
			]
			required: true
			type:     "str"
		}
		pn_send_community: {
			description: [
				"send any community attribute to neighbor.",
			]
			required: false
			type:     "bool"
		}
		pn_weight: {
			description: [
				"default weight value between 0 and 65535 for the neighbor's routes.",
			]
			required: false
		}
		pn_multi_protocol: {
			description: [
				"Multi-protocol features.",
			]
			required: false
			choices: ["ipv4-unicast", "ipv6-unicast"]
		}
		pn_prefix_list_in: {
			description: [
				"prefixes used for filtering.",
			]
			required: false
			type:     "str"
		}
		pn_route_reflector_client: {
			description: [
				"set as route reflector client.",
			]
			required: false
			type:     "bool"
		}
		pn_default_originate: {
			description: [
				"announce default routes to the neighbor or not.",
			]
			required: false
			type:     "bool"
		}
		pn_neighbor_holdtime: {
			description: [
				"BGP Holdtime (seconds).",
			]
			required: false
			type:     "str"
		}
		pn_connect_retry_interval: {
			description: [
				"BGP Connect retry interval (seconds).",
			]
			required: false
			type:     "str"
		}
		pn_advertisement_interval: {
			description: [
				"Minimum interval between sending BGP routing updates.",
			]
			required: false
			type:     "str"
		}
		pn_route_map_out: {
			description: [
				"route map out for nbr.",
			]
			required: false
			type:     "str"
		}
		pn_update_source: {
			description: [
				"IP address of BGP packets required for peering over loopback interface.",
			]
			required: false
			type:     "str"
		}
		pn_bfd: {
			description: [
				"BFD protocol support for fault detection.",
			]
			required: false
			type:     "bool"
			default:  false
		}
		pn_next_hop_self: {
			description: [
				"BGP next hop is self or not.",
			]
			required: false
			type:     "bool"
		}
		pn_allowas_in: {
			description: [
				"Allow/reject routes with local AS in AS_PATH.",
			]
			required: false
			type:     "bool"
		}
		pn_neighbor_keepalive_interval: {
			description: [
				"BGP Keepalive interval (seconds).",
			]
			required: false
			type:     "str"
		}
		pn_max_prefix: {
			description: [
				"maximum number of prefixes.",
			]
			required: false
			type:     "str"
		}
		pn_bfd_multihop: {
			description: [
				"always use BFD multi-hop port for fault detection.",
			]
			required: false
			type:     "bool"
		}
		pn_interface: {
			description: [
				"Interface to reach the neighbor.",
			]
			required: false
			type:     "str"
		}
		pn_password: {
			description: [
				"password for MD5 BGP.",
			]
			required: false
			type:     "str"
		}
		pn_route_map_in: {
			description: [
				"route map in for nbr.",
			]
			required: false
			type:     "str"
		}
		pn_soft_reconfig_inbound: {
			description: [
				"soft reset to reconfigure inbound traffic.",
			]
			required: false
			type:     "bool"
		}
		pn_override_capability: {
			description: [
				"override capability.",
			]
			required: false
			type:     "bool"
		}
		pn_max_prefix_warn_only: {
			description: [
				"warn if the maximum number of prefixes is exceeded.",
			]
			required: false
			type:     "bool"
		}
		pn_ebgp_multihop: {
			description: [
				"value for external BGP from 1 to 255.",
			]
			required: false
			type:     "str"
		}
		pn_remote_as: {
			description: [
				"BGP remote AS from 1 to 4294967295.",
			]
			required: false
			type:     "str"
		}
		pn_prefix_list_out: {
			description: [
				"prefixes used for filtering outgoing packets.",
			]
			required: false
			type:     "str"
		}
		pn_no_route_map_out: {
			description: [
				"Remove egress route-map from BGP neighbor.",
			]
			required: false
			type:     "str"
		}
		pn_no_route_map_in: {
			description: [
				"Remove ingress route-map from BGP neighbor.",
			]
			required: false
			type:     "str"
		}
	}
}
