package ansible

module: netbox_interface: {
	module:            "netbox_interface"
	short_description: "Creates or removes interfaces from Netbox"
	description: [
		"Creates or removes interfaces from Netbox",
	]
	notes: [
		"Tags should be defined as a YAML list",
		"This should be ran with connection C(local) and hosts C(localhost)",
	]
	author: [
		"Mikhail Yohman (@FragmentedPacket)",
	]
	requirements: [
		"pynetbox",
	]
	version_added: "2.8"
	options: {
		netbox_url: {
			description: [
				"URL of the Netbox instance resolvable by Ansible control host",
			]
			required: true
			type:     "str"
		}
		netbox_token: {
			description: [
				"The token created within Netbox to authorize API access",
			]
			required: true
			type:     "str"
		}
		data: {
			description: [
				"Defines the prefix configuration",
			]
			suboptions: {
				device: {
					description: [
						"Name of the device the interface will be associated with (case-sensitive)",
					]
					required: true
					type:     "str"
				}
				name: {
					description: [
						"Name of the interface to be created",
					]
					required: true
					type:     "str"
				}
				form_factor: {
					description: [
						"""
		Form factor of the interface:
		ex. 1000Base-T (1GE), Virtual, 10GBASE-T (10GE)
		This has to be specified exactly as what is found within UI

		""",
					]

					type: "str"
				}
				enabled: {
					description: [
						"Sets whether interface shows enabled or disabled",
					]
					type: "bool"
				}
				lag: {
					description: [
						"Parent LAG interface will be a member of",
					]
					type: "dict"
				}
				mtu: {
					description: [
						"The MTU of the interface",
					]
					type: "str"
				}
				mac_address: {
					description: [
						"The MAC address of the interface",
					]
					type: "str"
				}
				mgmt_only: {
					description: [
						"This interface is used only for out-of-band management",
					]
					type: "bool"
				}
				description: {
					description: [
						"The description of the prefix",
					]
					type: "str"
				}
				mode: {
					description: [
						"The mode of the interface",
					]
					choices: [
						"Access",
						"Tagged",
						"Tagged All",
					]
					type: "str"
				}
				untagged_vlan: {
					description: [
						"The untagged VLAN to be assigned to interface",
					]
					type: "dict"
				}
				tagged_vlans: {
					description: [
						"A list of tagged VLANS to be assigned to interface. Mode must be set to either C(Tagged) or C(Tagged All)",
					]
					type: "list"
				}
				tags: {
					description: [
						"Any tags that the prefix may need to be associated with",
					]
					type: "list"
				}
			}
			required: true
		}
		state: {
			description: [
				"Use C(present) or C(absent) for adding or removing.",
			]
			choices: ["absent", "present"]
			default: "present"
			type:    "str"
		}
		validate_certs: {
			description: [
				"""
		If C(no), SSL certificates will not be validated.
		This should only be used on personally controlled sites using self-signed certificates.

		""",
			]

			default: "yes"
			type:    "bool"
		}
	}
}
