package ansible

module: ipadm_if: {
	module:            "ipadm_if"
	short_description: "Manage IP interfaces  on Solaris/illumos systems."
	description: [
		"Create, delete, enable or disable IP interfaces on Solaris/illumos systems.",
	]

	version_added: "2.2"
	author:        "Adam Števko (@xen0l)"
	options: {
		name: {
			description: ["IP interface name."]
			required: true
		}
		temporary: {
			description: [
				"Specifies that the IP interface is temporary. Temporary IP interfaces do not persist across reboots.",
			]

			required: false
			default:  false
			type:     "bool"
		}
		state: {
			description: ["Create or delete Solaris/illumos IP interfaces."]
			required: false
			default:  "present"
			choices: ["present", "absent", "enabled", "disabled"]
		}
	}
}
