package ansible

module: nxos_lldp: {
	module:            "nxos_lldp"
	version_added:     "2.5"
	author:            "Ganesh Nalawade (@ganeshrn)"
	short_description: "Manage LLDP configuration on Cisco NXOS network devices."
	description: [
		"This module provides declarative management of LLDP service on Cisco NXOS network devices.",
	]

	notes: [
		"Tested against NXOSv 7.0(3)I5(1).",
	]
	options: state: {
		description: [
			"State of the LLDP configuration. If value is I(present) lldp will be enabled else if it is I(absent) it will be disabled.",
		]

		default: "present"
		choices: ["present", "absent"]
	}
	extends_documentation_fragment: "nxos"
}
