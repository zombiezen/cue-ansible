package ansible

module: swupd: {
	module:            "swupd"
	short_description: "Manages updates and bundles in ClearLinux systems."
	description: [
		"Manages updates and bundles with the swupd bundle manager, which is used by the Clear Linux Project for Intel Architecture.",
	]

	version_added: "2.3"
	author:        "Alberto Murillo (@albertomurillo)"
	options: {
		contenturl: description: [
			"URL pointing to the contents of available bundles. If not specified, the contents are retrieved from clearlinux.org.",
		]

		format: description: [
			"The format suffix for version file downloads. For example [1,2,3,staging,etc]. If not specified, the default format is used.",
		]

		manifest: {
			description: [
				"The manifest contains information about the bundles at certain version of the OS. Specify a Manifest version to verify against that version or leave unspecified to verify against the current version.",
			]

			aliases: ["release", "version"]
		}
		name: {
			description: [
				"Name of the (I)bundle to install or remove.",
			]
			aliases: ["bundle"]
		}
		state: {
			description: [
				"Indicates the desired (I)bundle state. C(present) ensures the bundle is installed while C(absent) ensures the (I)bundle is not installed.",
			]

			default: "present"
			choices: ["present", "absent"]
		}
		update: {
			description: [
				"Updates the OS to the latest version.",
			]
			type: "bool"
		}
		url: description: [
			"Overrides both I(contenturl) and I(versionurl).",
		]
		verify: {
			description: [
				"Verify content for OS version.",
			]
			type: "bool"
		}
		versionurl: description: ["URL for version string download."]
	}
}
