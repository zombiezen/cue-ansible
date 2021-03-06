package ansible

module: purefa_connect: {
	module:            "purefa_connect"
	version_added:     "2.9"
	short_description: "Manage replication connections between two FlashArrays"
	description: [
		"Manage array connections to specified target array",
	]
	author: [
		"Pure Storage Ansible Team (@sdodsley) <pure-ansible-team@purestorage.com>",
	]
	options: {
		state: {
			description: [
				"Create or delete array connection",
			]
			default: "present"
			type:    "str"
			choices: ["absent", "present"]
		}
		target_url: {
			description: [
				"Management IP address of remote array.",
			]
			type:     "str"
			required: true
		}
		target_api: {
			description: [
				"API token for target array",
			]
			type: "str"
		}
		connection: {
			description: "Type of connection between arrays."
			type:        "str"
			choices: ["sync", "async"]
			default: "async"
		}
	}
	extends_documentation_fragment: ["purestorage.fa"]
}
