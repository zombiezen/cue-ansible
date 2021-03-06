package ansible

module: digital_ocean_firewall_info: {
	module:            "digital_ocean_firewall_info"
	short_description: "Gather information about DigitalOcean firewalls"
	description: [
		"This module can be used to gather information about DigitalOcean firewalls.",
		"This module was called C(digital_ocean_firewall_facts) before Ansible 2.9. The usage did not change.",
	]
	author:        "Anthony Bond (@BondAnthony)"
	version_added: "2.8"
	options: name: {
		description: [
			"Firewall rule name that can be used to identify and reference a specific firewall rule.",
		]
		required: false
	}
	requirements: [
		"python >= 2.6",
	]
	extends_documentation_fragment: "digital_ocean.documentation"
}
