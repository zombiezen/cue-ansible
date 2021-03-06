package ansible

module: win_dns_record: {
	module:            "win_dns_record"
	version_added:     "2.8"
	short_description: "Manage Windows Server DNS records"
	description: [
		"Manage DNS records within an existing Windows Server DNS zone.",
	]
	author: "John Nelson (@johnboy2)"
	requirements: [
		"This module requires Windows 8, Server 2012, or newer.",
	]
	options: {
		name: {
			description: [
				"The name of the record.",
			]
			required: true
			type:     "str"
		}
		state: {
			description: [
				"Whether the record should exist or not.",
			]
			choices: ["absent", "present"]
			default: "present"
			type:    "str"
		}
		ttl: {
			description: [
				"The \"time to live\" of the record, in seconds.",
				"Ignored when C(state=absent).",
				"Valid range is 1 - 31557600.",
				"Note that an Active Directory forest can specify a minimum TTL, and will dynamically \"round up\" other values to that minimum.",
			]

			default: 3600
			type:    "int"
		}
		type: {
			description: [
				"The type of DNS record to manage.",
			]
			choices: ["A", "AAAA", "CNAME", "PTR"]
			required: true
			type:     "str"
		}
		value: {
			description: [
				"The value(s) to specify. Required when C(state=present).",
				"When C(type=PTR) only the partial part of the IP should be given.",
			]
			aliases: ["values"]
			type: "list"
		}
		zone: {
			description: [
				"The name of the zone to manage (eg C(example.com)).",
				"The zone must already exist.",
			]
			required: true
			type:     "str"
		}
		computer_name: {
			description: [
				"Specifies a DNS server.",
				"You can specify an IP address or any value that resolves to an IP address, such as a fully qualified domain name (FQDN), host name, or NETBIOS name.",
			]

			type: "str"
		}
	}
}
