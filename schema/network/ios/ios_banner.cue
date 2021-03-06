package ansible

module: ios_banner: {
	module:            "ios_banner"
	version_added:     "2.3"
	author:            "Ricardo Carrillo Cruz (@rcarrillocruz)"
	short_description: "Manage multiline banners on Cisco IOS devices"
	description: [
		"This will configure both login and motd banners on remote devices running Cisco IOS.  It allows playbooks to add or remote banner text from the active running configuration.",
	]

	extends_documentation_fragment: "ios"
	notes: [
		"Tested against IOS 15.6",
	]
	options: {
		banner: {
			description: [
				"Specifies which banner should be configured on the remote device. In Ansible 2.4 and earlier only I(login) and I(motd) were supported.",
			]

			required: true
			choices: ["login", "motd", "exec", "incoming", "slip-ppp"]
		}
		text: description: [
			"The banner text that should be present in the remote device running configuration.  This argument accepts a multiline string, with no empty lines. Requires I(state=present).",
		]

		state: {
			description: [
				"Specifies whether or not the configuration is present in the current devices active running configuration.",
			]

			default: "present"
			choices: ["present", "absent"]
		}
	}
}
