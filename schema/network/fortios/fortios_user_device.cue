package ansible

module: fortios_user_device: {
	module:            "fortios_user_device"
	short_description: "Configure devices in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify user feature and device category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
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
		user_device: {
			description: [
				"Configure devices.",
			]
			default: null
			type:    "dict"
			suboptions: {
				alias: {
					description: [
						"Device alias.",
					]
					required: true
					type:     "str"
				}
				avatar: {
					description: [
						"Image file for avatar (maximum 4K base64 encoded).",
					]
					type: "str"
				}
				category: {
					description: [
						"Device category.",
					]
					type: "str"
					choices: [
						"none",
						"amazon-device",
						"android-device",
						"blackberry-device",
						"fortinet-device",
						"ios-device",
						"windows-device",
					]
				}
				comment: {
					description: [
						"Comment.",
					]
					type: "str"
				}
				mac: {
					description: [
						"Device MAC address.",
					]
					type: "str"
				}
				master_device: {
					description: [
						"Master device (optional). Source user.device.alias.",
					]
					type: "str"
				}
				tagging: {
					description: [
						"Config object tagging.",
					]
					type: "list"
					suboptions: {
						category: {
							description: [
								"Tag category. Source system.object-tagging.category.",
							]
							type: "str"
						}
						name: {
							description: [
								"Tagging entry name.",
							]
							required: true
							type:     "str"
						}
						tags: {
							description: [
								"Tags.",
							]
							type: "list"
							suboptions: name: {
								description: [
									"Tag name. Source system.object-tagging.tags.name.",
								]
								required: true
								type:     "str"
							}
						}
					}
				}
				type: {
					description: [
						"Device type.",
					]
					type: "str"
					choices: [
						"unknown",
						"android-phone",
						"android-tablet",
						"blackberry-phone",
						"blackberry-playbook",
						"forticam",
						"fortifone",
						"fortinet-device",
						"gaming-console",
						"ip-phone",
						"ipad",
						"iphone",
						"linux-pc",
						"mac",
						"media-streaming",
						"printer",
						"router-nat-device",
						"windows-pc",
						"windows-phone",
						"windows-tablet",
						"other-network-device",
					]
				}
				user: {
					description: [
						"User name.",
					]
					type: "str"
				}
			}
		}
	}
}
