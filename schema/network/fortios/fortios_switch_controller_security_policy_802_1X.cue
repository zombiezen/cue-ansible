package ansible

module: fortios_switch_controller_security_policy_802_1X: {
	module:            "fortios_switch_controller_security_policy_802_1X"
	short_description: "Configure 802.1x MAC Authentication Bypass (MAB) policies in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify switch_controller_security_policy feature and 802_1X category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
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
		switch_controller_security_policy_802_1X: {
			description: [
				"Configure 802.1x MAC Authentication Bypass (MAB) policies.",
			]
			default: null
			type:    "dict"
			suboptions: {
				auth_fail_vlan: {
					description: [
						"Enable to allow limited access to clients that cannot authenticate.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				auth_fail_vlan_id: {
					description: [
						"VLAN ID on which authentication failed. Source system.interface.name.",
					]
					type: "str"
				}
				auth_fail_vlanid: {
					description: [
						"VLAN ID on which authentication failed.",
					]
					type: "int"
				}
				eap_passthru: {
					description: [
						"Enable/disable EAP pass-through mode, allowing protocols (such as LLDP) to pass through ports for more flexible authentication.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				guest_auth_delay: {
					description: [
						"Guest authentication delay (1 - 900  sec).",
					]
					type: "int"
				}
				guest_vlan: {
					description: [
						"Enable the guest VLAN feature to allow limited access to non-802.1X-compliant clients.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				guest_vlan_id: {
					description: [
						"Guest VLAN name. Source system.interface.name.",
					]
					type: "str"
				}
				guest_vlanid: {
					description: [
						"Guest VLAN ID.",
					]
					type: "int"
				}
				mac_auth_bypass: {
					description: [
						"Enable/disable MAB for this policy.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				name: {
					description: [
						"Policy name.",
					]
					required: true
					type:     "str"
				}
				open_auth: {
					description: [
						"Enable/disable open authentication for this policy.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				policy_type: {
					description: [
						"Policy type.",
					]
					type: "str"
					choices: [
						"802.1X",
					]
				}
				radius_timeout_overwrite: {
					description: [
						"Enable to override the global RADIUS session timeout.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				security_mode: {
					description: [
						"Port or MAC based 802.1X security mode.",
					]
					type: "str"
					choices: [
						"802.1X",
						"802.1X-mac-based",
					]
				}
				user_group: {
					description: [
						"Name of user-group to assign to this MAC Authentication Bypass (MAB) policy.",
					]
					type: "list"
					suboptions: name: {
						description: [
							"Group name. Source user.group.name.",
						]
						required: true
						type:     "str"
					}
				}
			}
		}
	}
}
