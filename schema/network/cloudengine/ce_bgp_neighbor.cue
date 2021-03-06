package ansible

module: ce_bgp_neighbor: {
	module:            "ce_bgp_neighbor"
	version_added:     "2.4"
	short_description: "Manages BGP peer configuration on HUAWEI CloudEngine switches."
	description: [
		"Manages BGP peer configurations on HUAWEI CloudEngine switches.",
	]
	author: [
		"wangdezhuang (@QijunPan)",
	]
	notes: [
		"This module requires the netconf system service be enabled on the remote device being managed.",
		"Recommended connection is C(netconf).",
		"This module also works with C(local) connections for legacy playbooks.",
	]
	options: {
		state: {
			description: [
				"Specify desired state of the resource.",
			]
			default: "present"
			choices: ["present", "absent"]
		}
		vrf_name: {
			description: [
				"Name of a BGP instance. The name is a case-sensitive string of characters. The BGP instance can be used only after the corresponding VPN instance is created.",
			]

			required: true
		}
		peer_addr: {
			description: [
				"Connection address of a peer, which can be an IPv4 or IPv6 address.",
			]
			required: true
		}
		remote_as: {
			description: [
				"AS number of a peer. The value is a string of 1 to 11 characters.",
			]

			required: true
		}
		description: description: [
			"Description of a peer, which can be letters or digits. The value is a string of 1 to 80 characters.",
		]

		fake_as: description: [
			"Fake AS number that is specified for a local peer. The value is a string of 1 to 11 characters.",
		]

		dual_as: {
			description: [
				"If the value is true, the EBGP peer can use either a fake AS number or the actual AS number. If the value is false, the EBGP peer can only use a fake AS number.",
			]

			choices: ["no_use", "true", "false"]
			default: "no_use"
		}
		conventional: {
			description: [
				"If the value is true, the router has all extended capabilities. If the value is false, the router does not have all extended capabilities.",
			]

			choices: ["no_use", "true", "false"]
			default: "no_use"
		}
		route_refresh: {
			description: [
				"If the value is true, BGP is enabled to advertise REFRESH packets. If the value is false, the route refresh function is enabled.",
			]

			choices: ["no_use", "true", "false"]
			default: "no_use"
		}
		is_ignore: {
			description: [
				"If the value is true, the session with a specified peer is torn down and all related routing entries are cleared. If the value is false, the session with a specified peer is retained.",
			]

			choices: ["no_use", "true", "false"]
			default: "no_use"
		}
		local_if_name: description: [
			"Name of a source interface that sends BGP packets. The value is a string of 1 to 63 characters.",
		]

		ebgp_max_hop: description: [
			"Maximum number of hops in an indirect EBGP connection. The value is an ranging from 1 to 255.",
		]

		valid_ttl_hops: description: [
			"Enable GTSM on a peer or peer group. The valid-TTL-Value parameter is used to specify the number of TTL hops to be detected. The value is an integer ranging from 1 to 255.",
		]

		connect_mode: description: [
			"The value can be Connect-only, Listen-only, or Both.",
		]
		is_log_change: {
			description: [
				"If the value is true, BGP is enabled to record peer session status and event information. If the value is false, BGP is disabled from recording peer session status and event information.",
			]

			choices: ["no_use", "true", "false"]
			default: "no_use"
		}
		pswd_type: {
			description: [
				"Enable BGP peers to establish a TCP connection and perform the Message Digest 5 (MD5) authentication for BGP messages.",
			]

			choices: ["null", "cipher", "simple"]
		}
		pswd_cipher_text: description: [
			"The character string in a password identifies the contents of the password, spaces not supported. The value is a string of 1 to 255 characters.",
		]

		keep_alive_time: description: [
			"Specify the Keepalive time of a peer or peer group. The value is an integer ranging from 0 to 21845. The default value is 60.",
		]

		hold_time: description: [
			"Specify the Hold time of a peer or peer group. The value is 0 or an integer ranging from 3 to 65535.",
		]

		min_hold_time: description: [
			"Specify the Min hold time of a peer or peer group.",
		]
		key_chain_name: description: [
			"Specify the Keychain authentication name used when BGP peers establish a TCP connection. The value is a string of 1 to 47 case-insensitive characters.",
		]

		conn_retry_time: description: [
			"ConnectRetry interval. The value is an integer ranging from 1 to 65535.",
		]

		tcp_MSS: description: [
			"Maximum TCP MSS value used for TCP connection establishment for a peer. The value is an integer ranging from 176 to 4096.",
		]

		mpls_local_ifnet_disable: {
			description: [
				"If the value is true, peer create MPLS Local IFNET disable. If the value is false, peer create MPLS Local IFNET enable.",
			]

			choices: ["no_use", "true", "false"]
			default: "no_use"
		}
		prepend_global_as: {
			description: [
				"Add the global AS number to the Update packets to be advertised.",
			]
			choices: ["no_use", "true", "false"]
			default: "no_use"
		}
		prepend_fake_as: {
			description: [
				"Add the Fake AS number to received Update packets.",
			]
			choices: ["no_use", "true", "false"]
			default: "no_use"
		}
		is_bfd_block: {
			description: [
				"If the value is true, peers are enabled to inherit the BFD function from the peer group. If the value is false, peers are disabled to inherit the BFD function from the peer group.",
			]

			choices: ["no_use", "true", "false"]
			default: "no_use"
		}
		multiplier: description: [
			"Specify the detection multiplier. The default value is 3. The value is an integer ranging from 3 to 50.",
		]

		is_bfd_enable: {
			description: [
				"If the value is true, BFD is enabled. If the value is false, BFD is disabled.",
			]

			choices: ["no_use", "true", "false"]
			default: "no_use"
		}
		rx_interval: description: [
			"Specify the minimum interval at which BFD packets are received. The value is an integer ranging from 50 to 1000, in milliseconds.",
		]

		tx_interval: description: [
			"Specify the minimum interval at which BFD packets are sent. The value is an integer ranging from 50 to 1000, in milliseconds.",
		]

		is_single_hop: {
			description: [
				"If the value is true, the system is enabled to preferentially use the single-hop mode for BFD session setup between IBGP peers. If the value is false, the system is disabled from preferentially using the single-hop mode for BFD session setup between IBGP peers.",
			]

			choices: ["no_use", "true", "false"]
			default: "no_use"
		}
	}
}
