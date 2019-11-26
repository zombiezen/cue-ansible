package ansible

module: bcf_switch: {
	module:            "bcf_switch"
	author:            "Ted (@tedelhourani)"
	short_description: "Create and remove a bcf switch."
	description: [
		"Create and remove a Big Cloud Fabric switch.",
	]
	version_added: "2.4"
	options: {
		name: {
			description: [
				"The name of the switch.",
			]
			required: true
		}
		fabric_role: {
			description: [
				"Fabric role of the switch.",
			]
			choices: ["spine", "leaf"]
			required: true
		}
		leaf_group: {
			description: [
				"The leaf group of the switch if the switch is a leaf.",
			]
			required: false
		}
		mac: {
			description: [
				"The MAC address of the switch.",
			]
			required: true
		}
		state: {
			description: [
				"Whether the switch should be present or absent.",
			]
			default: "present"
			choices: ["present", "absent"]
		}
		controller: {
			description: [
				"The controller IP address.",
			]
			required: true
		}
		validate_certs: {
			description: [
				"If C(false), SSL certificates will not be validated. This should only be used on personally controlled devices using self-signed certificates.",
			]

			required: false
			default:  true
			type:     "bool"
		}
		access_token: description: ["Big Cloud Fabric access token. If this isn't set then the environment variable C(BIGSWITCH_ACCESS_TOKEN) is used."]
	}
}
