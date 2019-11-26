package ansible

module: rabbitmq_global_parameter: {
	module:            "rabbitmq_global_parameter"
	short_description: "Manage RabbitMQ global parameters"
	description: [
		"Manage dynamic, cluster-wide global parameters for RabbitMQ",
	]
	version_added: "2.8"
	author:        "Juergen Kirschbaum (@jgkirschbaum)"
	options: {
		name: {
			description: [
				"Name of the global parameter being set",
			]
			required: true
			default:  null
		}
		value: {
			description: [
				"Value of the global parameter, as a JSON term",
			]
			required: false
			default:  null
		}
		node: {
			description: [
				"erlang node name of the rabbit we wish to configure",
			]
			required: false
			default:  "rabbit"
		}
		state: {
			description: [
				"Specify if user is to be added or removed",
			]
			required: false
			default:  "present"
			choices: ["present", "absent"]
		}
	}
}
