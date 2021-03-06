package ansible

module: os_server_info: {
	module:            "os_server_info"
	short_description: "Retrieve information about one or more compute instances"
	author:            "Monty (@emonty)"
	version_added:     "2.0"
	description: [
		"Retrieve information about server instances from OpenStack.",
		"This module was called C(os_server_facts) before Ansible 2.9, returning C(ansible_facts). Note that the M(os_server_info) module no longer returns C(ansible_facts)!",
	]

	notes: [
		"The result contains a list of servers.",
	]
	requirements: [
		"python >= 2.7",
		"openstacksdk",
	]
	options: {
		server: description: [
			"restrict results to servers with names or UUID matching this glob expression (e.g., <web*>).",
		]

		detailed: {
			description: [
				"when true, return additional detail about servers at the expense of additional API calls.",
			]

			type:    "bool"
			default: "no"
		}
		filters: {
			description: [
				"restrict results to servers matching a dictionary of filters",
			]

			version_added: "2.8"
		}
		availability_zone: description: [
			"Ignored. Present for backwards compatibility",
		]
		all_projects: {
			description: [
				"Whether to list servers from all projects or just the current auth scoped project.",
			]

			type:          "bool"
			default:       "no"
			version_added: "2.8"
		}
	}
	extends_documentation_fragment: "openstack"
}
