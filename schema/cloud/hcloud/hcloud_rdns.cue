package ansible

module: hcloud_rdns: {
	module: "hcloud_rdns"

	short_description: "Create and manage reverse DNS entries on the Hetzner Cloud."

	version_added: "2.9"

	description: [
		"Create, update and delete reverse DNS entries on the Hetzner Cloud.",
	]

	author: [
		"Lukas Kaemmerling (@lkaemmerling)",
	]

	options: {
		server: {
			description: [
				"The name of the Hetzner Cloud server you want to add the reverse DNS entry to.",
			]
			type:     "str"
			required: true
		}
		ip_address: {
			description: [
				"The IP address that should point to I(dns_ptr).",
			]
			type:     "str"
			required: true
		}
		dns_ptr: {
			description: [
				"The DNS address the I(ip_address) should resolve to.",
				"Omit the param to reset the reverse DNS entry to the default value.",
			]
			type: "str"
		}
		state: {
			description: [
				"State of the reverse DNS entry.",
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
