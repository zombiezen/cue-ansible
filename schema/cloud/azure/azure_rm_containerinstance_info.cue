package ansible

module: azure_rm_containerinstance_info: {
	module:            "azure_rm_containerinstance_info"
	version_added:     "2.9"
	short_description: "Get Azure Container Instance facts"
	description: [
		"Get facts of Container Instance.",
	]

	options: {
		resource_group: {
			description: [
				"The name of the resource group.",
			]
			required: true
		}
		name: description: [
			"The name of the container instance.",
		]
		tags: description: [
			"Limit results by providing a list of tags. Format tags as 'key' or 'key:value'.",
		]
	}

	extends_documentation_fragment: [
		"azure",
	]

	author: [
		"Zim Kalinowski (@zikalino)",
	]
}
