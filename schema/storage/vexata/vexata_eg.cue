package ansible

module: vexata_eg: {
	module:            "vexata_eg"
	version_added:     2.9
	short_description: "Manage export groups on Vexata VX100 storage arrays"
	description: [
		"Create or delete export groups on a Vexata VX100 array.",
		"An export group is a tuple of a volume group, initiator group and port group that allows a set of volumes to be exposed to one or more hosts through specific array ports.",
	]

	author: [
		"Sandeep Kasargod (@vexata)",
	]
	options: {
		name: {
			description: [
				"Export group name.",
			]
			required: true
			type:     "str"
		}
		state: {
			description: [
				"Creates export group when present or delete when absent.",
			]
			default: "present"
			choices: ["present", "absent"]
			type: "str"
		}
		vg: {
			description: [
				"Volume group name.",
			]
			type: "str"
		}
		ig: {
			description: [
				"Initiator group name.",
			]
			type: "str"
		}
		pg: {
			description: [
				"Port group name.",
			]
			type: "str"
		}
	}
	extends_documentation_fragment: ["vexata.vx100"]
}
