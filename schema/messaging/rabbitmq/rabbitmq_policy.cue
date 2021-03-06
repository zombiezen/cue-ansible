package ansible

module: rabbitmq_policy: {
	module:            "rabbitmq_policy"
	short_description: "Manage the state of policies in RabbitMQ"
	description: [
		"Manage the state of a policy in RabbitMQ.",
	]
	version_added: "1.5"
	author:        "John Dewey (@retr0h)"
	options: {
		name: {
			description: [
				"The name of the policy to manage.",
			]
			required: true
		}
		vhost: {
			description: [
				"The name of the vhost to apply to.",
			]
			default: "/"
		}
		apply_to: {
			description: [
				"What the policy applies to. Requires RabbitMQ 3.2.0 or later.",
			]
			default: "all"
			choices: ["all", "exchanges", "queues"]
			version_added: "2.1"
		}
		pattern: {
			description: [
				"A regex of queues to apply the policy to. Required when C(state=present). This option is no longer required as of Ansible 2.9.",
			]

			required: false
			default:  null
		}
		tags: {
			description: [
				"A dict or string describing the policy. Required when C(state=present). This option is no longer required as of Ansible 2.9.",
			]

			required: false
			default:  null
		}
		priority: {
			description: [
				"The priority of the policy.",
			]
			default: 0
		}
		node: {
			description: [
				"Erlang node name of the rabbit we wish to configure.",
			]
			default: "rabbit"
		}
		state: {
			description: [
				"The state of the policy.",
			]
			default: "present"
			choices: ["present", "absent"]
		}
	}
}
