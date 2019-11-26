package ansible

module: rabbitmq_queue: {
	module:        "rabbitmq_queue"
	author:        "Manuel Sousa (@manuel-sousa)"
	version_added: "2.0"

	short_description: "Manage rabbitMQ queues"
	description: [
		"This module uses rabbitMQ Rest API to create/delete queues",
	]
	requirements: ["requests >= 1.0.0"]
	options: {
		name: {
			description: [
				"Name of the queue",
			]
			required: true
		}
		state: {
			description: [
				"Whether the queue should be present or absent",
			]
			choices: ["present", "absent"]
			default: "present"
		}
		durable: {
			description: [
				"whether queue is durable or not",
			]
			type:    "bool"
			default: "yes"
		}
		auto_delete: {
			description: [
				"if the queue should delete itself after all queues/queues unbound from it",
			]
			type:    "bool"
			default: "no"
		}
		message_ttl: {
			description: [
				"How long a message can live in queue before it is discarded (milliseconds)",
			]
			default: "forever"
		}
		auto_expires: {
			description: [
				"How long a queue can be unused before it is automatically deleted (milliseconds)",
			]
			default: "forever"
		}
		max_length: {
			description: [
				"How many messages can the queue contain before it starts rejecting",
			]
			default: "no limit"
		}
		dead_letter_exchange: description: [
			"Optional name of an exchange to which messages will be republished if they",
			"are rejected or expire",
		]
		dead_letter_routing_key: description: [
			"Optional replacement routing key to use when a message is dead-lettered.",
			"Original routing key will be used if unset",
		]
		max_priority: {
			description: [
				"Maximum number of priority levels for the queue to support.",
				"If not set, the queue will not support message priorities.",
				"Larger numbers indicate higher priority.",
			]
			version_added: "2.4"
		}
		arguments: {
			description: [
				"extra arguments for queue. If defined this argument is a key/value dictionary",
			]
			default: {}
		}
	}
	extends_documentation_fragment: ["rabbitmq"]
}