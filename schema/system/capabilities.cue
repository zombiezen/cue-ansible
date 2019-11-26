package ansible

module: capabilities: {
	module:            "capabilities"
	short_description: "Manage Linux capabilities"
	description: [
		"This module manipulates files privileges using the Linux capabilities(7) system.",
	]
	version_added: "1.6"
	options: {
		path: {
			description: [
				"Specifies the path to the file to be managed.",
			]
			type:     "str"
			required: true
			aliases: ["key"]
		}
		capability: {
			description: [
				"Desired capability to set (with operator and flags, if state is C(present)) or remove (if state is C(absent))",
			]
			type:     "str"
			required: true
			aliases: ["cap"]
		}
		state: {
			description: [
				"Whether the entry should be present or absent in the file's capabilities.",
			]
			type: "str"
			choices: ["absent", "present"]
			default: "present"
		}
	}
	notes: [
		"The capabilities system will automatically transform operators and flags into the effective set, so for example, C(cap_foo=ep) will probably become C(cap_foo+ep).",
		"This module does not attempt to determine the final operator and flags to compare, so you will want to ensure that your capabilities argument matches the final capabilities.",
	]

	author: ["Nate Coraor (@natefoo)"]
}
