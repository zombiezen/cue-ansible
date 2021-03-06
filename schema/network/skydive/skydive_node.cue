package ansible

module: skydive_node: {
	module:        "skydive_node"
	version_added: "2.8"
	author: [
		"Sumit Jaiswal (@sjaiswal)",
	]
	short_description: "Module which add nodes to Skydive topology"
	description: [
		"This module handles adding node to the Skydive topology.",
	]
	requirements: [
		"skydive-client",
	]
	extends_documentation_fragment: "skydive"
	options: {
		name: {
			description: [
				"To define name for the node.",
			]
			required: true
		}
		node_type: {
			description: [
				"To define type for the node.",
			]
			required: true
		}
		host: {
			description: [
				"To define host for the node.",
			]
			required: false
		}
		seed: {
			description: [
				"used to generate the UUID of the node",
			]
			default: ""
		}
		metadata: {
			description: [
				"To define metadata for the node.",
			]
			required: false
		}
		state: {
			description: [
				"State of the Skydive Node. If value is I(present) new node will be created else if it is I(absent) it will be deleted.",
			]

			default: "present"
			choices: [
				"present",
				"update",
				"absent",
			]
		}
	}
}
