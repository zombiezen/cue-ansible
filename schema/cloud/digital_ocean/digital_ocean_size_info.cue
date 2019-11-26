package ansible

module: digital_ocean_size_info: {
	module:            "digital_ocean_size_info"
	short_description: "Gather information about DigitalOcean Droplet sizes"
	description: [
		"This module can be used to gather information about droplet sizes.",
		"This module was called C(digital_ocean_size_facts) before Ansible 2.9. The usage did not change.",
	]
	author:        "Abhijeet Kasurde (@Akasurde)"
	version_added: "2.6"
	requirements: [
		"python >= 2.6",
	]
	extends_documentation_fragment: "digital_ocean.documentation"
}
