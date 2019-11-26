package ansible

module: purefb_ra: {
	module:            "purefb_ra"
	version_added:     "2.9"
	short_description: "Enable or Disable Pure Storage FlashBlade Remote Assist"
	description: [
		"Enable or Disable Remote Assist for a Pure Storage FlashBlade.",
	]
	author: [
		"Pure Storage Ansible Team (@sdodsley) <pure-ansible-team@purestorage.com>",
	]
	options: state: {
		description: [
			"Define state of remote assist",
			"When set to I(enable) the RA port can be exposed using the I(debug) module.",
		]

		type:    "str"
		default: "present"
		choices: ["present", "absent"]
	}
	extends_documentation_fragment: ["purestorage.fb"]
}
