package ansible

module: hcloud_server_network: {
	module: "hcloud_server_network"

	short_description: "Manage the relationship between Hetzner Cloud Networks and servers"

	version_added: "2.9"

	description: [
		"Create and delete the relationship Hetzner Cloud Networks and servers",
	]

	author: [
		"Lukas Kaemmerling (@lkaemmerling)",
	]

	options: {
		network: {
			description: [
				"The name of the Hetzner Cloud Networks.",
			]

			type:     "str"
			required: true
		}
		server: {
			description: [
				"The name of the Hetzner Cloud server.",
			]
			type:     "str"
			required: true
		}
		ip: {
			description: [
				"The IP the server should have.",
			]
			type: "str"
		}
		alias_ips: {
			description: [
				"Alias IPs the server has.",
			]
			type: "list"
		}
		state: {
			description: [
				"State of the server_network.",
			]
			default: "present"
			choices: ["absent", "present"]
			type: "str"
		}
	}

	requirements: [
		"hcloud-python >= 1.3.0",
	]

	extends_documentation_fragment: "hcloud"
}
