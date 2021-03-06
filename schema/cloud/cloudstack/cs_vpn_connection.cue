package ansible

module: cs_vpn_connection: {
	module:            "cs_vpn_connection"
	short_description: "Manages site-to-site VPN connections on Apache CloudStack based clouds."
	description: [
		"Create and remove VPN connections.",
	]
	version_added: "2.5"
	author:        "René Moser (@resmo)"
	options: {
		vpc: {
			description: ["Name of the VPC the VPN connection is related to."]
			type:     "str"
			required: true
		}
		vpn_customer_gateway: {
			description: ["Name of the VPN customer gateway."]
			type:     "str"
			required: true
		}
		passive: {
			description: [
				"State of the VPN connection.",
				"Only considered when I(state=present).",
			]
			default: false
			type:    "bool"
		}
		force: {
			description: [
				"Activate the VPN gateway if not already activated on I(state=present).",
				"Also see M(cs_vpn_gateway).",
			]
			default: false
			type:    "bool"
		}
		state: {
			description: ["State of the VPN connection."]
			type:    "str"
			default: "present"
			choices: ["present", "absent"]
		}
		zone: {
			description: [
				"Name of the zone the VPC is related to.",
				"If not set, default zone is used.",
			]
			type: "str"
		}
		domain: {
			description: ["Domain the VPN connection is related to."]
			type: "str"
		}
		account: {
			description: ["Account the VPN connection is related to."]
			type: "str"
		}
		project: {
			description: ["Name of the project the VPN connection is related to."]
			type: "str"
		}
		poll_async: {
			description: ["Poll async jobs until job has finished."]
			default: true
			type:    "bool"
		}
	}
	extends_documentation_fragment: "cloudstack"
}
