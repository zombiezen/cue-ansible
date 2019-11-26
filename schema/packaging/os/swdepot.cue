package ansible

module: swdepot: {
	module:            "swdepot"
	short_description: "Manage packages with swdepot package manager (HP-UX)"
	description: [
		"Will install, upgrade and remove packages with swdepot package manager (HP-UX)",
	]
	version_added: "1.4"
	notes: []
	author: "Raul Melo (@melodous)"
	options: {
		name: {
			description: [
				"package name.",
			]
			required:      true
			version_added: 1.4
		}
		state: {
			description: [
				"whether to install (C(present), C(latest)), or remove (C(absent)) a package.",
			]
			required: true
			choices: ["present", "latest", "absent"]
			version_added: 1.4
		}
		depot: {
			description: [
				"The source repository from which install or upgrade a package.",
			]
			version_added: 1.4
		}
	}
}
