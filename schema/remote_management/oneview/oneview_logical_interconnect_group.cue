package ansible

module: oneview_logical_interconnect_group: {
	module:            "oneview_logical_interconnect_group"
	short_description: "Manage OneView Logical Interconnect Group resources"
	description: [
		"Provides an interface to manage Logical Interconnect Group resources. Can create, update, or delete.",
	]
	version_added: "2.5"
	requirements: [
		"hpOneView >= 4.0.0",
	]
	author: [
		"Felipe Bulsoni (@fgbulsoni)",
		"Thiago Miotto (@tmiotto)",
		"Adriane Cardozo (@adriane-cardozo)",
	]
	options: {
		state: {
			description: [
				"Indicates the desired state for the Logical Interconnect Group resource. C(absent) will remove the resource from OneView, if it exists. C(present) will ensure data properties are compliant with OneView.",
			]

			choices: ["absent", "present"]
			default: "present"
		}
		data: {
			description: [
				"List with the Logical Interconnect Group properties.",
			]
			required: true
		}
	}
	extends_documentation_fragment: [
		"oneview",
		"oneview.validateetag",
	]
}
