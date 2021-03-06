package ansible

module: azure_rm_route: {
	module:            "azure_rm_route"
	version_added:     "2.7"
	short_description: "Manage Azure route resource"
	description: [
		"Create, update or delete a route.",
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
				"Name of the route.",
			]
			required: true
		}
		state: {
			description: [
				"Assert the state of the route. Use C(present) to create or update and C(absent) to delete.",
			]
			default: "present"
			choices: [
				"absent",
				"present",
			]
		}
		address_prefix: description: [
			"The destination CIDR to which the route applies.",
		]
		next_hop_type: {
			description: [
				"The type of Azure hop the packet should be sent to.",
			]
			choices: [
				"virtual_network_gateway",
				"vnet_local",
				"internet",
				"virtual_appliance",
				"none",
			]
			default: "none"
		}
		next_hop_ip_address: description: [
			"The IP address packets should be forwarded to.",
			"Next hop values are only allowed in routes where the next hop type is VirtualAppliance.",
		]
		route_table_name: {
			description: [
				"The name of the route table.",
			]
			required: true
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
