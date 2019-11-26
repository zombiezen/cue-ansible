package ansible

module: ordnance_config: {
	module:            "ordnance_config"
	version_added:     "2.3"
	author:            "Alexander Turner (@alexanderturner) <alex.turner@ordnance.io>"
	short_description: "Manage Ordnance configuration sections"
	description: [
		"Ordnance router configurations use a simple block indent file syntax for segmenting configuration into sections.  This module provides an implementation for working with these configuration sections in a deterministic way.",
	]

	options: {
		lines: {
			description: [
				"The ordered set of commands that should be configured in the section.  The commands must be the exact same commands as found in the device running-config.  Be sure to note the configuration command syntax as some commands are automatically modified by the device config parser.",
			]

			aliases: ["commands"]
		}
		parents: description: [
			"The ordered set of parents that uniquely identify the section or hierarchy the commands should be checked against.  If the parents argument is omitted, the commands are checked against the set of top level or global commands.",
		]

		src: description: [
			"Specifies the source path to the file that contains the configuration or configuration template to load.  The path to the source file can either be the full path on the Ansible control host or a relative path from the playbook or role root directory.  This argument is mutually exclusive with I(lines), I(parents).",
		]

		before: description: [
			"The ordered set of commands to push on to the command stack if a change needs to be made.  This allows the playbook designer the opportunity to perform configuration commands prior to pushing any changes without affecting how the set of commands are matched against the system.",
		]

		after: description: [
			"The ordered set of commands to append to the end of the command stack if a change needs to be made.  Just like with I(before) this allows the playbook designer to append a set of commands to be executed after the command set.",
		]

		match: {
			description: [
				"Instructs the module on the way to perform the matching of the set of commands against the current device config.  If match is set to I(line), commands are matched line by line.  If match is set to I(strict), command lines are matched with respect to position.  If match is set to I(exact), command lines must be an equal match.  Finally, if match is set to I(none), the module will not attempt to compare the source configuration with the running configuration on the remote device.",
			]

			default: "line"
			choices: ["line", "strict", "exact", "none"]
		}
		replace: {
			description: [
				"Instructs the module on the way to perform the configuration on the device.  If the replace argument is set to I(line) then the modified lines are pushed to the device in configuration mode.  If the replace argument is set to I(block) then the entire command block is pushed to the device in configuration mode if any line is not correct.",
			]

			default: "line"
			choices: ["line", "block"]
		}
		multiline_delimiter: {
			description: [
				"This argument is used when pushing a multiline configuration element to the Ordnance router.  It specifies the character to use as the delimiting character.  This only applies to the configuration action",
			]

			default: "@"
		}
		backup: {
			description: [
				"This argument will cause the module to create a full backup of the current C(running-config) from the remote device before any changes are made.  The backup file is written to the C(backup) folder in the playbook root directory.  If the directory does not exist, it is created.",
			]

			type:    "bool"
			default: "no"
		}
		config: description: [
			"The C(config) argument allows the playbook designer to supply the base configuration to be used to validate configuration changes necessary.  If this argument is provided, the module will not download the running-config from the remote node.",
		]

		defaults: {
			description: [
				"This argument specifies whether or not to collect all defaults when getting the remote device running config.  When enabled, the module will get the current config by issuing the command C(show running-config all).",
			]

			type:    "bool"
			default: "no"
		}
		save: {
			description: [
				"The C(save) argument instructs the module to save the running- config to the startup-config at the conclusion of the module running.  If check mode is specified, this argument is ignored.",
			]

			type:    "bool"
			default: "no"
		}
	}
}
