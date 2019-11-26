package ansible

module: ovirt_tag: {
	module:            "ovirt_tag"
	short_description: "Module to manage tags in oVirt/RHV"
	version_added:     "2.3"
	author:            "Ondra Machacek (@machacekondra)"
	description: [
		"This module manage tags in oVirt/RHV. It can also manage assignments of those tags to entities.",
	]

	options: {
		id: {
			description: [
				"ID of the tag to manage.",
			]
			version_added: "2.8"
		}
		name: {
			description: [
				"Name of the tag to manage.",
			]
			required: true
		}
		state: {
			description: [
				"Should the tag be present/absent/attached/detached.",
				"C(Note): I(attached) and I(detached) states are supported since version 2.4.",
			]
			choices: ["present", "absent", "attached", "detached"]
			default: "present"
		}
		description: description: [
			"Description of the tag to manage.",
		]
		parent: description: [
			"Name of the parent tag.",
		]
		vms: description: [
			"List of the VMs names, which should have assigned this tag.",
		]
		hosts: description: [
			"List of the hosts names, which should have assigned this tag.",
		]
	}
	extends_documentation_fragment: "ovirt"
}
