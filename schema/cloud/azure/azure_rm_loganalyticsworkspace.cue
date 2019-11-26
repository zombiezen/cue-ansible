package ansible

module: azure_rm_loganalyticsworkspace: {
	module:            "azure_rm_loganalyticsworkspace"
	version_added:     "2.8"
	short_description: "Manage Azure Log Analytics workspaces"
	description: [
		"Create, delete Azure Log Analytics workspaces.",
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
				"Name of the workspace.",
			]
			required: true
		}
		state: {
			description: [
				"Assert the state of the image. Use C(present) to create or update a image and C(absent) to delete an image.",
			]
			default: "present"
			choices: [
				"absent",
				"present",
			]
		}
		location: description: [
			"Resource location.",
		]
		sku: {
			description: [
				"The SKU of the workspace.",
			]
			choices: [
				"free",
				"standard",
				"premium",
				"unlimited",
				"per_node",
				"per_gb2018",
				"standalone",
			]
			default: "per_gb2018"
		}
		retention_in_days: description: [
			"The workspace data retention in days.",
			"-1 means Unlimited retention for I(sku=unlimited).",
			"730 days is the maximum allowed for all other SKUs.",
		]
		intelligence_packs: {
			description: [
				"Manage intelligence packs possible for this workspace.",
				"Enable one pack by setting it to C(true). For example \"Backup:true\".",
				"Disable one pack by setting it to C(false). For example \"Backup:false\".",
				"Other intelligence packs not list in this property will not be changed.",
			]
			type: "dict"
		}
	}
	extends_documentation_fragment: [
		"azure",
		"azure_tags",
	]

	author: ["Yuwei Zhou (@yuwzho)"]
}
