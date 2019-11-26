package ansible

module: vultr_user_info: {
	module:            "vultr_user_info"
	short_description: "Get information about the Vultr user available."
	description: [
		"Get infos about users available in Vultr.",
	]
	version_added: "2.9"
	author: [
		"Yanis Guenane (@Spredzy)",
		"René Moser (@resmo)",
	]
	extends_documentation_fragment: "vultr"
}
