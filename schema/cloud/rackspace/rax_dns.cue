package ansible

module: rax_dns: {
	module:            "rax_dns"
	short_description: "Manage domains on Rackspace Cloud DNS"
	description: [
		"Manage domains on Rackspace Cloud DNS",
	]
	version_added: 1.5
	options: {
		comment: description: [
			"Brief description of the domain. Maximum length of 160 characters",
		]
		email: description: [
			"Email address of the domain administrator",
		]
		name: description: [
			"Domain name to create",
		]
		state: {
			description: [
				"Indicate desired state of the resource",
			]
			choices: [
				"present",
				"absent",
			]
			default: "present"
		}
		ttl: {
			description: [
				"Time to live of domain in seconds",
			]
			default: 3600
		}
	}
	notes: [
		"It is recommended that plays utilizing this module be run with C(serial: 1) to avoid exceeding the API request limit imposed by the Rackspace CloudDNS API",
	]

	author: "Matt Martz (@sivel)"
	extends_documentation_fragment: [
		"rackspace",
		"rackspace.openstack",
	]
}
