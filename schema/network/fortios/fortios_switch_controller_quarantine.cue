package ansible

module: fortios_switch_controller_quarantine: {
	module:            "fortios_switch_controller_quarantine"
	short_description: "Configure FortiSwitch quarantine support in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify switch_controller feature and quarantine category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
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
		switch_controller_quarantine: {
			description: [
				"Configure FortiSwitch quarantine support.",
			]
			default: null
			type:    "dict"
			suboptions: {
				quarantine: {
					description: [
						"Enable/disable quarantine.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				targets: {
					description: [
						"Quarantine MACs.",
					]
					type: "list"
					suboptions: {
						description: {
							description: [
								"Description for the quarantine MAC.",
							]
							type: "str"
						}
						entry_id: {
							description: [
								"FSW entry id for the quarantine MAC.",
							]
							type: "int"
						}
						mac: {
							description: [
								"Quarantine MAC.",
							]
							required: true
							type:     "str"
						}
						tag: {
							description: [
								"Tags for the quarantine MAC.",
							]
							type: "list"
							suboptions: tags: {
								description: [
									"Tag string(eg. string1 string2 string3).",
								]
								required: true
								type:     "str"
							}
						}
					}
				}
			}
		}
	}
}
