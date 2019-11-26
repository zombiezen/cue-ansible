package ansible

module: nxos_ntp: {
	module:                         "nxos_ntp"
	extends_documentation_fragment: "nxos"
	version_added:                  "2.2"
	short_description:              "Manages core NTP configuration."
	description: [
		"Manages core NTP configuration.",
	]
	author: [
		"Jason Edelman (@jedelman8)",
	]
	options: {
		server: description: [
			"Network address of NTP server.",
		]
		peer: description: [
			"Network address of NTP peer.",
		]
		key_id: description: [
			"Authentication key identifier to use with given NTP server or peer or keyword 'default'.",
		]

		prefer: {
			description: [
				"Makes given NTP server or peer the preferred NTP server or peer for the device.",
			]

			choices: ["enabled", "disabled"]
		}
		vrf_name: description: [
			"Makes the device communicate with the given NTP server or peer over a specific VRF or keyword 'default'.",
		]

		source_addr: description: [
			"Local source address from which NTP messages are sent or keyword 'default'",
		]

		source_int: description: [
			"Local source interface from which NTP messages are sent. Must be fully qualified interface name or keyword 'default'",
		]

		state: {
			description: [
				"Manage the state of the resource.",
			]
			default: "present"
			choices: ["present", "absent"]
		}
	}
}
