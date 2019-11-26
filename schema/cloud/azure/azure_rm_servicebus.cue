package ansible

module: azure_rm_servicebus: {
	module:            "azure_rm_servicebus"
	version_added:     "2.8"
	short_description: "Manage Azure Service Bus"
	description: [
		"Create, update or delete an Azure Service Bus namespaces.",
	]
	options: {
		resource_group: {
			description: [
				"Name of resource group.",
			]
			required: true
		}
		name: {
			description: [
				"Name of the servicebus namespace.",
			]
			required: true
		}
		state: {
			description: [
				"Assert the state of the servicebus. Use C(present) to create or update and use C(absen) to delete.",
			]
			default: "present"
			choices: [
				"absent",
				"present",
			]
		}
		location: description: [
			"The servicebus's location.",
		]
		sku: {
			description: [
				"Namespace SKU.",
			]
			choices: [
				"standard",
				"basic",
				"premium",
			]
			default: "standard"
		}
	}

	extends_documentation_fragment: [
		"azure",
		"azure_tags",
	]

	author: [
		"Yuwei Zhou (@yuwzho)",
	]
}
