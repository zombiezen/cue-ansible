package ansible

module: ibm_sa_vol: {
	module:            "ibm_sa_vol"
	short_description: "Handle volumes on IBM Spectrum Accelerate Family storage systems."
	version_added:     "2.7"

	description: [
		"This module creates or deletes volumes to be used on IBM Spectrum Accelerate Family storage systems.",
	]

	options: {
		vol: {
			description: [
				"Volume name.",
			]
			required: true
		}
		pool: {
			description: [
				"Volume pool.",
			]
			required: false
		}
		state: {
			description: [
				"Volume state.",
			]
			required: true
			default:  "present"
			choices: ["present", "absent"]
		}
		size: {
			description: [
				"Volume size.",
			]
			required: false
		}
	}

	extends_documentation_fragment: [
		"ibm_storage",
	]

	author: ["Tzur Eliyahu (@tzure)"]
}
