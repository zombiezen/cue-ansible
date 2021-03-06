package ansible

module: ibm_sa_host_ports: {
	module:            "ibm_sa_host_ports"
	short_description: "Add host ports on IBM Spectrum Accelerate Family storage systems."
	version_added:     "2.8"

	description: [
		"This module adds ports to or removes them from the hosts on IBM Spectrum Accelerate Family storage systems.",
	]

	options: {
		host: {
			description: [
				"Host name.",
			]
			required: true
		}
		state: {
			description: [
				"Host ports state.",
			]
			required: true
			default:  "present"
			choices: ["present", "absent"]
		}
		iscsi_name: {
			description: [
				"iSCSI initiator name.",
			]
			required: false
		}
		fcaddress: {
			description: [
				"Fiber channel address.",
			]
			required: false
		}
		num_of_visible_targets: {
			description: [
				"Number of visible targets.",
			]
			required: false
		}
	}

	extends_documentation_fragment: [
		"ibm_storage",
	]

	author: ["Tzur Eliyahu (@tzure)"]
}
