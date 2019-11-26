package ansible

module: vmware_guest_customization_info: {
	module:            "vmware_guest_customization_info"
	short_description: "Gather info about VM customization specifications"
	description: [
		"This module can be used to gather information about customization specifications.",
		"All parameters and VMware object names are case sensitive.",
	]
	version_added: "2.9"
	author: [
		"Abhijeet Kasurde (@Akasurde)",
	]
	notes: [
		"Tested on vSphere 6.0 and 6.5",
	]
	requirements: [
		"python >= 2.6",
		"PyVmomi",
	]
	options: spec_name: {
		description: [
			"Name of customization specification to find.",
		]
		required: false
		type:     "str"
	}
	extends_documentation_fragment: "vmware.documentation"
}
