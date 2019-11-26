package ansible

module: ce_snmp_traps: {
	module:            "ce_snmp_traps"
	version_added:     "2.4"
	short_description: "Manages SNMP traps configuration on HUAWEI CloudEngine switches."
	description: [
		"Manages SNMP traps configurations on HUAWEI CloudEngine switches.",
	]
	author: [
		"wangdezhuang (@QijunPan)",
	]
	notes: [
		"Recommended connection is C(network_cli).",
		"This module also works with C(local) connections for legacy playbooks.",
	]
	options: {
		feature_name: {
			description: [
				"Alarm feature name.",
			]
			choices: [
				"aaa",
				"arp",
				"bfd",
				"bgp",
				"cfg",
				"configuration",
				"dad",
				"devm",
				"dhcpsnp",
				"dldp",
				"driver",
				"efm",
				"erps",
				"error-down",
				"fcoe",
				"fei",
				"fei_comm",
				"fm",
				"ifnet",
				"info",
				"ipsg",
				"ipv6",
				"isis",
				"l3vpn",
				"lacp",
				"lcs",
				"ldm",
				"ldp",
				"ldt",
				"lldp",
				"mpls_lspm",
				"msdp",
				"mstp",
				"nd",
				"netconf",
				"nqa",
				"nvo3",
				"openflow",
				"ospf",
				"ospfv3",
				"pim",
				"pim-std",
				"qos",
				"radius",
				"rm",
				"rmon",
				"securitytrap",
				"smlktrap",
				"snmp",
				"ssh",
				"stackmng",
				"sysclock",
				"sysom",
				"system",
				"tcp",
				"telnet",
				"trill",
				"trunk",
				"tty",
				"vbst",
				"vfs",
				"virtual-perception",
				"vrrp",
				"vstm",
				"all",
			]
		}
		trap_name: description: [
			"Alarm trap name.",
		]
		interface_type: {
			description: [
				"Interface type.",
			]
			choices: [
				"Ethernet",
				"Eth-Trunk",
				"Tunnel",
				"NULL",
				"LoopBack",
				"Vlanif",
				"100GE",
				"40GE",
				"MTunnel",
				"10GE",
				"GE",
				"MEth",
				"Vbdif",
				"Nve",
			]
		}
		interface_number: description: [
			"Interface number.",
		]
		port_number: description: ["Source port number."]
	}
}
