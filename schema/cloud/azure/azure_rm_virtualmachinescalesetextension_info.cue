package ansible

module: azure_rm_virtualmachinescalesetextension_info: {
	module:            "azure_rm_virtualmachinescalesetextension_info"
	version_added:     "2.9"
	short_description: "Get Azure Virtual Machine Scale Set Extension facts"
	description: [
		"Get facts of Azure Virtual Machine Scale Set Extension.",
	]

	options: {
		resource_group: {
			description: [
				"The name of the resource group.",
			]
			required: true
		}
		vmss_name: {
			description: [
				"The name of VMSS containing the extension.",
			]
			required: true
		}
		name: description: [
			"The name of the virtual machine extension.",
		]
	}

	extends_documentation_fragment: [
		"azure",
	]

	author: [
		"Zim Kalinowski (@zikalino)",
	]
}
