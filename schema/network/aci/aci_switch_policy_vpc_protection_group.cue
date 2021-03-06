package ansible

module: aci_switch_policy_vpc_protection_group: {
	module:            "aci_switch_policy_vpc_protection_group"
	short_description: "Manage switch policy explicit vPC protection groups (fabric:ExplicitGEp, fabric:NodePEp)."
	description: [
		"Manage switch policy explicit vPC protection groups on Cisco ACI fabrics.",
	]
	version_added: "2.5"
	options: {
		protection_group: {
			description: [
				"The name of the Explicit vPC Protection Group.",
			]
			type:     "str"
			required: true
			aliases: ["name", "protection_group_name"]
		}
		protection_group_id: {
			description: [
				"The Explicit vPC Protection Group ID.",
			]
			type:     "int"
			required: true
			aliases: ["id"]
		}
		vpc_domain_policy: {
			description: [
				"The vPC domain policy to be associated with the Explicit vPC Protection Group.",
			]
			type: "str"
			aliases: ["vpc_domain_policy_name"]
		}
		switch_1_id: {
			description: [
				"The ID of the first Leaf Switch for the Explicit vPC Protection Group.",
			]
			type:     "int"
			required: true
		}
		switch_2_id: {
			description: [
				"The ID of the Second Leaf Switch for the Explicit vPC Protection Group.",
			]
			type:     "int"
			required: true
		}
		state: {
			description: [
				"Use C(present) or C(absent) for adding or removing.",
				"Use C(query) for listing an object or multiple objects.",
			]
			type: "str"
			choices: ["absent", "present", "query"]
			default: "present"
		}
	}
	extends_documentation_fragment: "aci"
	seealso: [{
		module: "aci_switch_policy_leaf_profile"
	}, {
		name:        "APIC Management Information Model reference"
		description: "More information about the internal APIC classes B(fabric:ExplicitGEp) and B(fabric:NodePEp)."
		link:        "https://developer.cisco.com/docs/apic-mim-ref/"
	}]
	author: ["Bruno Calogero (@brunocalogero)"]
}
