package ansible

module: vyos_system: {
	module:            "vyos_system"
	version_added:     "2.3"
	author:            "Nathaniel Case (@Qalthos)"
	short_description: "Run `set system` commands on VyOS devices"
	description: [
		"Runs one or more commands on remote devices running VyOS. This module can also be introspected to validate key parameters before returning successfully.",
	]

	extends_documentation_fragment: "vyos"
	notes: [
		"Tested against VyOS 1.1.8 (helium).",
		"This module works with connection C(network_cli). See L(the VyOS OS Platform Options,../network/user_guide/platform_vyos.html).",
	]
	options: {
		host_name: description: [
			"Configure the device hostname parameter. This option takes an ASCII string value.",
		]
		domain_name: description: [
			"The new domain name to apply to the device.",
		]
		name_servers: {
			description: [
				"A list of name servers to use with the device. Mutually exclusive with I(domain_search)",
			]

			aliases: ["name_server"]
		}
		domain_search: description: [
			"A list of domain names to search. Mutually exclusive with I(name_server)",
		]

		state: {
			description: [
				"Whether to apply (C(present)) or remove (C(absent)) the settings.",
			]
			default: "present"
			choices: ["present", "absent"]
		}
	}
}
