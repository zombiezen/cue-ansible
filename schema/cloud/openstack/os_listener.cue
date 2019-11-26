package ansible

module: os_listener: {
	module:                         "os_listener"
	short_description:              "Add/Delete a listener for a load balancer from OpenStack Cloud"
	extends_documentation_fragment: "openstack"
	version_added:                  "2.7"
	author:                         "Lingxian Kong (@lingxiankong)"
	description: [
		"Add or Remove a listener for a load balancer from the OpenStack load-balancer service.",
	]
	options: {
		name: {
			description: [
				"Name that has to be given to the listener",
			]
			required: true
		}
		state: {
			description: [
				"Should the resource be present or absent.",
			]
			choices: ["present", "absent"]
			default: "present"
		}
		loadbalancer: {
			description: [
				"The name or id of the load balancer that this listener belongs to.",
			]
			required: true
		}
		protocol: {
			description: [
				"The protocol for the listener.",
			]
			choices: ["HTTP", "HTTPS", "TCP", "TERMINATED_HTTPS"]
			default: "HTTP"
		}
		protocol_port: {
			description: [
				"The protocol port number for the listener.",
			]
			default: 80
		}
		wait: {
			description: [
				"If the module should wait for the load balancer to be ACTIVE.",
			]
			type:    "bool"
			default: "yes"
		}
		timeout: {
			description: [
				"The amount of time the module should wait for the load balancer to get into ACTIVE state.",
			]

			default: 180
		}
		availability_zone: description: [
			"Ignored. Present for backwards compatibility",
		]
	}
	requirements: ["openstacksdk"]
}
