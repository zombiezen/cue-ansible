package ansible

module: azure_rm_availabilityset: {
	module: "azure_rm_availabilityset"

	version_added: "2.4"

	short_description: "Manage Azure Availability Set"

	description: [
		"Create, update and delete Azure Availability Set.",
		"An availability set cannot be updated, you will have to recreate one instead.",
		"The only update operation will be for the tags.",
	]

	options: {
		resource_group: {
			description: [
				"Name of a resource group where the availability set exists or will be created.",
			]
			required: true
		}
		name: {
			description: [
				"Name of the availability set.",
			]
			required: true
		}
		state: {
			description: [
				"Assert the state of the availability set.",
				"Use C(present) to create or update a availability set and C(absent) to delete a availability set.",
			]
			default: "present"
			choices: [
				"absent",
				"present",
			]
		}
		location: description: [
			"Valid Azure location. Defaults to location of the resource group.",
		]
		platform_update_domain_count: {
			description: [
				"Update domains indicate groups of virtual machines and underlying physical hardware that can be rebooted at the same time.",
			]
			type:    "int"
			default: 5
		}
		platform_fault_domain_count: {
			description: [
				"Fault domains define the group of virtual machines that share a common power source and network switch.",
				"Should be between C(1) and C(3).",
			]
			type:    "int"
			default: 3
		}
		sku: {
			description: [
				"Define if the availability set supports managed disks.",
			]
			default: "Classic"
			choices: [
				"Classic",
				"Aligned",
			]
		}
	}
	extends_documentation_fragment: [
		"azure",
		"azure_tags",
	]

	author: ["Julien Stroheker (@julienstroheker)"]
}
