package ansible

module: nxos_config: {
	module:                         "nxos_config"
	extends_documentation_fragment: "nxos"
	version_added:                  "2.1"
	author:                         "Peter Sprygada (@privateip)"
	short_description:              "Manage Cisco NXOS configuration sections"
	description: [
		"Cisco NXOS configurations use a simple block indent file syntax for segmenting configuration into sections.  This module provides an implementation for working with NXOS configuration sections in a deterministic way.  This module works with either CLI or NXAPI transports.",
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

		src: {
			description: [
				"The I(src) argument provides a path to the configuration file to load into the remote system.  The path can either be a full system path to the configuration file if the value starts with / or relative to the root of the implemented role or playbook. This argument is mutually exclusive with the I(lines) and I(parents) arguments.",
			]

			version_added: "2.2"
		}
		replace_src: {
			description: [
				"The I(replace_src) argument provides path to the configuration file to load into the remote system. This argument is used to replace the entire config with a flat-file. This is used with argument I(replace) with value I(config). This is mutually exclusive with the I(lines) and I(src) arguments. This argument is supported on Nexus 9K device. Use I(nxos_file_copy) module to copy the flat file to remote device and then use the path with this argument.",
			]

			version_added: "2.5"
		}
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
				"Instructs the module on the way to perform the configuration on the device.  If the replace argument is set to I(line) then the modified lines are pushed to the device in configuration mode.  If the replace argument is set to I(block) then the entire command block is pushed to the device in configuration mode if any line is not correct. replace I(config) is supported only on Nexus 9K device.",
			]

			default: "line"
			choices: ["line", "block", "config"]
		}
		backup: {
			description: [
				"This argument will cause the module to create a full backup of the current C(running-config) from the remote device before any changes are made. If the C(backup_options) value is not given, the backup file is written to the C(backup) folder in the playbook root directory or role root directory, if playbook is part of an ansible role. If the directory does not exist, it is created.",
			]

			type:          "bool"
			default:       "no"
			version_added: "2.2"
		}
		running_config: {
			description: [
				"The module, by default, will connect to the remote device and retrieve the current running-config to use as a base for comparing against the contents of source.  There are times when it is not desirable to have the task get the current running-config for every task in a playbook.  The I(running_config) argument allows the implementer to pass in the configuration to use as the base config for comparison.",
			]

			aliases: ["config"]
			version_added: "2.4"
		}
		defaults: {
			description: [
				"The I(defaults) argument will influence how the running-config is collected from the device.  When the value is set to true, the command used to collect the running-config is append with the all keyword.  When the value is set to false, the command is issued without the all keyword",
			]

			type:          "bool"
			default:       "no"
			version_added: "2.2"
		}
		save_when: {
			description: [
				"When changes are made to the device running-configuration, the changes are not copied to non-volatile storage by default.  Using this argument will change that before.  If the argument is set to I(always), then the running-config will always be copied to the startup-config and the I(modified) flag will always be set to True.  If the argument is set to I(modified), then the running-config will only be copied to the startup-config if it has changed since the last save to startup-config.  If the argument is set to I(never), the running-config will never be copied to the startup-config.  If the argument is set to I(changed), then the running-config will only be copied to the startup-config if the task has made a change. I(changed) was added in Ansible 2.6.",
			]

			default: "never"
			choices: ["always", "never", "modified", "changed"]
			version_added: "2.4"
		}
		diff_against: {
			description: [
				"When using the C(ansible-playbook --diff) command line argument the module can generate diffs against different sources.",
				"When this option is configure as I(startup), the module will return the diff of the running-config against the startup-config.",
				"When this option is configured as I(intended), the module will return the diff of the running-config against the configuration provided in the C(intended_config) argument.",
				"When this option is configured as I(running), the module will return the before and after diff of the running-config with respect to any changes made to the device configuration.",
			]

			default: "startup"
			choices: ["startup", "intended", "running"]
			version_added: "2.4"
		}
		diff_ignore_lines: {
			description: [
				"Use this argument to specify one or more lines that should be ignored during the diff.  This is used for lines in the configuration that are automatically updated by the system.  This argument takes a list of regular expressions or exact line matches.",
			]

			version_added: "2.4"
		}
		intended_config: {
			description: [
				"The C(intended_config) provides the master configuration that the node should conform to and is used to check the final running-config against.   This argument will not modify any settings on the remote device and is strictly used to check the compliance of the current device's configuration against.  When specifying this argument, the task should also modify the C(diff_against) value and set it to I(intended).",
			]

			version_added: "2.4"
		}
		backup_options: {
			description: [
				"This is a dict object containing configurable options related to backup file path. The value of this option is read only when C(backup) is set to I(True), if C(backup) is set to I(false) this option will be silently ignored.",
			]

			suboptions: {
				filename: description: [
					"The filename to be used to store the backup configuration. If the the filename is not given it will be generated based on the hostname, current time and date in format defined by <hostname>_config.<current-date>@<current-time>",
				]

				dir_path: {
					description: [
						"This option provides the path ending with directory name in which the backup configuration file will be stored. If the directory does not exist it will be created and the filename is either the value of C(filename) or default filename as described in C(filename) options description. If the path value is not given in that case a I(backup) directory will be created in the current working directory and backup configuration will be copied in C(filename) within I(backup) directory.",
					]

					type: "path"
				}
			}
			type:          "dict"
			version_added: "2.8"
		}
	}
	notes: [
		"Abbreviated commands are NOT idempotent, see L(Network FAQ,../network/user_guide/faq.html#why-do-the-config-modules-always-return-changed-true-with-abbreviated-commands).",
	]
}
