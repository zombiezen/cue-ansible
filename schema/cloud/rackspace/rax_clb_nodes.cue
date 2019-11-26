package ansible

module: rax_clb_nodes: {
	module:            "rax_clb_nodes"
	short_description: "add, modify and remove nodes from a Rackspace Cloud Load Balancer"
	description: [
		"Adds, modifies and removes nodes from a Rackspace Cloud Load Balancer",
	]
	version_added: "1.4"
	options: {
		address: {
			required: false
			description: [
				"IP address or domain name of the node",
			]
		}
		condition: {
			required: false
			choices: [
				"enabled",
				"disabled",
				"draining",
			]
			description: [
				"Condition for the node, which determines its role within the load balancer",
			]
		}

		load_balancer_id: {
			required: true
			description: [
				"Load balancer id",
			]
		}
		node_id: {
			required: false
			description: [
				"Node id",
			]
		}
		port: {
			required: false
			description: [
				"Port number of the load balanced service on the node",
			]
		}
		state: {
			required: false
			default:  "present"
			choices: [
				"present",
				"absent",
			]
			description: [
				"Indicate desired state of the node",
			]
		}
		type: {
			required: false
			choices: [
				"primary",
				"secondary",
			]
			description: [
				"Type of node",
			]
		}
		wait: {
			required: false
			default:  "no"
			type:     "bool"
			description: [
				"Wait for the load balancer to become active before returning",
			]
		}
		wait_timeout: {
			required: false
			default:  30
			description: [
				"How long to wait before giving up and returning an error",
			]
		}
		weight: {
			required: false
			description: [
				"Weight of node",
			]
		}
	}
	author: "Lukasz Kawczynski (@neuroid)"
	extends_documentation_fragment: [
		"rackspace",
		"rackspace.openstack",
	]
}
