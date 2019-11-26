package ansible

module: azure_rm_iothubconsumergroup: {
	module:            "azure_rm_iothubconsumergroup"
	version_added:     "2.9"
	short_description: "Manage Azure IoT hub"
	description: [
		"Create, delete an Azure IoT hub.",
	]
	options: {
		resource_group: {
			description: [
				"Name of resource group.",
			]
			type:     "str"
			required: true
		}
		hub: {
			description: [
				"Name of the IoT hub.",
			]
			type:     "str"
			required: true
		}
		state: {
			description: [
				"State of the IoT hub. Use C(present) to create or update an IoT hub and C(absent) to delete an IoT hub.",
			]
			type:    "str"
			default: "present"
			choices: [
				"absent",
				"present",
			]
		}
		event_hub: {
			description: [
				"Event hub endpoint name.",
			]
			type:    "str"
			default: "events"
		}
		name: {
			description: [
				"Name of the consumer group.",
			]
			type: "str"
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
