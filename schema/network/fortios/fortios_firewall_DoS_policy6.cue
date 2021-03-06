package ansible

module: fortios_firewall_DoS_policy6: {
	module:            "fortios_firewall_DoS_policy6"
	short_description: "Configure IPv6 DoS policies in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify firewall feature and DoS_policy6 category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
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
		firewall_DoS_policy6: {
			description: [
				"Configure IPv6 DoS policies.",
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
				anomaly: {
					description: [
						"Anomaly name.",
					]
					type: "list"
					suboptions: {
						action: {
							description: [
								"Action taken when the threshold is reached.",
							]
							type: "str"
							choices: [
								"pass",
								"block",
							]
						}
						log: {
							description: [
								"Enable/disable anomaly logging.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						name: {
							description: [
								"Anomaly name.",
							]
							required: true
							type:     "str"
						}
						quarantine: {
							description: [
								"Quarantine method.",
							]
							type: "str"
							choices: [
								"none",
								"attacker",
							]
						}
						quarantine_expiry: {
							description: ["Duration of quarantine. (Format"] //##d##h##m, minimum 1m, maximum 364d23h59m). Requires quarantine set to attacker.
							type: "str"
						}
						quarantine_log: {
							description: [
								"Enable/disable quarantine logging.",
							]
							type: "str"
							choices: [
								"disable",
								"enable",
							]
						}
						status: {
							description: [
								"Enable/disable this anomaly.",
							]
							type: "str"
							choices: [
								"disable",
								"enable",
							]
						}
						threshold: {
							description: [
								"Anomaly threshold. Number of detected instances per minute that triggers the anomaly action.",
							]
							type: "int"
						}
						"threshold(default)": {
							description: [
								"Number of detected instances per minute which triggers action (1 - 2147483647). Note that each anomaly has a different threshold value assigned to it.",
							]

							type: "int"
						}
					}
				}
				comments: {
					description: [
						"Comment.",
					]
					type: "str"
				}
				dstaddr: {
					description: [
						"Destination address name from available addresses.",
					]
					type: "list"
					suboptions: name: {
						description: [
							"Address name. Source firewall.address6.name firewall.addrgrp6.name.",
						]
						required: true
						type:     "str"
					}
				}
				interface: {
					description: [
						"Incoming interface name from available interfaces. Source system.zone.name system.interface.name.",
					]
					type: "str"
				}
				policyid: {
					description: [
						"Policy ID.",
					]
					required: true
					type:     "int"
				}
				service: {
					description: [
						"Service object from available options.",
					]
					type: "list"
					suboptions: name: {
						description: [
							"Service name. Source firewall.service.custom.name firewall.service.group.name.",
						]
						required: true
						type:     "str"
					}
				}
				srcaddr: {
					description: [
						"Source address name from available addresses.",
					]
					type: "list"
					suboptions: name: {
						description: [
							"Service name. Source firewall.address6.name firewall.addrgrp6.name.",
						]
						required: true
						type:     "str"
					}
				}
				status: {
					description: [
						"Enable/disable this policy.",
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
