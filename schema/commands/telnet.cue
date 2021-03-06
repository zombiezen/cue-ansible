package ansible

module: telnet: {
	module:            "telnet"
	short_description: "Executes a low-down and dirty telnet command"
	version_added:     2.4
	description: [
		"Executes a low-down and dirty telnet command, not going through the module subsystem.",
		"This is mostly to be used for enabling ssh on devices that only have telnet enabled by default.",
	]
	options: {
		command: {
			description: [
				"List of commands to be executed in the telnet session.",
			]
			required: true
			aliases: ["commands"]
		}
		host: {
			description: [
				"The host/target on which to execute the command",
			]
			required: false
			default:  "remote_addr"
		}
		user: {
			description: [
				"The user for login",
			]
			required: false
			default:  "remote_user"
		}
		password: description: [
			"The password for login",
		]
		port: {
			description: [
				"Remote port to use",
			]
			default: 23
		}
		timeout: {
			description: [
				"timeout for remote operations",
			]
			default: 120
		}
		prompts: {
			description: [
				"List of prompts expected before sending next command",
			]
			required: false
			default: ["$"]
		}
		login_prompt: {
			description: [
				"Login or username prompt to expect",
			]
			required: false
			default:  "login: "
		}
		password_prompt: {
			description: [
				"Login or username prompt to expect",
			]
			required: false
			default:  "Password: "
		}
		pause: {
			description: [
				"Seconds to pause between each command issued",
			]
			required: false
			default:  1
		}
		send_newline: {
			description: [
				"Sends a newline character upon successful connection to start the terminal session.",
			]

			required:      false
			default:       false
			type:          "bool"
			version_added: "2.7"
		}
	}
	notes: [
		"The C(environment) keyword does not work with this task",
	]
	author: ["Ansible Core Team"]
}
