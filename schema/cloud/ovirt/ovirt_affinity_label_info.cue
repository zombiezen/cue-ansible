package ansible

module: ovirt_affinity_label_info: {
	module:            "ovirt_affinity_label_info"
	short_description: "Retrieve information about one or more oVirt/RHV affinity labels"
	author:            "Ondra Machacek (@machacekondra)"
	version_added:     "2.3"
	description: [
		"Retrieve information about one or more oVirt/RHV affinity labels.",
		"This module was called C(ovirt_affinity_label_facts) before Ansible 2.9, returning C(ansible_facts). Note that the M(ovirt_affinity_label_info) module no longer returns C(ansible_facts)!",
	]

	notes: [
		"This module returns a variable C(ovirt_affinity_labels), which contains a list of affinity labels. You need to register the result with the I(register) keyword to use it.",
	]

	options: {
		name: description: [
			"Name of the affinity labels which should be listed.",
		]
		vm: description: [
			"Name of the VM, which affinity labels should be listed.",
		]
		host: description: [
			"Name of the host, which affinity labels should be listed.",
		]
	}
	extends_documentation_fragment: "ovirt_info"
}
