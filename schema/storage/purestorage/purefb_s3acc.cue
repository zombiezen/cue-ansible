package ansible

module: purefb_s3acc: {
	module:            "purefb_s3acc"
	version_added:     "2.8"
	short_description: "Create or delete FlashBlade Object Store accounts"
	description: [
		"Create or delete object store accounts on a Pure Storage FlashBlade.",
	]
	author: [
		"Pure Storage Ansible Team (@sdodsley) <pure-ansible-team@purestorage.com>",
	]
	options: {
		state: {
			description: [
				"Create or delete object store account",
			]
			default: "present"
			choices: ["absent", "present"]
			type: "str"
		}
		name: {
			description: [
				"The name of object store account",
			]
			type: "str"
		}
	}
	extends_documentation_fragment: ["purestorage.fb"]
}
