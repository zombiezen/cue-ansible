package ansible

module: fortios_spamfilter_fortishield: {
	module:            "fortios_spamfilter_fortishield"
	short_description: "Configure FortiGuard - AntiSpam in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify spamfilter feature and fortishield category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
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
		spamfilter_fortishield: {
			description: [
				"Configure FortiGuard - AntiSpam.",
			]
			default: null
			type:    "dict"
			suboptions: {
				spam_submit_force: {
					description: [
						"Enable/disable force insertion of a new mime entity for the submission text.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				spam_submit_srv: {
					description: [
						"Hostname of the spam submission server.",
					]
					type: "str"
				}
				spam_submit_txt2htm: {
					description: [
						"Enable/disable conversion of text email to HTML email.",
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