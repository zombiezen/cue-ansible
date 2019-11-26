package ansible

module: fortios_system_autoupdate_tunneling: {
	module:            "fortios_system_autoupdate_tunneling"
	short_description: "Configure web proxy tunnelling for the FDN in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify system_autoupdate feature and tunneling category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
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
		system_autoupdate_tunneling: {
			description: [
				"Configure web proxy tunnelling for the FDN.",
			]
			default: null
			type:    "dict"
			suboptions: {
				address: {
					description: [
						"Web proxy IP address or FQDN.",
					]
					type: "str"
				}
				password: {
					description: [
						"Web proxy password.",
					]
					type: "str"
				}
				port: {
					description: [
						"Web proxy port.",
					]
					type: "int"
				}
				status: {
					description: [
						"Enable/disable web proxy tunnelling.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				username: {
					description: [
						"Web proxy username.",
					]
					type: "str"
				}
			}
		}
	}
}
