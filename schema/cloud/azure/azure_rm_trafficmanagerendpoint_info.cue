package ansible

module: azure_rm_trafficmanagerendpoint_info: {
	module: "azure_rm_trafficmanagerendpoint_info"

	version_added: "2.9"

	short_description: "Get Azure Traffic Manager endpoint facts"

	description: [
		"Get facts for a specific Traffic Manager endpoints or all endpoints  in a Traffic Manager profile.",
	]

	options: {
		name: description: [
			"Limit results to a specific Traffic Manager endpoint.",
		]
		resource_group: {
			description: [
				"The resource group to search for the desired Traffic Manager profile.",
			]
			required: true
		}
		profile_name: {
			description: [
				"Name of Traffic Manager Profile.",
			]
			required: true
		}
		type: {
			description: [
				"Type of endpoint.",
			]
			choices: [
				"azure_endpoints",
				"external_endpoints",
				"nested_endpoints",
			]
		}
	}

	extends_documentation_fragment: [
		"azure",
	]

	author: [
		"Hai Cao (@caohai)",
		"Yunge Zhu (@yungezz)",
	]
}
