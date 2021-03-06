package ansible

module: cnos_linkagg: {
	module:            "cnos_linkagg"
	version_added:     "2.8"
	author:            "Anil Kumar Muraleedharan (@auraleedhar)"
	short_description: "Manage link aggregation groups on Lenovo CNOS devices"
	description: [
		"This module provides declarative management of link aggregation groups on Lenovo CNOS network devices.",
	]

	notes: [
		"Tested against CNOS 10.8.1",
	]
	options: {
		group: description: [
			"Channel-group number for the port-channel Link aggregation group. Range 1-255.",
		]

		mode: {
			description: [
				"Mode of the link aggregation group.",
			]
			choices: ["active", "on", "passive"]
		}
		members: description: [
			"List of members of the link aggregation group.",
		]
		aggregate: description: "List of link aggregation definitions."
		state: {
			description: [
				"State of the link aggregation group.",
			]
			default: "present"
			choices: ["present", "absent"]
		}
		purge: {
			description: [
				"Purge links not defined in the I(aggregate) parameter.",
			]
			type:    "bool"
			default: false
		}
		provider: {
			description: [
				"B(Deprecated)",
				"Starting with Ansible 2.5 we recommend using C(connection: network_cli).",
				"For more information please see the L(CNOS Platform Options guide, ../network/user_guide/platform_cnos.html).",
				"HORIZONTALLINE",
				"A dict object containing connection details.",
			]
			version_added: "2.8"
			suboptions: {
				host: {
					description: [
						"Specifies the DNS host name or address for connecting to the remote device over the specified transport.  The value of host is used as the destination address for the transport.",
					]

					required: true
				}
				port: {
					description: [
						"Specifies the port to use when building the connection to the remote device.",
					]
					default: 22
				}
				username: description: [
					"Configures the username to use to authenticate the connection to the remote device.  This value is used to authenticate the SSH session. If the value is not specified in the task, the value of environment variable C(ANSIBLE_NET_USERNAME) will be used instead.",
				]

				password: description: [
					"Specifies the password to use to authenticate the connection to the remote device.   This value is used to authenticate the SSH session. If the value is not specified in the task, the value of environment variable C(ANSIBLE_NET_PASSWORD) will be used instead.",
				]

				timeout: {
					description: [
						"Specifies the timeout in seconds for communicating with the network device for either connecting or sending commands.  If the timeout is exceeded before the operation is completed, the module will error.",
					]

					default: 10
				}
				ssh_keyfile: description: [
					"Specifies the SSH key to use to authenticate the connection to the remote device.   This value is the path to the key used to authenticate the SSH session. If the value is not specified in the task, the value of environment variable C(ANSIBLE_NET_SSH_KEYFILE) will be used instead.",
				]

				authorize: {
					description: [
						"Instructs the module to enter privileged mode on the remote device before sending any commands.  If not specified, the device will attempt to execute all commands in non-privileged mode. If the value is not specified in the task, the value of environment variable C(ANSIBLE_NET_AUTHORIZE) will be used instead.",
					]

					type:    "bool"
					default: "no"
				}
				auth_pass: description: [
					"Specifies the password to use if required to enter privileged mode on the remote device.  If I(authorize) is false, then this argument does nothing. If the value is not specified in the task, the value of environment variable C(ANSIBLE_NET_AUTH_PASS) will be used instead.",
				]
			}
		}
	}
}
