package ansible

module: purefb_snap: {
	module:            "purefb_snap"
	version_added:     "2.6"
	short_description: "Manage filesystem snapshots on Pure Storage FlashBlades"
	description: [
		"Create or delete volumes and filesystem snapshots on Pure Storage FlashBlades.",
	]
	author: [
		"Pure Storage Ansible Team (@sdodsley) <pure-ansible-team@purestorage.com>",
	]
	options: {
		name: {
			description: [
				"The name of the source filesystem.",
			]
			required: true
			type:     "str"
		}
		suffix: {
			description: [
				"Suffix of snapshot name.",
			]
			type: "str"
		}
		state: {
			description: [
				"Define whether the filesystem snapshot should exist or not.",
			]
			choices: ["absent", "present"]
			default: "present"
			type:    "str"
		}
		eradicate: {
			description: [
				"Define whether to eradicate the snapshot on delete or leave in trash.",
			]
			type:    "bool"
			default: "no"
		}
	}
	extends_documentation_fragment: ["purestorage.fb"]
}
