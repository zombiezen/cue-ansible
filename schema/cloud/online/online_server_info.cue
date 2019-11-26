package ansible

module: online_server_info: {
	module:            "online_server_info"
	short_description: "Gather information about Online servers."
	description: [
		"Gather information about the servers.",
		"U(https://www.online.net/en/dedicated-server)",
	]
	version_added: "2.9"
	author: [
		"Remy Leone (@sieben)",
	]
	extends_documentation_fragment: "online"
}
