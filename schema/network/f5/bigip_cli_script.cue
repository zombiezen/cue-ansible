package ansible

module: bigip_cli_script: {
	module:            "bigip_cli_script"
	short_description: "Manage CLI scripts on a BIG-IP"
	description: [
		"Manages CLI scripts on a BIG-IP. CLI scripts, otherwise known as tmshell scripts or TMSH scripts allow you to create custom scripts that can run to manage objects within a BIG-IP.",
	]

	version_added: 2.7
	options: {
		name: {
			description: [
				"Specifies the name of the script.",
			]
			type:     "str"
			required: true
		}
		content: {
			description: [
				"The content of the script.",
				"This parameter is typically used in conjunction with Ansible's C(file), or template lookup plugins. If this sounds foreign to you, see the examples in this documentation.",
			]

			type: "str"
		}
		description: {
			description: [
				"Description of the cli script.",
			]
			type: "str"
		}
		partition: {
			description: [
				"Device partition to manage resources on.",
			]
			type:    "str"
			default: "Common"
		}
		state: {
			description: [
				"When C(present), ensures that the script exists.",
				"When C(absent), ensures the script is removed.",
			]
			type:    "str"
			default: "present"
			choices: [
				"present",
				"absent",
			]
		}
	}
	extends_documentation_fragment: "f5"
	author: [
		"Tim Rupp (@caphrim007)",
		"Wojciech Wypior (@wojtek0806)",
	]
}
