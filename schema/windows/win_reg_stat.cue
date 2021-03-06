package ansible

module: win_reg_stat: {
	module:            "win_reg_stat"
	version_added:     "2.3"
	short_description: "Get information about Windows registry keys"
	description: [
		"Like M(win_file), M(win_reg_stat) will return whether the key/property exists.",
		"It also returns the sub keys and properties of the key specified.",
		"If specifying a property name through I(property), it will return the information specific for that property.",
	]
	options: {
		path: {
			description: "The full registry key path including the hive to search for."
			type:        "str"
			required:    true
			aliases: ["key"]
		}
		name: {
			description: [
				"The registry property name to get information for, the return json will not include the sub_keys and properties entries for the I(key) specified.",
				"Set to an empty string to target the registry key's C((Default)) property value.",
			]
			type: "str"
			aliases: ["entry", "value", "property"]
		}
	}
	notes: [
		"The C(properties) return value will contain an empty string key C(\"\") that refers to the key's C(Default) value. If the value has not been set then this key is not returned.",
	]

	seealso: [{
		module: "win_regedit"
	}, {
		module: "win_regmerge"
	}]
	author: ["Jordan Borean (@jborean93)"]
}
