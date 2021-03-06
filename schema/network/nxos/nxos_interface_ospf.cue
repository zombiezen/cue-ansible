package ansible

module: nxos_interface_ospf: {
	module:                         "nxos_interface_ospf"
	extends_documentation_fragment: "nxos"
	version_added:                  "2.2"
	short_description:              "Manages configuration of an OSPF interface instance."
	description: [
		"Manages configuration of an OSPF interface instance.",
	]
	author: "Gabriele Gerbino (@GGabriele)"
	notes: [
		"Tested against NXOSv 7.3.(0)D1(1) on VIRL",
		"Default, where supported, restores params default value.",
		"To remove an existing authentication configuration you should use C(message_digest_key_id=default) plus all other options matching their existing values.",
		"Loopback interfaces only support ospf network type 'point-to-point'.",
		"C(state=absent) removes the whole OSPF interface configuration.",
	]
	options: {
		interface: {
			description: [
				"Name of this cisco_interface resource. Valid value is a string.",
			]
			required: true
		}
		ospf: {
			description: [
				"Name of the ospf instance.",
			]
			required: true
		}
		area: {
			description: [
				"Ospf area associated with this cisco_interface_ospf instance. Valid values are a string, formatted as an IP address (i.e. \"0.0.0.0\") or as an integer.",
			]

			required: true
		}
		bfd: {
			description: [
				"Enables bfd at interface level. This overrides the bfd variable set at the ospf router level.",
				"Valid values are 'enable', 'disable' or 'default'.",
				"Dependency: 'feature bfd'",
			]
			version_added: "2.9"
			type:          "str"
			choices: ["enable", "disable", "default"]
		}
		cost: description: [
			"The cost associated with this cisco_interface_ospf instance.",
		]
		hello_interval: description: [
			"Time between sending successive hello packets. Valid values are an integer or the keyword 'default'.",
		]

		dead_interval: description: [
			"Time interval an ospf neighbor waits for a hello packet before tearing down adjacencies. Valid values are an integer or the keyword 'default'.",
		]

		passive_interface: {
			description: [
				"Enable or disable passive-interface state on this interface. true - (enable) Prevent OSPF from establishing an adjacency or sending routing updates on this interface. false - (disable) Override global 'passive-interface default' for this interface.",
			]

			type: "bool"
		}
		network: {
			description: [
				"Specifies interface ospf network type. Valid values are 'point-to-point' or 'broadcast'.",
			]
			choices: ["point-to-point", "broadcast"]
			version_added: "2.8"
		}
		message_digest: {
			description: [
				"Enables or disables the usage of message digest authentication.",
			]
			type: "bool"
		}
		message_digest_key_id: description: [
			"Md5 authentication key-id associated with the ospf instance. If this is present, message_digest_encryption_type, message_digest_algorithm_type and message_digest_password are mandatory. Valid value is an integer and 'default'.",
		]

		message_digest_algorithm_type: {
			description: [
				"Algorithm used for authentication among neighboring routers within an area. Valid values are 'md5' and 'default'.",
			]

			choices: ["md5", "default"]
		}
		message_digest_encryption_type: {
			description: [
				"Specifies the scheme used for encrypting message_digest_password. Valid values are '3des' or 'cisco_type_7' encryption or 'default'.",
			]

			choices: ["cisco_type_7", "3des", "default"]
		}
		message_digest_password: description: [
			"Specifies the message_digest password. Valid value is a string.",
		]
		state: {
			description: [
				"Determines whether the config should be present or not on the device.",
			]

			default: "present"
			choices: ["present", "absent"]
		}
	}
}
