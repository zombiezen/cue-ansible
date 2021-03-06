package ansible

module: bigip_partition: {
	module:            "bigip_partition"
	short_description: "Manage BIG-IP partitions"
	description: [
		"Manage BIG-IP partitions.",
	]
	version_added: 2.5
	options: {
		name: {
			description: [
				"Name of the partition",
			]
			type:     "str"
			required: true
		}
		description: {
			description: [
				"The description to attach to the Partition.",
			]
			type: "str"
		}
		route_domain: {
			description: [
				"The default Route Domain to assign to the Partition. If no route domain is specified, then the default route domain for the system (typically zero) will be used only when creating a new partition.",
			]

			type: "int"
		}
		state: {
			description: [
				"Whether the partition should exist or not.",
			]
			type: "str"
			choices: [
				"present",
				"absent",
			]
			default: "present"
		}
	}
	notes: [
		"Requires BIG-IP software version >= 12",
	]
	extends_documentation_fragment: "f5"
	author: [
		"Tim Rupp (@caphrim007)",
		"Wojciech Wypior (@wojtek0806)",
	]
}
