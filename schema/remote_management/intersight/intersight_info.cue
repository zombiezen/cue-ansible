package ansible

module: intersight_info: {
	module:            "intersight_info"
	short_description: "Gather information about Intersight"
	description: [
		"Gathers information about servers in L(Cisco Intersight,https://intersight.com).",
		"This module was called C(intersight_facts) before Ansible 2.9. The usage did not change.",
	]
	extends_documentation_fragment: "intersight"
	options: server_names: {
		description: [
			"Server names to retrieve information from.",
			"An empty list will return all servers.",
		]
		type:     "list"
		required: true
	}
	author: [
		"David Soper (@dsoper2)",
		"CiscoUcs (@CiscoUcs)",
	]
	version_added: "2.8"
}
