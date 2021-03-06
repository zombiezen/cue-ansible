package ansible

module: homebrew_tap: {
	module: "homebrew_tap"
	author: [
		"Indrajit Raychaudhuri (@indrajitr)",
		"Daniel Jaouen (@danieljaouen)",
	]
	short_description: "Tap a Homebrew repository."
	description: [
		"Tap external Homebrew repositories.",
	]
	version_added: "1.6"
	options: {
		name: {
			description: [
				"The GitHub user/organization repository to tap.",
			]
			required: true
			aliases: ["tap"]
		}
		url: {
			description: [
				"The optional git URL of the repository to tap. The URL is not assumed to be on GitHub, and the protocol doesn't have to be HTTP. Any location and protocol that git can handle is fine.",
				"I(name) option may not be a list of multiple taps (but a single tap instead) when this option is provided.",
			]

			required:      false
			version_added: "2.2"
		}
		state: {
			description: [
				"state of the repository.",
			]
			choices: ["present", "absent"]
			required: false
			default:  "present"
		}
	}
	requirements: ["homebrew"]
}
