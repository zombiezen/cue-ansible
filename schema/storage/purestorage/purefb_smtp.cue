package ansible

module: purefb_smtp: {
	module:            "purefb_smtp"
	version_added:     "2.9"
	short_description: "Configure SMTP for Pure Storage FlashBlade"
	description: [
		"Configure SMTP for a Pure Storage FlashBlade.",
		"Whilst there can be no relay host, a sender domain must be configured.",
	]
	author: [
		"Pure Storage Ansible Team (@sdodsley) <pure-ansible-team@purestorage.com>",
	]
	options: {
		host: {
			description: "Relay server name"
			type:        "str"
		}
		domain: {
			description: "Domain name for alert messages"
			required:    true
			type:        "str"
		}
	}
	extends_documentation_fragment: ["purestorage.fb"]
}
