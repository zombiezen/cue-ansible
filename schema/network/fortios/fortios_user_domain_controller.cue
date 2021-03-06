package ansible

module: fortios_user_domain_controller: {
	module:            "fortios_user_domain_controller"
	short_description: "Configure domain controller entries in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify user feature and domain_controller category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
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
		user_domain_controller: {
			description: [
				"Configure domain controller entries.",
			]
			default: null
			type:    "dict"
			suboptions: {
				domain_name: {
					description: [
						"Domain DNS name.",
					]
					type: "str"
				}
				ip_address: {
					description: [
						"Domain controller IP address.",
					]
					type: "str"
				}
				ldap_server: {
					description: [
						"LDAP server name. Source user.ldap.name.",
					]
					type: "str"
				}
				name: {
					description: [
						"Domain controller entry name.",
					]
					required: true
					type:     "str"
				}
				port: {
					description: [
						"Port to be used for communication with the domain controller .",
					]
					type: "int"
				}
			}
		}
	}
}
