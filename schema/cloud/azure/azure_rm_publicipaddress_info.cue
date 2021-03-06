package ansible

module: azure_rm_publicipaddress_info: {
	module: "azure_rm_publicipaddress_info"

	version_added: "2.9"

	short_description: "Get public IP facts"

	description: [
		"Get facts for a specific public IP or all public IPs within a resource group.",
	]

	options: {
		name: description: [
			"Only show results for a specific Public IP.",
		]
		resource_group: description: [
			"Limit results by resource group. Required when using name parameter.",
		]
		tags: description: [
			"Limit results by providing a list of tags. Format tags as 'key' or 'key:value'.",
		]
	}

	extends_documentation_fragment: [
		"azure",
	]

	author: [
		"Chris Houseknecht (@chouseknecht)",
		"Matt Davis (@nitzmahone)",
	]
}
