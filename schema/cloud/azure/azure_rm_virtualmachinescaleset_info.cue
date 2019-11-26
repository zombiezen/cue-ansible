package ansible

module: azure_rm_virtualmachinescaleset_info: {
	module: "azure_rm_virtualmachinescaleset_info"

	version_added: "2.9"

	short_description: "Get Virtual Machine Scale Set facts"

	description: [
		"Get facts for a virtual machine scale set.",
		"Note that this module was called M(azure_rm_virtualmachine_scaleset_facts) before Ansible 2.8. The usage did not change.",
	]

	options: {
		name: description: [
			"Limit results to a specific virtual machine scale set.",
		]
		resource_group: description: [
			"The resource group to search for the desired virtual machine scale set.",
		]
		tags: description: [
			"List of tags to be matched.",
		]
		format: {
			description: [
				"Format of the data returned.",
				"If C(raw) is selected information will be returned in raw format from Azure Python SDK.",
				"If C(curated) is selected the structure will be identical to input parameters of M(azure_rm_virtualmachinescaleset) module.",
				"In Ansible 2.5 and lower facts are always returned in raw format.",
				"Please note that this option will be deprecated in 2.10 when curated format will become the only supported format.",
			]
			default: "raw"
			choices: [
				"curated",
				"raw",
			]
			version_added: "2.6"
		}
	}

	extends_documentation_fragment: [
		"azure",
	]

	author: ["Sertac Ozercan (@sozercan)"]
}
