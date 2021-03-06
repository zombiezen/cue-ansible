package ansible

module: fortios_system_resource_limits: {
	module:            "fortios_system_resource_limits"
	short_description: "Configure resource limits in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify system feature and resource_limits category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
	]

	version_added: "2.9"
	author: [
		"Miguel Angel Munoz (@mamunozgonzalez)",
		"Nicolas Thomas (@thomnico)",
	]
	notes: [
		"Requires fortiosapi library developed by Fortinet",
		"Run as a local_action in your playbook",
	]
	requirements: [
		"fortiosapi>=0.9.8",
	]
	options: {
		host: {
			description: [
				"FortiOS or FortiGate IP address.",
			]
			type:     "str"
			required: false
		}
		username: {
			description: [
				"FortiOS or FortiGate username.",
			]
			type:     "str"
			required: false
		}
		password: {
			description: [
				"FortiOS or FortiGate password.",
			]
			type:    "str"
			default: ""
		}
		vdom: {
			description: [
				"Virtual domain, among those defined previously. A vdom is a virtual instance of the FortiGate that can be configured and used as a different unit.",
			]

			type:    "str"
			default: "root"
		}
		https: {
			description: [
				"Indicates if the requests towards FortiGate must use HTTPS protocol.",
			]
			type:    "bool"
			default: true
		}
		ssl_verify: {
			description: [
				"Ensures FortiGate certificate must be verified by a proper CA.",
			]
			type:    "bool"
			default: true
		}
		system_resource_limits: {
			description: [
				"Configure resource limits.",
			]
			default: null
			type:    "dict"
			suboptions: {
				custom_service: {
					description: [
						"Maximum number of firewall custom services.",
					]
					type: "int"
				}
				dialup_tunnel: {
					description: [
						"Maximum number of dial-up tunnels.",
					]
					type: "int"
				}
				firewall_address: {
					description: [
						"Maximum number of firewall addresses (IPv4, IPv6, multicast).",
					]
					type: "int"
				}
				firewall_addrgrp: {
					description: [
						"Maximum number of firewall address groups (IPv4, IPv6).",
					]
					type: "int"
				}
				firewall_policy: {
					description: [
						"Maximum number of firewall policies (IPv4, IPv6, policy46, policy64, DoS-policy4, DoS-policy6, multicast).",
					]
					type: "int"
				}
				ipsec_phase1: {
					description: [
						"Maximum number of VPN IPsec phase1 tunnels.",
					]
					type: "int"
				}
				ipsec_phase1_interface: {
					description: [
						"Maximum number of VPN IPsec phase1 interface tunnels.",
					]
					type: "int"
				}
				ipsec_phase2: {
					description: [
						"Maximum number of VPN IPsec phase2 tunnels.",
					]
					type: "int"
				}
				ipsec_phase2_interface: {
					description: [
						"Maximum number of VPN IPsec phase2 interface tunnels.",
					]
					type: "int"
				}
				log_disk_quota: {
					description: [
						"Log disk quota in MB.",
					]
					type: "int"
				}
				onetime_schedule: {
					description: [
						"Maximum number of firewall one-time schedules.",
					]
					type: "int"
				}
				proxy: {
					description: [
						"Maximum number of concurrent proxy users.",
					]
					type: "int"
				}
				recurring_schedule: {
					description: [
						"Maximum number of firewall recurring schedules.",
					]
					type: "int"
				}
				service_group: {
					description: [
						"Maximum number of firewall service groups.",
					]
					type: "int"
				}
				session: {
					description: [
						"Maximum number of sessions.",
					]
					type: "int"
				}
				sslvpn: {
					description: [
						"Maximum number of SSL-VPN.",
					]
					type: "int"
				}
				user: {
					description: [
						"Maximum number of local users.",
					]
					type: "int"
				}
				user_group: {
					description: [
						"Maximum number of user groups.",
					]
					type: "int"
				}
			}
		}
	}
}
