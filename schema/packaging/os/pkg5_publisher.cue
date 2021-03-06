package ansible

module: pkg5_publisher: {
	module:            "pkg5_publisher"
	author:            "Peter Oliver (@mavit)"
	short_description: "Manages Solaris 11 Image Packaging System publishers"
	version_added:     1.9
	description: [
		"IPS packages are the native packages in Solaris 11 and higher.",
		"This modules will configure which publishers a client will download IPS packages from.",
	]

	options: {
		name: {
			description: [
				"The publisher's name.",
			]
			required: true
			aliases: ["publisher"]
		}
		state: {
			description: [
				"Whether to ensure that a publisher is present or absent.",
			]
			default: "present"
			choices: ["present", "absent"]
		}
		sticky: {
			description: [
				"Packages installed from a sticky repository can only receive updates from that repository.",
			]

			type: "bool"
		}
		enabled: {
			description: [
				"Is the repository enabled or disabled?",
			]
			type: "bool"
		}
		origin: description: [
			"A path or URL to the repository.",
			"Multiple values may be provided.",
		]
		mirror: description: [
			"A path or URL to the repository mirror.",
			"Multiple values may be provided.",
		]
	}
}
