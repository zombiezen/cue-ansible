package ansible

module: online_user_info: {
	module:            "online_user_info"
	short_description: "Gather information about Online user."
	description: [
		"Gather information about the user.",
	]
	version_added: "2.9"
	author: [
		"Remy Leone (@sieben)",
	]
	extends_documentation_fragment: "online"
}
