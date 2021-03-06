package ansible

module: ovirt_quota_info: {
	module:            "ovirt_quota_info"
	short_description: "Retrieve information about one or more oVirt/RHV quotas"
	version_added:     "2.3"
	author:            "Maor Lipchuk (@machacekondra)"
	description: [
		"Retrieve information about one or more oVirt/RHV quotas.",
		"This module was called C(ovirt_quota_facts) before Ansible 2.9, returning C(ansible_facts). Note that the M(ovirt_quota_info) module no longer returns C(ansible_facts)!",
	]

	notes: [
		"This module returns a variable C(ovirt_quotas), which contains a list of quotas. You need to register the result with the I(register) keyword to use it.",
	]

	options: {
		data_center: {
			description: [
				"Name of the datacenter where quota resides.",
			]
			required: true
		}
		name: description: [
			"Name of the quota, can be used as glob expression.",
		]
	}
	extends_documentation_fragment: "ovirt_info"
}
