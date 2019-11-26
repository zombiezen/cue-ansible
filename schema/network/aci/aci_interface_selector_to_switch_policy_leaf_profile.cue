package ansible

module: aci_interface_selector_to_switch_policy_leaf_profile: {
	module:            "aci_interface_selector_to_switch_policy_leaf_profile"
	short_description: "Bind interface selector profiles to switch policy leaf profiles (infra:RsAccPortP)"
	description: [
		"Bind interface selector profiles to switch policy leaf profiles on Cisco ACI fabrics.",
	]
	version_added: "2.5"
	options: {
		leaf_profile: {
			description: [
				"Name of the Leaf Profile to which we add a Selector.",
			]
			type: "str"
			aliases: ["leaf_profile_name"]
		}
		interface_selector: {
			description: [
				"Name of Interface Profile Selector to be added and associated with the Leaf Profile.",
			]
			type: "str"
			aliases: ["name", "interface_selector_name", "interface_profile_name"]
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
	notes: [
		"This module requires an existing leaf profile, the module M(aci_switch_policy_leaf_profile) can be used for this.",
	]
	seealso: [{
		module: "aci_switch_policy_leaf_profile"
	}, {
		name:        "APIC Management Information Model reference"
		description: "More information about the internal APIC class B(infra:RsAccPortP)."
		link:        "https://developer.cisco.com/docs/apic-mim-ref/"
	}]
	author: ["Bruno Calogero (@brunocalogero)"]
}
