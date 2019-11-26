package ansible

module: fortios_log_gui_display: {
	module:            "fortios_log_gui_display"
	short_description: "Configure how log messages are displayed on the GUI in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify log feature and gui_display category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
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
		log_gui_display: {
			description: [
				"Configure how log messages are displayed on the GUI.",
			]
			default: null
			type:    "dict"
			suboptions: {
				fortiview_unscanned_apps: {
					description: [
						"Enable/disable showing unscanned traffic in FortiView application charts.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				resolve_apps: {
					description: [
						"Resolve unknown applications on the GUI using Fortinet's remote application database.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				resolve_hosts: {
					description: [
						"Enable/disable resolving IP addresses to hostname in log messages on the GUI using reverse DNS lookup",
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
