package ansible

module: cnos_banner: {
	module:            "cnos_banner"
	version_added:     "2.8"
	author:            "Anil Kumar Muraleedharan (@amuraleedhar)"
	short_description: "Manage multiline banners on Lenovo CNOS devices"
	description: [
		"This will configure both login and motd banners on remote devices running Lenovo CNOS.  It allows playbooks to add or remote banner text from the active running configuration.",
	]

	notes: [
		"Tested against CNOS 10.8.1",
	]
	options: {
		banner: {
			description: [
				"Specifies which banner should be configured on the remote device. In Ansible 2.8 and earlier only I(login) and I(motd) were supported.",
			]

			required: true
			choices: ["login", "motd"]
		}
		text: description: [
			"The banner text that should be present in the remote device running configuration.  This argument accepts a multiline string, with no empty lines. Requires I(state=present).",
		]

		state: {
			description: [
				"Specifies whether or not the configuration is present in the current devices active running configuration.",
			]

			default: "present"
			choices: ["present", "absent"]
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
					"Specifies the SSH key to use to authenticate the connection to the remote device.   This value is the path to the key used to authenticate the SSH session. If the value is not specified in the task, the value of environment variable C(ANSIBLE_NET_SSH_KEYFILE)will be used instead.",
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
