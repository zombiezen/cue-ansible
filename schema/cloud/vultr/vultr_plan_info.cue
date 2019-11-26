package ansible

module: vultr_plan_info: {
	module:            "vultr_plan_info"
	short_description: "Gather information about the Vultr plans available."
	description: [
		"Gather information about plans available to boot servers.",
	]
	version_added:                  "2.9"
	author:                         "Yanis Guenane (@Spredzy)"
	extends_documentation_fragment: "vultr"
}
