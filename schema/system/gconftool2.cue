package ansible

module: gconftool2: {
	module: "gconftool2"
	author: [
		"Kenneth D. Evensen (@kevensen)",
	]
	short_description: "Edit GNOME Configurations"
	description: [
		"This module allows for the manipulation of GNOME 2 Configuration via gconftool-2.  Please see the gconftool-2(1) man pages for more details.",
	]

	version_added: "2.3"
	options: {
		key: {
			description: [
				"A GConf preference key is an element in the GConf repository that corresponds to an application preference. See man gconftool-2(1)",
			]

			required: true
		}
		value: description: [
			"Preference keys typically have simple values such as strings, integers, or lists of strings and integers. This is ignored if the state is \"get\". See man gconftool-2(1)",
		]

		value_type: {
			description: [
				"The type of value being set. This is ignored if the state is \"get\".",
			]
			choices: ["bool", "float", "int", "string"]
		}
		state: {
			description: [
				"The action to take upon the key/value.",
			]
			required: true
			choices: ["absent", "get", "present"]
		}
		config_source: description: [
			"Specify a configuration source to use rather than the default path. See man gconftool-2(1)",
		]

		direct: {
			description: [
				"Access the config database directly, bypassing server.  If direct is specified then the config_source must be specified as well. See man gconftool-2(1)",
			]

			type:    "bool"
			default: "no"
		}
	}
}
