package ansible

module: nxos_banner: {
	module:            "nxos_banner"
	version_added:     "2.4"
	author:            "Trishna Guha (@trishnaguha)"
	short_description: "Manage multiline banners on Cisco NXOS devices"
	description: [
		"This will configure both exec and motd banners on remote devices running Cisco NXOS. It allows playbooks to add or remote banner text from the active running configuration.",
	]

	options: {
		banner: {
			description: [
				"Specifies which banner that should be configured on the remote device.",
			]

			required: true
			choices: ["exec", "motd"]
		}
		text: description: [
			"The banner text that should be present in the remote device running configuration. This argument accepts a multiline string, with no empty lines. Requires I(state=present).",
		]

		state: {
			description: [
				"Specifies whether or not the configuration is present in the current devices active running configuration.",
			]

			default: "present"
			choices: ["present", "absent"]
		}
	}
	extends_documentation_fragment: "nxos"
}
