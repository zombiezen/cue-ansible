package ansible

module: selinux_permissive: {
	module:            "selinux_permissive"
	short_description: "Change permissive domain in SELinux policy"
	description: [
		"Add and remove a domain from the list of permissive domains.",
	]
	version_added: "2.0"
	options: {
		domain: {
			description: [
				"The domain that will be added or removed from the list of permissive domains.",
			]
			type:     "str"
			required: true
			default:  ""
			aliases: ["name"]
		}
		permissive: {
			description: [
				"Indicate if the domain should or should not be set as permissive.",
			]
			type:     "bool"
			required: true
		}
		no_reload: {
			description: [
				"Disable reloading of the SELinux policy after making change to a domain's permissive setting.",
				"The default is C(no), which causes policy to be reloaded when a domain changes state.",
				"Reloading the policy does not work on older versions of the C(policycoreutils-python) library, for example in EL 6.\"",
			]
			type:    "bool"
			default: false
		}
		store: {
			description: [
				"Name of the SELinux policy store to use.",
			]
			type: "str"
		}
	}
	notes: [
		"Requires a recent version of SELinux and C(policycoreutils-python) (EL 6 or newer).",
	]
	requirements: ["policycoreutils-python"]
	author: ["Michael Scherer (@mscherer) <misc@zarb.org>"]
}
