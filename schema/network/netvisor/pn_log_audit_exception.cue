package ansible

module: pn_log_audit_exception: {
	module:            "pn_log_audit_exception"
	author:            "Pluribus Networks (@rajaspachipulusu17)"
	version_added:     "2.9"
	short_description: "CLI command to create/delete an audit exception"
	description: [
		"This module can be used to create an audit exception and delete an audit exception.",
	]
	options: {
		pn_cliswitch: {
			description: [
				"Target switch to run the CLI on.",
			]
			required: false
			type:     "str"
		}
		pn_audit_type: {
			description: [
				"Specify the type of audit exception.",
			]
			required: false
			type:     "str"
			choices: ["cli", "shell", "vtysh"]
		}
		state: {
			description: [
				"State the action to perform. Use 'present' to create audit-exception and 'absent' to delete audit-exception.",
			]

			required: false
			type:     "str"
			choices: ["present", "absent"]
			default: "present"
		}
		pn_pattern: {
			description: [
				"Specify a regular expression to match exceptions.",
			]
			required: false
			type:     "str"
		}
		pn_scope: {
			description: [
				"scope - local or fabric.",
			]
			required: false
			type:     "str"
			choices: ["local", "fabric"]
		}
		pn_access: {
			description: [
				"Specify the access type to match exceptions.",
			]
			required: true
			type:     "str"
			choices: ["any", "read-only", "read-write"]
		}
	}
}
