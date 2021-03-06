package ansible

module: a10_server: {
	module:            "a10_server"
	version_added:     1.8
	short_description: "Manage A10 Networks AX/SoftAX/Thunder/vThunder devices' server object."
	description: [
		"Manage SLB (Server Load Balancer) server objects on A10 Networks devices via aXAPIv2.",
	]
	author: [
		"Eric Chou (@ericchou1)",
		"Mischa Peters (@mischapeters)",
	]
	notes: [
		"Requires A10 Networks aXAPI 2.1.",
	]
	extends_documentation_fragment: [
		"a10",
		"url",
	]
	options: {
		partition: {
			version_added: "2.3"
			description: [
				"set active-partition",
			]
		}
		server_name: {
			description: [
				"The SLB (Server Load Balancer) server name.",
			]
			required: true
			aliases: ["server"]
		}
		server_ip: {
			description: [
				"The SLB server IPv4 address.",
			]
			aliases: ["ip", "address"]
		}
		server_status: {
			description: [
				"The SLB virtual server status.",
			]
			default: "enabled"
			aliases: ["status"]
			choices: ["enabled", "disabled"]
		}
		server_ports: {
			description: [
				"A list of ports to create for the server. Each list item should be a dictionary which specifies the C(port:) and C(protocol:), but can also optionally specify the C(status:). See the examples below for details. This parameter is required when C(state) is C(present).",
			]

			aliases: ["port"]
		}
		state: {
			description: [
				"This is to specify the operation to create, update or remove SLB server.",
			]
			default: "present"
			choices: ["present", "absent"]
		}
		validate_certs: {
			description: [
				"If C(no), SSL certificates will not be validated. This should only be used on personally controlled devices using self-signed certificates.",
			]

			version_added: 2.3
			type:          "bool"
			default:       "yes"
		}
	}
}
