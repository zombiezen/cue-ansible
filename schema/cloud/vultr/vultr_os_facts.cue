package ansible

module: vultr_os_facts: {
	module:            "vultr_os_facts"
	short_description: "Gather facts about the Vultr OSes available."
	description: [
		"Gather facts about OSes available to boot servers.",
	]
	version_added: "2.7"
	author:        "Yanis Guenane (@Spredzy)"
	deprecated: {
		removed_in:  "2.12"
		why:         "Transformed into an info module."
		alternative: "Use M(vultr_os_info) instead."
	}
	extends_documentation_fragment: "vultr"
}
