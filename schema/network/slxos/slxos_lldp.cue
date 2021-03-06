package ansible

module: slxos_lldp: {
	module:            "slxos_lldp"
	version_added:     "2.7"
	author:            "Matthew Stone (@bigmstone)"
	short_description: "Manage LLDP configuration on Extreme Networks SLX-OS network devices."
	description: [
		"This module provides declarative management of LLDP service on Extreme SLX-OS network devices.",
	]

	notes: [
		"Tested against SLX-OS 17s.1.02",
	]
	options: state: {
		description: [
			"State of the LLDP configuration. If value is I(present) lldp will be enabled else if it is I(absent) it will be disabled.",
		]

		default: "present"
		choices: ["present", "absent"]
	}
}
