package ansible

module: fortios_web_proxy_wisp: {
	module:            "fortios_web_proxy_wisp"
	short_description: "Configure Wireless Internet service provider (WISP) servers in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify web_proxy feature and wisp category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
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
		state: {
			description: [
				"Indicates whether to create or remove the object.",
			]
			type:     "str"
			required: true
			choices: [
				"present",
				"absent",
			]
		}
		web_proxy_wisp: {
			description: [
				"Configure Wireless Internet service provider (WISP) servers.",
			]
			default: null
			type:    "dict"
			suboptions: {
				comment: {
					description: [
						"Comment.",
					]
					type: "str"
				}
				max_connections: {
					description: [
						"Maximum number of web proxy WISP connections (4 - 4096).",
					]
					type: "int"
				}
				name: {
					description: [
						"Server name.",
					]
					required: true
					type:     "str"
				}
				outgoing_ip: {
					description: [
						"WISP outgoing IP address.",
					]
					type: "str"
				}
				server_ip: {
					description: [
						"WISP server IP address.",
					]
					type: "str"
				}
				server_port: {
					description: [
						"WISP server port (1 - 65535).",
					]
					type: "int"
				}
				timeout: {
					description: [
						"Period of time before WISP requests time out (1 - 15 sec).",
					]
					type: "int"
				}
			}
		}
	}
}
