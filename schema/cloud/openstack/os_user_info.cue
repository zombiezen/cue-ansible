package ansible

module: os_user_info: {
	module:                         "os_user_info"
	short_description:              "Retrieve information about one or more OpenStack users"
	extends_documentation_fragment: "openstack"
	version_added:                  "2.1"
	author:                         "Ricardo Carrillo Cruz (@rcarrillocruz)"
	description: [
		"Retrieve information about a one or more OpenStack users",
		"This module was called C(os_user_facts) before Ansible 2.9, returning C(ansible_facts). Note that the M(os_user_info) module no longer returns C(ansible_facts)!",
	]

	requirements: [
		"python >= 2.7",
		"openstacksdk",
	]
	options: {
		name: {
			description: [
				"Name or ID of the user",
			]
			required: true
		}
		domain: description: [
			"Name or ID of the domain containing the user if the cloud supports domains",
		]
		filters: description: [
			"A dictionary of meta data to use for further filtering.  Elements of this dictionary may be additional dictionaries.",
		]

		availability_zone: description: ["Ignored. Present for backwards compatibility"]
	}
}
