package ansible

module: fortios_firewall_proxy_addrgrp: {
	module:            "fortios_firewall_proxy_addrgrp"
	short_description: "Web proxy address group configuration in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify firewall feature and proxy_addrgrp category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
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
		firewall_proxy_addrgrp: {
			description: [
				"Web proxy address group configuration.",
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
				color: {
					description: [
						"Integer value to determine the color of the icon in the GUI (1 - 32).",
					]
					type: "int"
				}
				comment: {
					description: [
						"Optional comments.",
					]
					type: "str"
				}
				member: {
					description: [
						"Members of address group.",
					]
					type: "list"
					suboptions: name: {
						description: [
							"Address name. Source firewall.proxy-address.name firewall.proxy-addrgrp.name.",
						]
						required: true
						type:     "str"
					}
				}
				name: {
					description: [
						"Address group name.",
					]
					required: true
					type:     "str"
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
						"Source or destination address group type.",
					]
					type: "str"
					choices: [
						"src",
						"dst",
					]
				}
				uuid: {
					description: [
						"Universally Unique Identifier (UUID; automatically assigned but can be manually reset).",
					]
					type: "str"
				}
				visibility: {
					description: [
						"Enable/disable visibility of the object in the GUI.",
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
