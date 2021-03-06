package ansible

module: purefa_hg: {
	module:            "purefa_hg"
	version_added:     "2.4"
	short_description: "Manage hostgroups on Pure Storage FlashArrays"
	description: [
		"Create, delete or modify hostgroups on Pure Storage FlashArrays.",
	]
	author: [
		"Pure Storage ansible Team (@sdodsley) <pure-ansible-team@purestorage.com>",
	]
	options: {
		hostgroup: {
			description: [
				"The name of the hostgroup.",
			]
			type:     "str"
			required: true
		}
		state: {
			description: [
				"Define whether the hostgroup should exist or not.",
			]
			type:    "str"
			default: "present"
			choices: ["absent", "present"]
		}
		host: {
			type: "list"
			description: [
				"List of existing hosts to add to hostgroup.",
			]
		}
		volume: {
			type: "list"
			description: [
				"List of existing volumes to add to hostgroup.",
			]
		}
	}
	extends_documentation_fragment: ["purestorage.fa"]
}
