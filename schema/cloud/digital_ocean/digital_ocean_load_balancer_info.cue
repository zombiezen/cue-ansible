package ansible

module: digital_ocean_load_balancer_info: {
	module:            "digital_ocean_load_balancer_info"
	short_description: "Gather information about DigitalOcean load balancers"
	description: [
		"This module can be used to gather information about DigitalOcean provided load balancers.",
		"This module was called C(digital_ocean_load_balancer_facts) before Ansible 2.9. The usage did not change.",
	]
	author:        "Abhijeet Kasurde (@Akasurde)"
	version_added: "2.6"
	options: load_balancer_id: {
		description: [
			"Load balancer ID that can be used to identify and reference a load_balancer.",
		]
		required: false
	}
	requirements: [
		"python >= 2.6",
	]
	extends_documentation_fragment: "digital_ocean.documentation"
}
