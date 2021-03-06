package ansible

module: azure_rm_resourcegroup_info: {
	module: "azure_rm_resourcegroup_info"

	version_added: "2.1"

	short_description: "Get resource group facts"

	description: [
		"Get facts for a specific resource group or all resource groups.",
	]

	options: {
		name: description: [
			"Limit results to a specific resource group.",
		]
		tags: description: [
			"Limit results by providing a list of tags. Format tags as 'key' or 'key:value'.",
		]
		list_resources: {
			description: [
				"List all resources under the resource group.",
				"Note this will cost network overhead for each resource group. Suggest use this when I(name) set.",
			]
			version_added: "2.8"
		}
	}

	extends_documentation_fragment: [
		"azure",
	]

	author: [
		"Chris Houseknecht (@chouseknecht)",
		"Matt Davis (@nitzmahone)",
	]
}
