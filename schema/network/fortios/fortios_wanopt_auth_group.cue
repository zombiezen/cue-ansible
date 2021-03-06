package ansible

module: fortios_wanopt_auth_group: {
	module:            "fortios_wanopt_auth_group"
	short_description: "Configure WAN optimization authentication groups in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify wanopt feature and auth_group category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
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
		wanopt_auth_group: {
			description: [
				"Configure WAN optimization authentication groups.",
			]
			default: null
			type:    "dict"
			suboptions: {
				auth_method: {
					description: [
						"Select certificate or pre-shared key authentication for this authentication group.",
					]
					type: "str"
					choices: [
						"cert",
						"psk",
					]
				}
				cert: {
					description: [
						"Name of certificate to identify this peer. Source vpn.certificate.local.name.",
					]
					type: "str"
				}
				name: {
					description: [
						"Auth-group name.",
					]
					required: true
					type:     "str"
				}
				peer: {
					description: [
						"If peer-accept is set to one, select the name of one peer to add to this authentication group. The peer must have added with the wanopt peer command. Source wanopt.peer.peer-host-id.",
					]

					type: "str"
				}
				peer_accept: {
					description: [
						"Determine if this auth group accepts, any peer, a list of defined peers, or just one peer.",
					]
					type: "str"
					choices: [
						"any",
						"defined",
						"one",
					]
				}
				psk: {
					description: [
						"Pre-shared key used by the peers in this authentication group.",
					]
					type: "str"
				}
			}
		}
	}
}
