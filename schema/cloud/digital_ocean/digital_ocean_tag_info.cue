package ansible

module: digital_ocean_tag_info: {
	module:            "digital_ocean_tag_info"
	short_description: "Gather information about DigitalOcean tags"
	description: [
		"This module can be used to gather information about DigitalOcean provided tags.",
		"This module was called C(digital_ocean_tag_facts) before Ansible 2.9. The usage did not change.",
	]
	author:        "Abhijeet Kasurde (@Akasurde)"
	version_added: "2.6"
	options: tag_name: {
		description: [
			"Tag name that can be used to identify and reference a tag.",
		]
		required: false
	}
	requirements: [
		"python >= 2.6",
	]
	extends_documentation_fragment: "digital_ocean.documentation"
}
