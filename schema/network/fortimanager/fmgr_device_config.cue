package ansible

module: fmgr_device_config: {
	module:        "fmgr_device_config"
	version_added: "2.8"
	notes: [
		"Full Documentation at U(https://ftnt-ansible-docs.readthedocs.io/en/latest/).",
	]
	author: [
		"Luke Weighall (@lweighall)",
		"Andrew Welsh (@Ghilli3)",
		"Jim Huber (@p4r4n0y1ng)",
	]
	short_description: "Edit device configurations"
	description: [
		"Edit device configurations from FortiManager Device Manager using JSON RPC API.",
	]

	options: {
		adom: {
			description: [
				"The ADOM the configuration should belong to.",
			]
			required: false
			default:  "root"
		}

		device_unique_name: {
			description: [
				"The unique device's name that you are editing. A.K.A. Friendly name of the device in FortiManager.",
			]
			required: true
		}

		device_hostname: {
			description: [
				"The device's new hostname.",
			]
			required: false
		}

		install_config: {
			description: [
				"Tells FMGR to attempt to install the config after making it.",
			]
			required: false
			default:  "disable"
		}

		interface: {
			description: [
				"The interface/port number you are editing.",
			]
			required: false
		}

		interface_ip: {
			description: [
				"The IP and subnet of the interface/port you are editing.",
			]
			required: false
		}

		interface_allow_access: {
			description: [
				"Specify what protocols are allowed on the interface, comma-separated list (see examples).",
			]
			required: false
		}
	}
}
