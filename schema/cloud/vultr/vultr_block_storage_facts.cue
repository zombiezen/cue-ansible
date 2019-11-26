package ansible

module: vultr_block_storage_facts: {
	module:            "vultr_block_storage_facts"
	short_description: "Gather facts about the Vultr block storage volumes available."
	description: [
		"Gather facts about block storage volumes available in Vultr.",
	]
	version_added: "2.7"
	author:        "Yanis Guenane (@Spredzy)"
	deprecated: {
		removed_in:  "2.12"
		why:         "Transformed into an info module."
		alternative: "Use M(vultr_block_storage_info) instead."
	}
	extends_documentation_fragment: "vultr"
}
