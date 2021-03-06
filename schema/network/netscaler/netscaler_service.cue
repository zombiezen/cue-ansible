package ansible

module: netscaler_service: {
	module:            "netscaler_service"
	short_description: "Manage service configuration in Netscaler"
	description: [
		"Manage service configuration in Netscaler.",
		"This module allows the creation, deletion and modification of Netscaler services.",
		"This module is intended to run either on the ansible  control node or a bastion (jumpserver) with access to the actual netscaler instance.",
		"This module supports check mode.",
	]

	version_added: "2.4.0"

	author: "George Nikolopoulos (@giorgos-nikolopoulos)"

	options: {

		name: description: [
			"Name for the service. Must begin with an ASCII alphabetic or underscore C(_) character, and must contain only ASCII alphanumeric, underscore C(_), hash C(#), period C(.), space C( ), colon C(:), at C(@), equals C(=), and hyphen C(-) characters. Cannot be changed after the service has been created.",
			"Minimum length = 1",
		]

		ip: description: [
			"IP to assign to the service.",
			"Minimum length = 1",
		]

		servername: description: [
			"Name of the server that hosts the service.",
			"Minimum length = 1",
		]

		servicetype: {
			choices: [
				"HTTP",
				"FTP",
				"TCP",
				"UDP",
				"SSL",
				"SSL_BRIDGE",
				"SSL_TCP",
				"DTLS",
				"NNTP",
				"RPCSVR",
				"DNS",
				"ADNS",
				"SNMP",
				"RTSP",
				"DHCPRA",
				"ANY",
				"SIP_UDP",
				"SIP_TCP",
				"SIP_SSL",
				"DNS_TCP",
				"ADNS_TCP",
				"MYSQL",
				"MSSQL",
				"ORACLE",
				"RADIUS",
				"RADIUSListener",
				"RDP",
				"DIAMETER",
				"SSL_DIAMETER",
				"TFTP",
				"SMPP",
				"PPTP",
				"GRE",
				"SYSLOGTCP",
				"SYSLOGUDP",
				"FIX",
				"SSL_FIX",
			]
			description: [
				"Protocol in which data is exchanged with the service.",
			]
		}

		port: description: [
			"Port number of the service.",
			"Range 1 - 65535",
			"* in CLI is represented as 65535 in NITRO API",
		]

		cleartextport: description: [
			"Port to which clear text data must be sent after the appliance decrypts incoming SSL traffic. Applicable to transparent SSL services.",
			"Minimum value = 1",
		]

		cachetype: {
			choices: [
				"TRANSPARENT",
				"REVERSE",
				"FORWARD",
			]
			description: [
				"Cache type supported by the cache server.",
			]
		}

		maxclient: description: [
			"Maximum number of simultaneous open connections to the service.",
			"Minimum value = 0",
			"Maximum value = 4294967294",
		]

		healthmonitor: {
			description: [
				"Monitor the health of this service",
			]
			default: true
			type:    "bool"
		}

		maxreq: description: [
			"Maximum number of requests that can be sent on a persistent connection to the service.",
			"Note: Connection requests beyond this value are rejected.",
			"Minimum value = 0",
			"Maximum value = 65535",
		]

		cacheable: {
			description: [
				"Use the transparent cache redirection virtual server to forward requests to the cache server.",
				"Note: Do not specify this parameter if you set the Cache Type parameter.",
			]
			default: false
			type:    "bool"
		}

		cip: {
			choices: [
				"enabled",
				"disabled",
			]
			description: [
				"Before forwarding a request to the service, insert an HTTP header with the client's IPv4 or IPv6 address as its value. Used if the server needs the client's IP address for security, accounting, or other purposes, and setting the Use Source IP parameter is not a viable option.",
			]
		}

		cipheader: description: [
			"Name for the HTTP header whose value must be set to the IP address of the client. Used with the Client IP parameter. If you set the Client IP parameter, and you do not specify a name for the header, the appliance uses the header name specified for the global Client IP Header parameter (the cipHeader parameter in the set ns param CLI command or the Client IP Header parameter in the Configure HTTP Parameters dialog box at System > Settings > Change HTTP parameters). If the global Client IP Header parameter is not specified, the appliance inserts a header with the name \"client-ip.\".",
			"Minimum length = 1",
		]

		usip: {
			description: [
				"Use the client's IP address as the source IP address when initiating a connection to the server. When creating a service, if you do not set this parameter, the service inherits the global Use Source IP setting (available in the enable ns mode and disable ns mode CLI commands, or in the System > Settings > Configure modes > Configure Modes dialog box). However, you can override this setting after you create the service.",
			]

			type: "bool"
		}

		pathmonitor: description: [
			"Path monitoring for clustering.",
		]

		pathmonitorindv: description: [
			"Individual Path monitoring decisions.",
		]

		useproxyport: {
			description: [
				"Use the proxy port as the source port when initiating connections with the server. With the NO setting, the client-side connection port is used as the source port for the server-side connection.",
				"Note: This parameter is available only when the Use Source IP (USIP) parameter is set to YES.",
			]
			type: "bool"
		}

		sp: {
			description: [
				"Enable surge protection for the service.",
			]
			type: "bool"
		}

		rtspsessionidremap: {
			description: [
				"Enable RTSP session ID mapping for the service.",
			]
			default: false
			type:    "bool"
		}

		clttimeout: description: [
			"Time, in seconds, after which to terminate an idle client connection.",
			"Minimum value = 0",
			"Maximum value = 31536000",
		]

		svrtimeout: description: [
			"Time, in seconds, after which to terminate an idle server connection.",
			"Minimum value = 0",
			"Maximum value = 31536000",
		]

		customserverid: {
			description: [
				"Unique identifier for the service. Used when the persistency type for the virtual server is set to Custom Server ID.",
			]

			default: "None"
		}

		serverid: description: [
			"The identifier for the service. This is used when the persistency type is set to Custom Server ID.",
		]

		cka: {
			description: [
				"Enable client keep-alive for the service.",
			]
			type: "bool"
		}

		tcpb: {
			description: [
				"Enable TCP buffering for the service.",
			]
			type: "bool"
		}

		cmp: {
			description: [
				"Enable compression for the service.",
			]
			type: "bool"
		}

		maxbandwidth: description: [
			"Maximum bandwidth, in Kbps, allocated to the service.",
			"Minimum value = 0",
			"Maximum value = 4294967287",
		]

		accessdown: {
			description: [
				"Use Layer 2 mode to bridge the packets sent to this service if it is marked as DOWN. If the service is DOWN, and this parameter is disabled, the packets are dropped.",
			]

			default: false
			type:    "bool"
		}
		monthreshold: description: [
			"Minimum sum of weights of the monitors that are bound to this service. Used to determine whether to mark a service as UP or DOWN.",
			"Minimum value = 0",
			"Maximum value = 65535",
		]

		downstateflush: {
			choices: [
				"enabled",
				"disabled",
			]
			description: [
				"Flush all active transactions associated with a service whose state transitions from UP to DOWN. Do not enable this option for applications that must complete their transactions.",
			]
		}

		tcpprofilename: description: [
			"Name of the TCP profile that contains TCP configuration settings for the service.",
			"Minimum length = 1",
			"Maximum length = 127",
		]

		httpprofilename: description: [
			"Name of the HTTP profile that contains HTTP configuration settings for the service.",
			"Minimum length = 1",
			"Maximum length = 127",
		]

		hashid: description: [
			"A numerical identifier that can be used by hash based load balancing methods. Must be unique for each service.",
			"Minimum value = 1",
		]

		comment: description: [
			"Any information about the service.",
		]

		appflowlog: {
			choices: [
				"enabled",
				"disabled",
			]
			description: [
				"Enable logging of AppFlow information.",
			]
		}

		netprofile: description: [
			"Network profile to use for the service.",
			"Minimum length = 1",
			"Maximum length = 127",
		]

		td: description: [
			"Integer value that uniquely identifies the traffic domain in which you want to configure the entity. If you do not specify an ID, the entity becomes part of the default traffic domain, which has an ID of 0.",
			"Minimum value = 0",
			"Maximum value = 4094",
		]

		processlocal: {
			choices: [
				"enabled",
				"disabled",
			]
			description: [
				"By turning on this option packets destined to a service in a cluster will not under go any steering. Turn this option for single packet request response mode or when the upstream device is performing a proper RSS for connection based distribution.",
			]
		}

		dnsprofilename: description: [
			"Name of the DNS profile to be associated with the service. DNS profile properties will applied to the transactions processed by a service. This parameter is valid only for ADNS and ADNS-TCP services.",
			"Minimum length = 1",
			"Maximum length = 127",
		]

		ipaddress: description: [
			"The new IP address of the service.",
		]

		graceful: {
			description: [
				"Shut down gracefully, not accepting any new connections, and disabling the service when all of its connections are closed.",
			]

			default: false
			type:    "bool"
		}

		monitor_bindings: {
			description: [
				"A list of load balancing monitors to bind to this service.",
				"Each monitor entry is a dictionary which may contain the following options.",
				"Note that if not using the built in monitors they must first be setup.",
			]
			suboptions: {
				monitorname: description: [
					"Name of the monitor.",
				]
				weight: description: [
					"Weight to assign to the binding between the monitor and service.",
				]
				dup_state: {
					choices: [
						"enabled",
						"disabled",
					]
					description: [
						"State of the monitor.",
						"The state setting for a monitor of a given type affects all monitors of that type.",
						"For example, if an HTTP monitor is enabled, all HTTP monitors on the appliance are (or remain) enabled.",
						"If an HTTP monitor is disabled, all HTTP monitors on the appliance are disabled.",
					]
				}
				dup_weight: description: [
					"Weight to assign to the binding between the monitor and service.",
				]
			}
		}

		disabled: {
			description: [
				"When set to C(yes) the service state will be set to DISABLED.",
				"When set to C(no) the service state will be set to ENABLED.",
				"Note that due to limitations of the underlying NITRO API a C(disabled) state change alone does not cause the module result to report a changed status.",
			]

			type:    "bool"
			default: false
		}
	}

	extends_documentation_fragment: "netscaler"
	requirements: ["nitro python sdk"]
}
