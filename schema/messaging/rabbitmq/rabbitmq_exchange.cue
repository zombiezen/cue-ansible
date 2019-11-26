package ansible

module: rabbitmq_exchange: {
	module:        "rabbitmq_exchange"
	author:        "Manuel Sousa (@manuel-sousa)"
	version_added: "2.0"

	short_description: "Manage rabbitMQ exchanges"
	description: [
		"This module uses rabbitMQ Rest API to create/delete exchanges",
	]
	requirements: ["requests >= 1.0.0"]
	options: {
		name: {
			description: [
				"Name of the exchange to create",
			]
			required: true
		}
		state: {
			description: [
				"Whether the exchange should be present or absent",
			]
			choices: ["present", "absent"]
			required: false
			default:  "present"
		}
		durable: {
			description: [
				"whether exchange is durable or not",
			]
			required: false
			type:     "bool"
			default:  true
		}
		exchange_type: {
			description: [
				"type for the exchange",
			]
			required: false
			choices: ["fanout", "direct", "headers", "topic"]
			aliases: ["type"]
			default: "direct"
		}
		auto_delete: {
			description: [
				"if the exchange should delete itself after all queues/exchanges unbound from it",
			]
			required: false
			type:     "bool"
			default:  false
		}
		internal: {
			description: [
				"exchange is available only for other exchanges",
			]
			required: false
			type:     "bool"
			default:  false
		}
		arguments: {
			description: [
				"extra arguments for exchange. If defined this argument is a key/value dictionary",
			]
			required: false
			default: {}
		}
	}
	extends_documentation_fragment: ["rabbitmq"]
}
