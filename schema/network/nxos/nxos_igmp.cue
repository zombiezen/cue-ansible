package ansible

module: nxos_igmp: {
	module:                         "nxos_igmp"
	extends_documentation_fragment: "nxos"
	version_added:                  "2.2"
	short_description:              "Manages IGMP global configuration."
	description: [
		"Manages IGMP global configuration configuration settings.",
	]
	author: [
		"Jason Edelman (@jedelman8)",
		"Gabriele Gerbino (@GGabriele)",
	]
	notes: [
		"Tested against NXOSv 7.3.(0)D1(1) on VIRL",
		"When C(state=default), all supported params will be reset to a default state.",
		"If restart is set to true with other params set, the restart will happen last, i.e. after the configuration takes place.",
	]

	options: {
		flush_routes: {
			description: [
				"Removes routes when the IGMP process is restarted. By default, routes are not flushed.",
			]

			type: "bool"
		}
		enforce_rtr_alert: {
			description: [
				"Enables or disables the enforce router alert option check for IGMPv2 and IGMPv3 packets.",
			]

			type: "bool"
		}
		restart: {
			description: [
				"Restarts the igmp process (using an exec config command).",
			]
			type: "bool"
		}
		state: {
			description: [
				"Manages desired state of the resource.",
			]
			default: "present"
			choices: ["present", "default"]
		}
	}
}
