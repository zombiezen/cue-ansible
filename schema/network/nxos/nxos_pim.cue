package ansible

module: nxos_pim: {
	module:                         "nxos_pim"
	extends_documentation_fragment: "nxos"
	version_added:                  "2.2"
	short_description:              "Manages configuration of a PIM instance."
	description: [
		"Manages configuration of a Protocol Independent Multicast (PIM) instance.",
	]
	author: "Gabriele Gerbino (@GGabriele)"
	options: {
		bfd: {
			description: [
				"Enables BFD on all PIM interfaces.",
				"Dependency: 'feature bfd'",
			]
			version_added: "2.9"
			type:          "str"
			choices: ["enable", "disable"]
		}

		ssm_range: {
			description: [
				"Configure group ranges for Source Specific Multicast (SSM). Valid values are multicast addresses or the keyword C(none) or keyword C(default). C(none) removes all SSM group ranges. C(default) will set ssm_range to the default multicast address. If you set multicast address, please ensure that it is not the same as the C(default), otherwise use the C(default) option.",
			]

			required: true
		}
	}
}
