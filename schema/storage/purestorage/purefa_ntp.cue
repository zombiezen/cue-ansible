package ansible

module: purefa_ntp: {
	module:            "purefa_ntp"
	version_added:     "2.8"
	short_description: "Configure Pure Storage FlashArray NTP settings"
	description: [
		"Set or erase NTP configuration for Pure Storage FlashArrays.",
	]
	author: [
		"Pure Storage Ansible Team (@sdodsley) <pure-ansible-team@purestorage.com>",
	]
	options: {
		state: {
			description: [
				"Create or delete NTP servers configuration",
			]
			type:    "str"
			default: "present"
			choices: ["absent", "present"]
		}
		ntp_servers: {
			type: "list"
			description: [
				"A list of up to 4 alternate NTP servers. These may include IPv4, IPv6 or FQDNs. Invalid IP addresses will cause the module to fail. No validation is performed for FQDNs.",
				"If more than 4 servers are provided, only the first 4 unique nameservers will be used.",
				"if no servers are given a default of I(0.pool.ntp.org) will be used.",
			]
		}
	}
	extends_documentation_fragment: ["purestorage.fa"]
}
