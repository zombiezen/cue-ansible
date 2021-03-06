package ansible

module: docker_node: {
	module:            "docker_node"
	short_description: "Manage Docker Swarm node"
	version_added:     "2.8"
	description: [
		"Manages the Docker nodes via Swarm Manager.",
		"This module allows to change the node's role, its availability, and to modify, add or remove node labels.",
	]
	options: {
		hostname: {
			description: [
				"The hostname or ID of node as registered in Swarm.",
				"If more than one node is registered using the same hostname the ID must be used, otherwise module will fail.",
			]

			type:     "str"
			required: true
		}
		labels: {
			description: [
				"User-defined key/value metadata that will be assigned as node attribute.",
				"Label operations in this module apply to the docker swarm node specified by I(hostname). Use M(docker_swarm) module to add/modify/remove swarm cluster labels.",
				"The actual state of labels assigned to the node when module completes its work depends on I(labels_state) and I(labels_to_remove) parameters values. See description below.",
			]

			type: "dict"
		}
		labels_state: {
			description: [
				"It defines the operation on the labels assigned to node and labels specified in I(labels) option.",
				"Set to C(merge) to combine labels provided in I(labels) with those already assigned to the node. If no labels are assigned then it will add listed labels. For labels that are already assigned to the node, it will update their values. The labels not specified in I(labels) will remain unchanged. If I(labels) is empty then no changes will be made.",
				"Set to C(replace) to replace all assigned labels with provided ones. If I(labels) is empty then all labels assigned to the node will be removed.",
			]

			type:    "str"
			default: "merge"
			choices: [
				"merge",
				"replace",
			]
		}
		labels_to_remove: {
			description: [
				"List of labels that will be removed from the node configuration. The list has to contain only label names, not their values.",
				"If the label provided on the list is not assigned to the node, the entry is ignored.",
				"If the label is both on the I(labels_to_remove) and I(labels), then value provided in I(labels) remains assigned to the node.",
				"If I(labels_state) is C(replace) and I(labels) is not provided or empty then all labels assigned to node are removed and I(labels_to_remove) is ignored.",
			]

			type:     "list"
			elements: "str"
		}
		availability: {
			description: "Node availability to assign. If not provided then node availability remains unchanged."
			choices: [
				"active",
				"pause",
				"drain",
			]
			type: "str"
		}
		role: {
			description: "Node role to assign. If not provided then node role remains unchanged."
			choices: [
				"manager",
				"worker",
			]
			type: "str"
		}
	}
	extends_documentation_fragment: [
		"docker",
		"docker.docker_py_1_documentation",
	]
	requirements: [
		"L(Docker SDK for Python,https://docker-py.readthedocs.io/en/stable/) >= 2.4.0",
		"Docker API >= 1.25",
	]
	author: [
		"Piotr Wojciechowski (@WojciechowskiPiotr)",
		"Thierry Bouvet (@tbouvet)",
	]
}
