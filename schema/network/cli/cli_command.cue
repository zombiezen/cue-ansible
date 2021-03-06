package ansible

module: cli_command: {
	module:            "cli_command"
	version_added:     "2.7"
	author:            "Nathaniel Case (@Qalthos)"
	short_description: "Run a cli command on cli-based network devices"
	description: [
		"Sends a command to a network device and returns the result read from the device.",
	]
	extends_documentation_fragment: "network_agnostic"
	options: {
		command: {
			description: [
				"The command to send to the remote network device.  The resulting output from the command is returned, unless I(sendonly) is set.",
			]

			required: true
		}
		prompt: {
			description: [
				"A single regex pattern or a sequence of patterns to evaluate the expected prompt from I(command).",
			]

			required: false
			type:     "list"
		}
		answer: {
			description: [
				"The answer to reply with if I(prompt) is matched. The value can be a single answer or a list of answer for multiple prompts. In case the command execution results in multiple prompts the sequence of the prompt and excepted answer should be in same order.",
			]

			required: false
			type:     "list"
		}
		sendonly: {
			description: [
				"The boolean value, that when set to true will send I(command) to the device but not wait for a result.",
			]

			type:     "bool"
			default:  false
			required: false
		}
		newline: {
			description: [
				"The boolean value, that when set to false will send I(answer) to the device without a trailing newline.",
			]

			type:          "bool"
			default:       true
			required:      false
			version_added: 2.9
		}
		check_all: {
			description: [
				"By default if any one of the prompts mentioned in C(prompt) option is matched it won't check for other prompts. This boolean flag, that when set to I(True) will check for all the prompts mentioned in C(prompt) option in the given order. If the option is set to I(True) all the prompts should be received from remote host if not it will result in timeout.",
			]

			type:    "bool"
			default: false
		}
	}
}
