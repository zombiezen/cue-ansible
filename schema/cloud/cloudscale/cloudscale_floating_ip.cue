package ansible

module: cloudscale_floating_ip: {
	module:            "cloudscale_floating_ip"
	short_description: "Manages floating IPs on the cloudscale.ch IaaS service"
	description: [
		"Create, assign and delete floating IPs on the cloudscale.ch IaaS service.",
	]
	notes: [
		"To create a new floating IP at least the C(ip_version) and C(server) options are required.",
		"Once a floating_ip is created all parameters except C(server) are read-only.",
		"It's not possible to request a floating IP without associating it with a server at the same time.",
		"This module requires the ipaddress python library. This library is included in Python since version 3.3. It is available as a module on PyPI for earlier versions.",
	]

	version_added: "2.5"
	author:        "Gaudenz Steinlin (@gaudenz)"
	options: {
		state: {
			description: [
				"State of the floating IP.",
			]
			default: "present"
			choices: ["present", "absent"]
			type: "str"
		}
		ip: {
			description: [
				"Floating IP address to change.",
				"Required to assign the IP to a different server or if I(state) is absent.",
			]
			aliases: ["network"]
			type: "str"
		}
		ip_version: {
			description: [
				"IP protocol version of the floating IP.",
			]
			choices: [4, 6]
			type: "int"
		}
		server: {
			description: [
				"UUID of the server assigned to this floating IP.",
				"Required unless I(state) is absent.",
			]
			type: "str"
		}
		prefix_length: {
			description: [
				"Only valid if I(ip_version) is 6.",
				"Prefix length for the IPv6 network. Currently only a prefix of /56 can be requested. If no I(prefix_length) is present, a single address is created.",
			]

			choices: [56]
			type: "int"
		}
		reverse_ptr: {
			description: [
				"Reverse PTR entry for this address.",
				"You cannot set a reverse PTR entry for IPv6 floating networks. Reverse PTR entries are only allowed for single addresses.",
			]
			type: "str"
		}
	}
	extends_documentation_fragment: "cloudscale"
}
