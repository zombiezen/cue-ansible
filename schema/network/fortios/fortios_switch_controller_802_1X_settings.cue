package ansible

module: fortios_switch_controller_802_1X_settings: {
	module:            "fortios_switch_controller_802_1X_settings"
	short_description: "Configure global 802.1X settings in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify switch_controller feature and 802_1X_settings category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
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
		switch_controller_802_1X_settings: {
			description: [
				"Configure global 802.1X settings.",
			]
			default: null
			type:    "dict"
			suboptions: {
				link_down_auth: {
					description: [
						"Interface-reauthentication state to set if a link is down.",
					]
					type: "str"
					choices: [
						"set-unauth",
						"no-action",
					]
				}
				max_reauth_attempt: {
					description: [
						"Maximum number of authentication attempts (0 - 15).",
					]
					type: "int"
				}
				reauth_period: {
					description: [
						"Period of time to allow for reauthentication (1 - 1440 sec).",
					]
					type: "int"
				}
			}
		}
	}
}
