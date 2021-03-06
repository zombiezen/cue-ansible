package ansible

module: vultr_block_storage_info: {
	module:            "vultr_block_storage_info"
	short_description: "Get information about the Vultr block storage volumes available."
	description: [
		"Get infos about block storage volumes available in Vultr.",
	]
	version_added: "2.9"
	author: [
		"Yanis Guenane (@Spredzy)",
		"René Moser (@resmo)",
	]
	extends_documentation_fragment: "vultr"
}
