package ansible

module: onyx_mlag_ipl: {
	module:            "onyx_mlag_ipl"
	version_added:     "2.5"
	author:            "Samer Deeb (@samerd)"
	short_description: "Manage IPL (inter-peer link) on Mellanox ONYX network devices"
	description: [
		"This module provides declarative management of IPL (inter-peer link) management on Mellanox ONYX network devices.",
	]

	notes: [
		"Tested on ONYX 3.6.4000",
	]
	options: {
		name: {
			description: [
				"Name of the interface (port-channel) IPL should be configured on.",
			]
			required: true
		}
		vlan_interface: description: [
			"Name of the IPL vlan interface.",
		]
		state: {
			description: [
				"IPL state.",
			]
			default: "present"
			choices: ["present", "absent"]
		}
		peer_address: description: ["IPL peer IP address."]
	}
}
