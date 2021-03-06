package ansible

module: oneandone_load_balancer: {
	module:            "oneandone_load_balancer"
	short_description: "Configure 1&1 load balancer."
	description: [
		"Create, remove, update load balancers. This module has a dependency on 1and1 >= 1.0",
	]

	version_added: "2.5"
	options: {
		state: {
			description: [
				"Define a load balancer state to create, remove, or update.",
			]
			required: false
			default:  "present"
			choices: ["present", "absent", "update"]
		}
		auth_token: {
			description: [
				"Authenticating API token provided by 1&1.",
			]
			required: true
		}
		load_balancer: {
			description: [
				"The identifier (id or name) of the load balancer used with update state.",
			]
			required: true
		}
		api_url: {
			description: [
				"Custom API URL. Overrides the ONEANDONE_API_URL environement variable.",
			]

			required: false
		}
		name: {
			description: [
				"Load balancer name used with present state. Used as identifier (id or name) when used with absent state. maxLength=128",
			]

			required: true
		}
		health_check_test: {
			description: [
				"Type of the health check. At the moment, HTTP is not allowed.",
			]
			choices: ["NONE", "TCP", "HTTP", "ICMP"]
			required: true
		}
		health_check_interval: {
			description: [
				"Health check period in seconds. minimum=5, maximum=300, multipleOf=1",
			]
			required: true
		}
		health_check_path: {
			description: [
				"Url to call for checking. Required for HTTP health check. maxLength=1000",
			]
			required: false
		}
		health_check_parse: {
			description: [
				"Regular expression to check. Required for HTTP health check. maxLength=64",
			]
			required: false
		}
		persistence: {
			description: [
				"Persistence.",
			]
			required: true
			type:     "bool"
		}
		persistence_time: {
			description: [
				"Persistence time in seconds. Required if persistence is enabled. minimum=30, maximum=1200, multipleOf=1",
			]
			required: true
		}
		method: {
			description: [
				"Balancing procedure.",
			]
			choices: ["ROUND_ROBIN", "LEAST_CONNECTIONS"]
			required: true
		}
		datacenter: {
			description: [
				"ID or country code of the datacenter where the load balancer will be created.",
			]
			default: "US"
			choices: ["US", "ES", "DE", "GB"]
			required: false
		}
		rules: {
			description: [
				"A list of rule objects that will be set for the load balancer. Each rule must contain protocol, port_balancer, and port_server parameters, in addition to source parameter, which is optional.",
			]

			required: true
		}
		description: {
			description: [
				"Description of the load balancer. maxLength=256",
			]
			required: false
		}
		add_server_ips: {
			description: [
				"A list of server identifiers (id or name) to be assigned to a load balancer. Used in combination with update state.",
			]

			required: false
		}
		remove_server_ips: {
			description: [
				"A list of server IP ids to be unassigned from a load balancer. Used in combination with update state.",
			]
			required: false
		}
		add_rules: {
			description: [
				"A list of rules that will be added to an existing load balancer. It is syntax is the same as the one used for rules parameter. Used in combination with update state.",
			]

			required: false
		}
		remove_rules: {
			description: [
				"A list of rule ids that will be removed from an existing load balancer. Used in combination with update state.",
			]
			required: false
		}
		wait: {
			description: [
				"wait for the instance to be in state 'running' before returning",
			]
			required: false
			default:  "yes"
			type:     "bool"
		}
		wait_timeout: {
			description: [
				"how long before wait gives up, in seconds",
			]
			default: 600
		}
		wait_interval: {
			description: [
				"Defines the number of seconds to wait when using the _wait_for methods",
			]
			default: 5
		}
	}

	requirements: [
		"1and1",
		"python >= 2.6",
	]

	author: [
		"Amel Ajdinovic (@aajdinov)",
		"Ethan Devenport (@edevenport)",
	]
}
