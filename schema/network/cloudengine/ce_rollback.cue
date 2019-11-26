package ansible

module: ce_rollback: {
	module:            "ce_rollback"
	version_added:     "2.4"
	short_description: "Set a checkpoint or rollback to a checkpoint on HUAWEI CloudEngine switches."
	description: [
		"This module offers the ability to set a configuration checkpoint file or rollback to a configuration checkpoint file on HUAWEI CloudEngine switches.",
	]

	author: [
		"Li Yanfeng (@QijunPan)",
	]
	notes: [
		"Recommended connection is C(network_cli).",
		"This module also works with C(local) connections for legacy playbooks.",
	]
	options: {
		commit_id: description: [
			"Specifies the label of the configuration rollback point to which system configurations are expected to roll back. The value is an integer that the system generates automatically.",
		]

		label: description: [
			"Specifies a user label for a configuration rollback point. The value is a string of 1 to 256 case-sensitive ASCII characters, spaces not supported. The value must start with a letter and cannot be presented in a single hyphen (-).",
		]

		filename: description: [
			"Specifies a configuration file for configuration rollback. The value is a string of 5 to 64 case-sensitive characters in the format of *.zip, *.cfg, or *.dat, spaces not supported.",
		]

		last: description: [
			"Specifies the number of configuration rollback points. The value is an integer that ranges from 1 to 80.",
		]

		oldest: description: [
			"Specifies the number of configuration rollback points. The value is an integer that ranges from 1 to 80.",
		]

		action: {
			description: [
				"The operation of configuration rollback.",
			]
			required: true
			choices: ["rollback", "clear", "set", "display", "commit"]
		}
	}
}
