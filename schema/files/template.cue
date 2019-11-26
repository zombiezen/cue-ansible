package ansible

module: template: {
	module:        "template"
	version_added: "historical"
	options: follow: {
		description: [
			"Determine whether symbolic links should be followed.",
			"When set to C(yes) symbolic links will be followed, if they exist.",
			"When set to C(no) symbolic links will not be followed.",
			"Previous to Ansible 2.4, this was hardcoded as C(yes).",
		]
		type:          "bool"
		default:       false
		version_added: "2.4"
	}
	notes: [
		"You can use the M(copy) module with the C(content:) option if you prefer the template inline, as part of the playbook.",
		"For Windows you can use M(win_template) which uses '\\\\r\\\\n' as C(newline_sequence) by default.",
	]
	seealso: [{
		module: "copy"
	}, {
		module: "win_copy"
	}, {
		module: "win_template"
	}]
	author: [
		"Ansible Core Team",
		"Michael DeHaan",
	]
	extends_documentation_fragment: [
		"backup",
		"files",
		"template_common",
		"validate",
	]
}
