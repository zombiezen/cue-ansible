package ansible

module: azure_rm_autoscale_info: {
	module:            "azure_rm_autoscale_info"
	version_added:     "2.9"
	short_description: "Get Azure Auto Scale Setting facts"
	description: [
		"Get facts of Auto Scale Setting.",
	]

	options: {
		resource_group: {
			description: [
				"The name of the resource group.",
			]
			required: true
		}
		name: description: [
			"The name of the Auto Scale Setting.",
		]
		tags: description: [
			"Limit results by providing a list of tags. Format tags as 'key' or 'key:value'.",
		]
	}

	extends_documentation_fragment: [
		"azure",
	]

	author: [
		"Yuwei Zhou (@yuwzho)",
	]
}
