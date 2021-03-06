package ansible

module: infini_vol: {
	module:            "infini_vol"
	version_added:     2.3
	short_description: "Create, Delete or Modify volumes on Infinibox"
	description: [
		"This module creates, deletes or modifies volume on Infinibox.",
	]
	author: "Gregory Shulov (@GR360RY)"
	options: {
		name: {
			description: [
				"Volume Name",
			]
			required: true
		}
		state: {
			description: [
				"Creates/Modifies volume when present or removes when absent",
			]
			required: false
			default:  "present"
			choices: ["present", "absent"]
		}
		size: {
			description: [
				"Volume size in MB, GB or TB units. See examples.",
			]
			required: false
		}
		pool: {
			description: [
				"Pool that volume will reside on",
			]
			required: true
		}
	}
	extends_documentation_fragment: [
		"infinibox",
	]
	requirements: ["capacity"]
}
