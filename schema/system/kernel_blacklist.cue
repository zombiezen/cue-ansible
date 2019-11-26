package ansible

module: kernel_blacklist: {
	module: "kernel_blacklist"
	author: [
		"Matthias Vogelgesang (@matze)",
	]
	version_added:     "1.4"
	short_description: "Blacklist kernel modules"
	description: [
		"Add or remove kernel modules from blacklist.",
	]
	options: {
		name: {
			description: [
				"Name of kernel module to black- or whitelist.",
			]
			required: true
		}
		state: {
			description: [
				"Whether the module should be present in the blacklist or absent.",
			]
			choices: ["absent", "present"]
			default: "present"
		}
		blacklist_file: description: [
			"If specified, use this blacklist file instead of C(/etc/modprobe.d/blacklist-ansible.conf).",
		]
	}
}
