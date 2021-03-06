package ansible

module: azure_rm_appserviceplan: {
	module:            "azure_rm_appserviceplan"
	version_added:     "2.7"
	short_description: "Manage App Service Plan"
	description: [
		"Create, update and delete instance of App Service Plan.",
	]

	options: {
		resource_group: {
			description: [
				"Name of the resource group to which the resource belongs.",
			]
			required: true
		}

		name: {
			description: [
				"Unique name of the app service plan to create or update.",
			]
			required: true
		}

		location: description: [
			"Resource location. If not set, location from the resource group will be used as default.",
		]

		sku: description: [
			"The pricing tiers, e.g., C(F1), C(D1), C(B1), C(B2), C(B3), C(S1), C(P1), C(P1V2) etc.",
			"Please see U(https://azure.microsoft.com/en-us/pricing/details/app-service/plans/) for more detail.",
			"For Linux app service plan, please see U(https://azure.microsoft.com/en-us/pricing/details/app-service/linux/) for more detail.",
		]
		is_linux: {
			description: [
				"Describe whether to host webapp on Linux worker.",
			]
			type:    "bool"
			default: false
		}

		number_of_workers: description: [
			"Describe number of workers to be allocated.",
		]

		state: {
			description: [
				"Assert the state of the app service plan.",
				"Use C(present) to create or update an app service plan and C(absent) to delete it.",
			]
			default: "present"
			choices: [
				"absent",
				"present",
			]
		}
	}

	extends_documentation_fragment: [
		"azure",
		"azure_tags",
	]

	author: [
		"Yunge Zhu (@yungezz)",
	]
}
