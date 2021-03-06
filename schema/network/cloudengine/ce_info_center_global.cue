package ansible

module: ce_info_center_global: {
	module:            "ce_info_center_global"
	version_added:     "2.4"
	short_description: "Manages outputting logs on HUAWEI CloudEngine switches."
	description: [
		"This module offers the ability to be output to the log buffer, log file, console, terminal, or log host on HUAWEI CloudEngine switches.",
	]
	author: [
		"Li Yanfeng (@QijunPan)",
	]
	notes: [
		"This module requires the netconf system service be enabled on the remote device being managed.",
		"Recommended connection is C(netconf).",
		"This module also works with C(local) connections for legacy playbooks.",
	]
	options: {
		info_center_enable: {
			description: [
				"Whether the info-center function is enabled. The value is of the Boolean type.",
			]
			choices: ["true", "false"]
		}
		packet_priority: description: [
			"Set the priority of the syslog packet.The value is an integer ranging from 0 to 7. The default value is 0.",
		]
		suppress_enable: {
			description: [
				"Whether a device is enabled to suppress duplicate statistics. The value is of the Boolean type.",
			]
			choices: ["false", "true"]
		}
		logfile_max_num: description: [
			"Maximum number of log files of the same type. The default value is 200.",
			"The value range for log files is[3, 500], for security files is [1, 3],and for operation files is [1, 7].",
		]
		logfile_max_size: {
			description: [
				"Maximum size (in MB) of a log file. The default value is 32.",
				"The value range for log files is [4, 8, 16, 32], for security files is [1, 4],",
				"and for operation files is [1, 4].",
			]
			default: 32
			choices: ["4", "8", "16", "32"]
		}
		channel_id: description: [
			"Number for channel. The value is an integer ranging from 0 to 9. The default value is 0.",
		]
		channel_cfg_name: {
			description: [
				"Channel name.The value is a string of 1 to 30 case-sensitive characters. The default value is console.",
			]
			default: "console"
		}
		channel_out_direct: {
			description: [
				"Direction of information output.",
			]
			choices: ["console", "monitor", "trapbuffer", "logbuffer", "snmp", "logfile"]
		}
		filter_feature_name: description: [
			"Feature name of the filtered log. The value is a string of 1 to 31 case-insensitive characters.",
		]
		filter_log_name: description: [
			"Name of the filtered log. The value is a string of 1 to 63 case-sensitive characters.",
		]
		ip_type: {
			description: [
				"Log server address type, IPv4 or IPv6.",
			]
			choices: ["ipv4", "ipv6"]
		}
		server_ip: description: [
			"Log server address, IPv4 or IPv6 type. The value is a string of 0 to 255 characters. The value can be an valid IPv4 or IPv6 address.",
		]

		server_domain: description: [
			"Server name. The value is a string of 1 to 255 case-sensitive characters.",
		]
		is_default_vpn: {
			description: [
				"Use the default VPN or not.",
			]
			type:    "bool"
			default: "no"
		}
		vrf_name: description: [
			"VPN name on a log server. The value is a string of 1 to 31 case-sensitive characters. The default value is _public_.",
		]

		level: {
			description: [
				"Level of logs saved on a log server.",
			]
			choices: ["emergencies", "alert", "critical", "error", "warning", "notification", "informational", "debugging"]
		}
		server_port: description: [
			"Number of a port sending logs.The value is an integer ranging from 1 to 65535. For UDP, the default value is 514. For TCP, the default value is 601. For TSL, the default value is 6514.",
		]

		facility: {
			description: [
				"Log record tool.",
			]
			choices: ["local0", "local1", "local2", "local3", "local4", "local5", "local6", "local7"]
		}
		channel_name: description: [
			"Channel name. The value is a string of 1 to 30 case-sensitive characters.",
		]
		timestamp: {
			description: [
				"Log server timestamp. The value is of the enumerated type and case-sensitive.",
			]
			choices: ["UTC", "localtime"]
		}
		transport_mode: {
			description: [
				"Transport mode. The value is of the enumerated type and case-sensitive.",
			]
			choices: ["tcp", "udp"]
		}
		ssl_policy_name: description: [
			"SSL policy name. The value is a string of 1 to 23 case-sensitive characters.",
		]
		source_ip: description: [
			"Log source ip address, IPv4 or IPv6 type. The value is a string of 0 to 255. The value can be an valid IPv4 or IPv6 address.",
		]

		state: {
			description: [
				"Specify desired state of the resource.",
			]
			default: "present"
			choices: ["present", "absent"]
		}
	}
}
