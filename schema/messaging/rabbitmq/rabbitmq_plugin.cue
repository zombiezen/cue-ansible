package ansible

module: rabbitmq_plugin: {
	module:            "rabbitmq_plugin"
	short_description: "Manage RabbitMQ plugins"
	description: [
		"This module can be used to enable or disable RabbitMQ plugins.",
	]
	version_added: "1.1"
	author: [
		"Chris Hoffman (@chrishoffman)",
	]
	options: {
		names: {
			description: [
				"Comma-separated list of plugin names. Also, accepts plugin name.",
			]
			required: true
			aliases: ["name"]
		}
		new_only: {
			description: [
				"Only enable missing plugins.",
				"Does not disable plugins that are not in the names list.",
			]
			type:    "bool"
			default: "no"
		}
		state: {
			description: [
				"Specify if plugins are to be enabled or disabled.",
			]
			default: "enabled"
			choices: ["enabled", "disabled"]
		}
		prefix: {
			description: [
				"Specify a custom install prefix to a Rabbit.",
			]
			version_added: "1.3"
		}
	}
}
