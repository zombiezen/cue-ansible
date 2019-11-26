package ansible

module: ucs_dns_server: {
	module: "ucs_dns_server"

	short_description: "Configure DNS servers on Cisco UCS Manager"

	extends_documentation_fragment: [
		"ucs",
	]

	description: [
		"Configure DNS servers on Cisco UCS Manager.",
		"Examples can be used with the L(UCS Platform Emulator,https://communities.cisco.com/ucspe).",
	]

	options: {
		state: {
			description: [
				"If C(absent), will remove a DNS server.",
				"If C(present), will add or update a DNS server.",
			]
			choices: ["absent", "present"]
			default: "present"
			type:    "str"
		}

		dns_server: {
			description: [
				"DNS server IP address.",
				"Enter a valid IPV4 Address.",
				"UCS Manager supports up to 4 DNS Servers",
			]
			aliases: ["name"]
			type: "str"
		}

		description: {
			description: [
				"A user-defined description of the DNS server.",
				"Enter up to 256 characters.",
				"You can use any characters or spaces except the following:",
				"` (accent mark),  (backslash), ^ (carat), \" (double quote), = (equal sign), > (greater than), < (less than), or ' (single quote).",
			]
			aliases: ["descr"]
			type: "str"
		}

		delegate_to: {
			description: [
				"Where the module will be run",
			]
			default: "localhost"
			type:    "str"
		}
	}

	requirements: [
		"ucsmsdk",
	]

	author: [
		"John McDonough (@movinalot)",
		"CiscoUcs (@CiscoUcs)",
	]

	version_added: "2.8"
}
