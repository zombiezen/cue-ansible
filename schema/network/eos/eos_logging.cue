package ansible

module: eos_logging: {
	module:            "eos_logging"
	version_added:     "2.4"
	author:            "Trishna Guha (@trishnaguha)"
	short_description: "Manage logging on network devices"
	description: [
		"This module provides declarative management of logging on Arista Eos devices.",
	]

	notes: [
		"Tested against EOS 4.15",
	]
	options: {
		dest: {
			description: [
				"Destination of the logs.",
			]
			choices: ["on", "host", "console", "monitor", "buffered"]
		}
		name: description: [
			"The hostname or IP address of the destination.",
			"Required when I(dest=host).",
		]
		size: description: [
			"Size of buffer. The acceptable value is in range from 10 to 2147483647 bytes.",
		]

		facility: description: [
			"Set logging facility.",
		]
		level: {
			description: [
				"Set logging severity levels.",
			]
			choices: [
				"emergencies",
				"alerts",
				"critical",
				"errors",
				"warnings",
				"notifications",
				"informational",
				"debugging",
			]
		}
		aggregate: description: "List of logging definitions."
		state: {
			description: [
				"State of the logging configuration.",
			]
			default: "present"
			choices: ["present", "absent"]
		}
	}
	extends_documentation_fragment: "eos"
}
