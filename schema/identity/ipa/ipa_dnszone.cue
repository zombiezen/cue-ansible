package ansible

module: ipa_dnszone: {
	module:            "ipa_dnszone"
	author:            "Fran Fitzpatrick (@fxfitz)"
	short_description: "Manage FreeIPA DNS Zones"
	description: [
		"Add and delete an IPA DNS Zones using IPA API",
	]
	options: {
		zone_name: {
			description: [
				"The DNS zone name to which needs to be managed.",
			]
			required: true
		}
		state: {
			description: "State to ensure"
			required:    false
			default:     "present"
			choices: ["present", "absent"]
		}
		dynamicupdate: {
			description: "Apply dynamic update to zone"
			required:    false
			default:     "false"
			choices: ["false", "true"]
			version_added: "2.9"
		}
	}
	extends_documentation_fragment: "ipa.documentation"
	version_added:                  "2.5"
}
