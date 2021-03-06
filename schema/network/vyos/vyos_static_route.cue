package ansible

module: vyos_static_route: {
	module:            "vyos_static_route"
	version_added:     "2.4"
	author:            "Trishna Guha (@trishnaguha)"
	short_description: "Manage static IP routes on Vyatta VyOS network devices"
	description: [
		"This module provides declarative management of static IP routes on Vyatta VyOS network devices.",
	]

	notes: [
		"Tested against VyOS 1.1.8 (helium).",
		"This module works with connection C(network_cli). See L(the VyOS OS Platform Options,../network/user_guide/platform_vyos.html).",
	]
	options: {
		prefix: description: [
			"Network prefix of the static route. C(mask) param should be ignored if C(prefix) is provided with C(mask) value C(prefix/mask).",
		]

		mask: description: [
			"Network prefix mask of the static route.",
		]
		next_hop: description: [
			"Next hop IP of the static route.",
		]
		admin_distance: description: [
			"Admin distance of the static route.",
		]
		aggregate: description: "List of static route definitions"
		state: {
			description: [
				"State of the static route configuration.",
			]
			default: "present"
			choices: ["present", "absent"]
		}
	}
	extends_documentation_fragment: "vyos"
}
