package ansible

module: fortios_firewall_ssl_setting: {
	module:            "fortios_firewall_ssl_setting"
	short_description: "SSL proxy settings in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify firewall_ssl feature and setting category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
	]

	version_added: "2.8"
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
			type:          "bool"
			default:       true
			version_added: 2.9
		}
		firewall_ssl_setting: {
			description: [
				"SSL proxy settings.",
			]
			default: null
			type:    "dict"
			suboptions: {
				abbreviate_handshake: {
					description: [
						"Enable/disable use of SSL abbreviated handshake.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				cert_cache_capacity: {
					description: [
						"Maximum capacity of the host certificate cache (0 - 500).",
					]
					type: "int"
				}
				cert_cache_timeout: {
					description: [
						"Time limit to keep certificate cache (1 - 120 min).",
					]
					type: "int"
				}
				kxp_queue_threshold: {
					description: [
						"Maximum length of the CP KXP queue. When the queue becomes full, the proxy switches cipher functions to the main CPU (0 - 512).",
					]
					type: "int"
				}
				no_matching_cipher_action: {
					description: [
						"Bypass or drop the connection when no matching cipher is found.",
					]
					type: "str"
					choices: [
						"bypass",
						"drop",
					]
				}
				proxy_connect_timeout: {
					description: [
						"Time limit to make an internal connection to the appropriate proxy process (1 - 60 sec).",
					]
					type: "int"
				}
				session_cache_capacity: {
					description: [
						"Capacity of the SSL session cache (--Obsolete--) (1 - 1000).",
					]
					type: "int"
				}
				session_cache_timeout: {
					description: [
						"Time limit to keep SSL session state (1 - 60 min).",
					]
					type: "int"
				}
				ssl_dh_bits: {
					description: [
						"Bit-size of Diffie-Hellman (DH) prime used in DHE-RSA negotiation.",
					]
					type: "str"
					choices: [
						768,
						1024,
						1536,
						2048,
					]
				}
				ssl_queue_threshold: {
					description: [
						"Maximum length of the CP SSL queue. When the queue becomes full, the proxy switches cipher functions to the main CPU (0 - 512).",
					]
					type: "int"
				}
				ssl_send_empty_frags: {
					description: [
						"Enable/disable sending empty fragments to avoid attack on CBC IV (for SSL 3.0 and TLS 1.0 only).",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
			}
		}
	}
}
