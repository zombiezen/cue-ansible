package ansible

module: os_nova_host_aggregate: {
	module:                         "os_nova_host_aggregate"
	short_description:              "Manage OpenStack host aggregates"
	extends_documentation_fragment: "openstack"
	author:                         "Jakub Jursa (@kuboj)"
	version_added:                  "2.3"
	description: [
		"Create, update, or delete OpenStack host aggregates. If a aggregate with the supplied name already exists, it will be updated with the new name, new availability zone, new metadata and new list of hosts.",
	]

	options: {
		name: {
			description: "Name of the aggregate."
			required:    true
		}
		metadata: description: "Metadata dict."
		availability_zone: description: "Availability zone to create aggregate into."
		hosts: description: "List of hosts to set for an aggregate."
		state: {
			description: "Should the resource be present or absent."
			choices: ["present", "absent"]
			default: "present"
		}
	}
	requirements: [
		"python >= 2.7",
		"openstacksdk",
	]
}
