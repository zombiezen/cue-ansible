package ansible

module: nxos_reboot: {
	module:                         "nxos_reboot"
	extends_documentation_fragment: "nxos"
	version_added:                  2.2
	short_description:              "Reboot a network device."
	description: [
		"Reboot a network device.",
	]
	author: [
		"Jason Edelman (@jedelman8)",
		"Gabriele Gerbino (@GGabriele)",
	]
	notes: [
		"Tested against NXOSv 7.3.(0)D1(1) on VIRL",
		"The module will fail due to timeout issues, but the reboot will be performed anyway.",
	]

	options: confirm: {
		description: [
			"Safeguard boolean. Set to true if you're sure you want to reboot.",
		]
		required: false
		default:  false
		type:     "bool"
	}
}
