package ansible

module: ovirt_group_info: {
	module:            "ovirt_group_info"
	short_description: "Retrieve information about one or more oVirt/RHV groups"
	author:            "Ondra Machacek (@machacekondra)"
	version_added:     "2.3"
	description: [
		"Retrieve information about one or more oVirt/RHV groups.",
		"This module was called C(ovirt_group_facts) before Ansible 2.9, returning C(ansible_facts). Note that the M(ovirt_group_info) module no longer returns C(ansible_facts)!",
	]

	notes: [
		"This module returns a variable C(ovirt_groups), which contains a list of groups. You need to register the result with the I(register) keyword to use it.",
	]

	options: pattern: description: [
		"Search term which is accepted by oVirt/RHV search backend.",
		"For example to search group X use following pattern: name=X",
	]
	extends_documentation_fragment: "ovirt_info"
}
