package ansible

module: vultr_firewall_group_facts: {
	module: "vultr_firewall_group_facts"
	deprecated: {
		removed_in:  "2.13"
		why:         "Deprecated in favour of C(_info) module."
		alternative: "Use M(vultr_firewall_group_info) instead."
	}
	short_description: "Gather facts about the Vultr firewall groups available."
	description: [
		"Gather facts about firewall groups available in Vultr.",
	]
	version_added:                  "2.7"
	author:                         "Yanis Guenane (@Spredzy)"
	extends_documentation_fragment: "vultr"
}
