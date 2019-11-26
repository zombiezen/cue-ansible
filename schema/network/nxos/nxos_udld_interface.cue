package ansible

module: nxos_udld_interface: {
	module:                         "nxos_udld_interface"
	extends_documentation_fragment: "nxos"
	version_added:                  "2.2"
	short_description:              "Manages UDLD interface configuration params."
	description: [
		"Manages UDLD interface configuration params.",
	]
	author: [
		"Jason Edelman (@jedelman8)",
	]
	notes: [
		"Tested against NXOSv 7.3.(0)D1(1) on VIRL",
		"Feature UDLD must be enabled on the device to use this module.",
	]
	options: {
		mode: {
			description: [
				"Manages UDLD mode for an interface.",
			]
			required: true
			choices: ["enabled", "disabled", "aggressive"]
		}
		interface: {
			description: [
				"FULL name of the interface, i.e. Ethernet1/1-",
			]
			required: true
		}
		state: {
			description: [
				"Manage the state of the resource.",
			]
			required: false
			default:  "present"
			choices: ["present", "absent"]
		}
	}
}
