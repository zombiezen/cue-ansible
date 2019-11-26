package ansible

module: snap: {
	module: "snap"

	short_description: "Manages snaps"

	version_added: "2.8"

	description: [
		"Manages snaps packages.",
	]

	options: {
		name: {
			description: [
				"Name of the snap to install or remove. Can be a list of snaps.",
			]
			required: true
		}
		state: {
			description: [
				"Desired state of the package.",
			]
			required: false
			default:  "present"
			choices: ["absent", "present"]
		}
		classic: {
			description: [
				"Confinement policy. The classic confinement allows a snap to have the same level of access to the system as \"classic\" packages, like those managed by APT. This option corresponds to the --classic argument. This option can only be specified if there is a single snap in the task.",
			]

			type:     "bool"
			required: false
			default:  false
		}
		channel: {
			description: [
				"Define which release of a snap is installed and tracked for updates. This option can only be specified if there is a single snap in the task.",
			]

			type:     "str"
			required: false
			default:  "stable"
		}
	}

	author: [
		"Victor Carceler (@vcarceler) <vcarceler@iespuigcastellar.xeill.net>",
		"Stanislas Lange (@angristan) <angristan@pm.me>",
	]
}
