package ansible

module: selinux: {
	module:            "selinux"
	short_description: "Change policy and state of SELinux"
	description: [
		"Configures the SELinux mode and policy.",
		"A reboot may be required after usage.",
		"Ansible will not issue this reboot but will let you know when it is required.",
	]
	version_added: "0.7"
	options: {
		policy: description: [
			"The name of the SELinux policy to use (e.g. C(targeted)) will be required if state is not C(disabled).",
		]
		state: {
			description: [
				"The SELinux mode.",
			]
			required: true
			choices: ["disabled", "enforcing", "permissive"]
		}
		configfile: {
			description: [
				"The path to the SELinux configuration file, if non-standard.",
			]
			default: "/etc/selinux/config"
			aliases: ["conf", "file"]
		}
	}
	requirements: ["libselinux-python"]
	author: ["Derek Carter (@goozbach) <goozbach@friocorte.com>"]
}
