package ansible

module: net_put: {
	module:            "net_put"
	version_added:     "2.6"
	author:            "Deepak Agrawal (@dagrawal)"
	short_description: "Copy a file from Ansible Controller to a network device"
	description: [
		"This module provides functionality to copy file from Ansible controller to network devices.",
	]

	extends_documentation_fragment: "network_agnostic"
	options: {
		src: {
			description: [
				"Specifies the source file. The path to the source file can either be the full path on the Ansible control host or a relative path from the playbook or role root directory.",
			]

			required: true
		}
		protocol: {
			description: [
				"Protocol used to transfer file.",
			]
			default: "scp"
			choices: ["scp", "sftp"]
		}
		dest: {
			description: [
				"Specifies the destination file. The path to destination file can either be the full path or relative path as supported by network_os.",
			]

			default: [
				"Filename from src and at default directory of user shell on network_os.",
			]

			required: false
		}
		mode: {
			description: [
				"Set the file transfer mode. If mode is set to I(text) then I(src) file will go through Jinja2 template engine to replace any vars if present in the src file. If mode is set to I(binary) then file will be copied as it is to destination device.",
			]

			default: "binary"
			choices: ["binary", "text"]
			version_added: "2.7"
		}
	}

	requirements: [
		"scp",
	]

	notes: [
		"Some devices need specific configurations to be enabled before scp can work These configuration should be pre-configured before using this module e.g ios - C(ip scp server enable).",
		"User privilege to do scp on network device should be pre-configured e.g. ios - need user privilege 15 by default for allowing scp.",
		"Default destination of source file.",
	]
}
