package ansible

module: os_image_info: {
	module:            "os_image_info"
	short_description: "Retrieve information about an image within OpenStack."
	version_added:     "2.0"
	author:            "Davide Agnello (@dagnello)"
	description: [
		"Retrieve information about a image image from OpenStack.",
		"This module was called C(os_image_facts) before Ansible 2.9, returning C(ansible_facts). Note that the M(os_image_info) module no longer returns C(ansible_facts)!",
	]

	requirements: [
		"python >= 2.7",
		"openstacksdk",
	]
	options: {
		image: {
			description: [
				"Name or ID of the image",
			]
			required: false
		}
		properties: {
			description: [
				"Dict of properties of the images used for query",
			]
			type:          "dict"
			required:      false
			version_added: "2.9"
		}
		availability_zone: {
			description: [
				"Ignored. Present for backwards compatibility",
			]
			required: false
		}
	}
	extends_documentation_fragment: "openstack"
}
