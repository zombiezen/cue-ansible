package ansible

module: fortios_user_tacacsplus: {
	module:            "fortios_user_tacacsplus"
	short_description: "Configure TACACS+ server entries in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify user feature and tacacsplus category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
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
		state: {
			description: [
				"Indicates whether to create or remove the object. This attribute was present already in previous version in a deeper level. It has been moved out to this outer level.",
			]

			type:     "str"
			required: false
			choices: [
				"present",
				"absent",
			]
			version_added: 2.9
		}
		user_tacacsplus: {
			description: [
				"Configure TACACS+ server entries.",
			]
			default: null
			type:    "dict"
			suboptions: {
				state: {
					description: [
						"B(Deprecated)",
						"Starting with Ansible 2.9 we recommend using the top-level 'state' parameter.",
						"HORIZONTALLINE",
						"Indicates whether to create or remove the object.",
					]
					type:     "str"
					required: false
					choices: [
						"present",
						"absent",
					]
				}
				authen_type: {
					description: [
						"Allowed authentication protocols/methods.",
					]
					type: "str"
					choices: [
						"mschap",
						"chap",
						"pap",
						"ascii",
						"auto",
					]
				}
				authorization: {
					description: [
						"Enable/disable TACACS+ authorization.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				key: {
					description: [
						"Key to access the primary server.",
					]
					type: "str"
				}
				name: {
					description: [
						"TACACS+ server entry name.",
					]
					required: true
					type:     "str"
				}
				port: {
					description: [
						"Port number of the TACACS+ server.",
					]
					type: "int"
				}
				secondary_key: {
					description: [
						"Key to access the secondary server.",
					]
					type: "str"
				}
				secondary_server: {
					description: [
						"Secondary TACACS+ server CN domain name or IP address.",
					]
					type: "str"
				}
				server: {
					description: [
						"Primary TACACS+ server CN domain name or IP address.",
					]
					type: "str"
				}
				source_ip: {
					description: [
						"source IP for communications to TACACS+ server.",
					]
					type: "str"
				}
				tertiary_key: {
					description: [
						"Key to access the tertiary server.",
					]
					type: "str"
				}
				tertiary_server: {
					description: [
						"Tertiary TACACS+ server CN domain name or IP address.",
					]
					type: "str"
				}
			}
		}
	}
}
