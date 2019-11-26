package ansible

module: scaleway_security_group_rule: {
	module:            "scaleway_security_group_rule"
	short_description: "Scaleway Security Group Rule management module"
	version_added:     "2.8"
	author:            "Antoine Barbare (@abarbare)"
	description: [
		"This module manages Security Group Rule on Scaleway account U(https://developer.scaleway.com)",
	]

	extends_documentation_fragment: "scaleway"

	options: {
		state: {
			description: [
				"Indicate desired state of the Security Group Rule.",
			]
			default: "present"
			choices: [
				"present",
				"absent",
			]
		}

		region: {
			description: [
				"Scaleway region to use (for example C(par1)).",
			]
			required: true
			choices: [
				"ams1",
				"EMEA-NL-EVS",
				"par1",
				"EMEA-FR-PAR1",
			]
		}

		protocol: {
			description: [
				"Network protocol to use",
			]
			choices: [
				"TCP",
				"UDP",
				"ICMP",
			]
			required: true
		}

		port: {
			description: [
				"Port related to the rule, null value for all the ports",
			]
			required: true
			type:     "int"
		}

		ip_range: {
			description: [
				"IPV4 CIDR notation to apply to the rule",
			]
			default: "0.0.0.0/0"
		}

		direction: {
			description: [
				"Rule direction",
			]
			choices: [
				"inbound",
				"outbound",
			]
			required: true
		}

		action: {
			description: [
				"Rule action",
			]
			choices: [
				"accept",
				"drop",
			]
			required: true
		}

		security_group: {
			description: [
				"Security Group unique identifier",
			]
			required: true
		}
	}
}
