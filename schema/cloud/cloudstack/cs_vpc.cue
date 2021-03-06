package ansible

module: cs_vpc: {
	module:            "cs_vpc"
	short_description: "Manages VPCs on Apache CloudStack based clouds."
	description: [
		"Create, update and delete VPCs.",
	]
	version_added: "2.3"
	author:        "René Moser (@resmo)"
	options: {
		name: {
			description: ["Name of the VPC."]
			type:     "str"
			required: true
		}
		display_text: {
			description: [
				"Display text of the VPC.",
				"If not set, I(name) will be used for creating.",
			]
			type: "str"
		}
		cidr: {
			description: [
				"CIDR of the VPC, e.g. 10.1.0.0/16",
				"All VPC guest networks' CIDRs must be within this CIDR.",
				"Required on I(state=present).",
			]
			type: "str"
		}
		network_domain: {
			description: [
				"Network domain for the VPC.",
				"All networks inside the VPC will belong to this domain.",
				"Only considered while creating the VPC, can not be changed.",
			]
			type: "str"
		}
		vpc_offering: {
			description: [
				"Name of the VPC offering.",
				"If not set, default VPC offering is used.",
			]
			type: "str"
		}
		clean_up: {
			description: ["Whether to redeploy a VPC router or not when I(state=restarted)"]
			version_added: "2.5"
			type:          "bool"
		}
		state: {
			description: [
				"State of the VPC.",
				"The state C(present) creates a started VPC.",
				"The state C(stopped) is only considered while creating the VPC, added in version 2.6.",
			]
			type:    "str"
			default: "present"
			choices: [
				"present",
				"absent",
				"stopped",
				"restarted",
			]
		}
		domain: {
			description: ["Domain the VPC is related to."]
			type: "str"
		}
		account: {
			description: ["Account the VPC is related to."]
			type: "str"
		}
		project: {
			description: ["Name of the project the VPC is related to."]
			type: "str"
		}
		zone: {
			description: [
				"Name of the zone.",
				"If not set, default zone is used.",
			]
			type: "str"
		}
		tags: {
			description: [
				"List of tags. Tags are a list of dictionaries having keys I(key) and I(value).",
				"For deleting all tags, set an empty list e.g. I(tags: []).",
			]
			type: "list"
			aliases: ["tag"]
		}
		poll_async: {
			description: ["Poll async jobs until job has finished."]
			default: true
			type:    "bool"
		}
	}
	extends_documentation_fragment: "cloudstack"
}
