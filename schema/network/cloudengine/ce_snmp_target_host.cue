package ansible

module: ce_snmp_target_host: {
	module:            "ce_snmp_target_host"
	version_added:     "2.4"
	short_description: "Manages SNMP target host configuration on HUAWEI CloudEngine switches."
	description: [
		"Manages SNMP target host configurations on HUAWEI CloudEngine switches.",
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
		version: {
			description: [
				"Version(s) Supported by SNMP Engine.",
			]
			choices: ["none", "v1", "v2c", "v3", "v1v2c", "v1v3", "v2cv3", "all"]
		}
		connect_port: description: [
			"Udp port used by SNMP agent to connect the Network management.",
		]
		host_name: description: [
			"Unique name to identify target host entry.",
		]
		address: description: [
			"Network Address.",
		]
		notify_type: {
			description: [
				"To configure notify type as trap or inform.",
			]
			choices: ["trap", "inform"]
		}
		vpn_name: description: [
			"VPN instance Name.",
		]
		recv_port: description: [
			"UDP Port number used by network management to receive alarm messages.",
		]
		security_model: {
			description: [
				"Security Model.",
			]
			choices: ["v1", "v2c", "v3"]
		}
		security_name: description: [
			"Security Name.",
		]
		security_name_v3: description: [
			"Security Name V3.",
		]
		security_level: {
			description: [
				"Security level indicating whether to use authentication and encryption.",
			]
			choices: ["noAuthNoPriv", "authentication", "privacy"]
		}
		is_public_net: {
			description: [
				"To enable or disable Public Net-manager for target Host.",
			]
			default: "no_use"
			choices: ["no_use", "true", "false"]
		}
		interface_name: description: ["Name of the interface to send the trap message."]
	}
}
