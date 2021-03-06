package ansible

module: ios_system: {
	module:            "ios_system"
	version_added:     "2.3"
	author:            "Peter Sprygada (@privateip)"
	short_description: "Manage the system attributes on Cisco IOS devices"
	description: [
		"This module provides declarative management of node system attributes on Cisco IOS devices.  It provides an option to configure host system parameters or remove those parameters from the device active configuration.",
	]

	extends_documentation_fragment: "ios"
	notes: [
		"Tested against IOS 15.6",
	]
	options: {
		hostname: description: [
			"Configure the device hostname parameter. This option takes an ASCII string value.",
		]
		domain_name: description: [
			"Configure the IP domain name on the remote device to the provided value. Value should be in the dotted name form and will be appended to the C(hostname) to create a fully-qualified domain name.",
		]

		domain_search: description: [
			"Provides the list of domain suffixes to append to the hostname for the purpose of doing name resolution. This argument accepts a list of names and will be reconciled with the current active configuration on the running node.",
		]

		lookup_source: description: [
			"Provides one or more source interfaces to use for performing DNS lookups.  The interface provided in C(lookup_source) must be a valid interface configured on the device.",
		]

		lookup_enabled: {
			description: [
				"Administrative control for enabling or disabling DNS lookups.  When this argument is set to True, lookups are performed and when it is set to False, lookups are not performed.",
			]

			type: "bool"
		}
		name_servers: description: [
			"List of DNS name servers by IP address to use to perform name resolution lookups.  This argument accepts either a list of DNS servers See examples.",
		]

		state: {
			description: [
				"State of the configuration values in the device's current active configuration.  When set to I(present), the values should be configured in the device active configuration and when set to I(absent) the values should not be in the device active configuration",
			]

			default: "present"
			choices: ["present", "absent"]
		}
	}
}
