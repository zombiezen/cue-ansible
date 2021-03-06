package ansible

module: azure_rm_iothub: {
	module:            "azure_rm_iothub"
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
		name: {
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
		location: {
			description: [
				"Location of the IoT hub.",
			]
			type: "str"
		}
		sku: {
			description: [
				"Pricing tier for Azure IoT Hub.",
				"Note that only one free IoT hub instance is allowed in each subscription. Exception will be thrown if free instances exceed one.",
				"Default is C(s1) when creation.",
			]
			type: "str"
			choices: [
				"b1",
				"b2",
				"b3",
				"f1",
				"s1",
				"s2",
				"s3",
			]
		}
		unit: {
			description: [
				"Units in your IoT Hub.",
				"Default is C(1).",
			]
			type: "int"
		}
		event_endpoint: {
			description: [
				"The Event Hub-compatible endpoint property.",
			]
			type: "dict"
			suboptions: {
				partition_count: {
					description: [
						"The number of partitions for receiving device-to-cloud messages in the Event Hub-compatible endpoint.",
						"See U(https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide-messaging#device-to-cloud-messages).",
						"Default is C(2).",
					]
					type: "int"
				}
				retention_time_in_days: {
					description: [
						"The retention time for device-to-cloud messages in days.",
						"See U(https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide-messaging#device-to-cloud-messages).",
						"Default is C(1).",
					]
					type: "int"
				}
			}
		}
		enable_file_upload_notifications: {
			description: [
				"File upload notifications are enabled if set to C(True).",
			]
			type: "bool"
		}
		ip_filters: {
			description: [
				"Configure rules for rejecting or accepting traffic from specific IPv4 addresses.",
			]
			type: "list"
			suboptions: {
				name: {
					description: [
						"Name of the filter.",
					]
					type:     "str"
					required: true
				}
				ip_mask: {
					description: [
						"A string that contains the IP address range in CIDR notation for the rule.",
					]
					type:     "str"
					required: true
				}
				action: {
					description: [
						"The desired action for requests captured by this rule.",
					]
					type:     "str"
					required: true
					choices: [
						"accept",
						"reject",
					]
				}
			}
		}
		routing_endpoints: {
			description: [
				"Custom endpoints.",
			]
			type: "list"
			suboptions: {
				name: {
					description: [
						"Name of the custom endpoint.",
					]
					type:     "str"
					required: true
				}
				resource_group: {
					description: [
						"Resource group of the endpoint.",
						"Default is the same as I(resource_group).",
					]
					type: "str"
				}
				subscription: {
					description: [
						"Subscription id of the endpoint.",
						"Default is the same as I(subscription).",
					]
					type: "str"
				}
				resource_type: {
					description: [
						"Resource type of the custom endpoint.",
					]
					type: "str"
					choices: [
						"eventhub",
						"queue",
						"storage",
						"topic",
					]
					required: true
				}
				connection_string: {
					description: [
						"Connection string of the custom endpoint.",
						"The connection string should have send privilege.",
					]
					type:     "str"
					required: true
				}
				container: {
					description: [
						"Container name of the custom endpoint when I(resource_type=storage).",
					]
					type: "str"
				}
				encoding: {
					description: [
						"Encoding of the message when I(resource_type=storage).",
					]
					type: "str"
				}
			}
		}
		routes: {
			description: [
				"Route device-to-cloud messages to service-facing endpoints.",
			]
			type: "list"
			suboptions: {
				name: {
					description: [
						"Name of the route.",
					]
					type:     "str"
					required: true
				}
				source: {
					description: [
						"The origin of the data stream to be acted upon.",
					]
					type: "str"
					choices: [
						"device_messages",
						"twin_change_events",
						"device_lifecycle_events",
						"device_job_lifecycle_events",
					]
					required: true
				}
				enabled: {
					description: [
						"Whether to enable the route.",
					]
					type:     "bool"
					required: true
				}
				endpoint_name: {
					description: [
						"The name of the endpoint in I(routing_endpoints) where IoT Hub sends messages that match the query.",
					]
					type:     "str"
					required: true
				}
				condition: {
					description: [
						"The query expression for the routing query that is run against the message application properties, system properties, message body, device twin tags, and device twin properties to determine if it is a match for the endpoint.",
						"For more information about constructing a query, see U(https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-devguide-routing-query-syntax)",
					]

					type: "str"
				}
			}
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
