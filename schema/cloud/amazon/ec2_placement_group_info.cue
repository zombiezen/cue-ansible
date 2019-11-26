package ansible

module: ec2_placement_group_info: {
	module:            "ec2_placement_group_info"
	short_description: "List EC2 Placement Group(s) details"
	description: [
		"List details of EC2 Placement Group(s).",
		"This module was called C(ec2_placement_group_facts) before Ansible 2.9. The usage did not change.",
	]
	version_added: "2.5"
	author:        "Brad Macpherson (@iiibrad)"
	options: names: {
		description: [
			"A list of names to filter on. If a listed group does not exist, there will be no corresponding entry in the result; no error will be raised.",
		]

		type:     "list"
		elements: "str"
		required: false
		default: []
	}
	extends_documentation_fragment: [
		"aws",
		"ec2",
	]
}
