package ansible

module: fortios_system_automation_stitch: {
	module:            "fortios_system_automation_stitch"
	short_description: "Automation stitches in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify system feature and automation_stitch category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
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
		system_automation_stitch: {
			description: [
				"Automation stitches.",
			]
			default: null
			type:    "dict"
			suboptions: {
				action: {
					description: [
						"Action names.",
					]
					type: "list"
					suboptions: name: {
						description: [
							"Action name. Source system.automation-action.name.",
						]
						required: true
						type:     "str"
					}
				}
				destination: {
					description: [
						"Serial number/HA group-name of destination devices.",
					]
					type: "list"
					suboptions: name: {
						description: [
							"Destination name. Source system.automation-destination.name.",
						]
						required: true
						type:     "str"
					}
				}
				name: {
					description: [
						"Name.",
					]
					required: true
					type:     "str"
				}
				status: {
					description: [
						"Enable/disable this stitch.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				trigger: {
					description: [
						"Trigger name. Source system.automation-trigger.name.",
					]
					type: "str"
				}
			}
		}
	}
}
