package ansible

module: getent: {
	module:            "getent"
	short_description: "A wrapper to the unix getent utility"
	description: [
		"Runs getent against one of it's various databases and returns information into the host's facts, in a getent_<database> prefixed variable.",
	]

	version_added: "1.8"
	options: {
		database: {
			description: [
				"The name of a getent database supported by the target system (passwd, group, hosts, etc).",
			]

			required: true
		}
		key: {
			description: [
				"Key from which to return values from the specified database, otherwise the full contents are returned.",
			]

			default: ""
		}
		service: {
			description: [
				"Override all databases with the specified service",
				"The underlying system must support the service flag which is not always available.",
			]
			version_added: "2.9"
		}
		split: description: [
			"Character used to split the database values into lists/arrays such as ':' or '\t', otherwise  it will try to pick one depending on the database.",
		]
		fail_key: {
			description: [
				"If a supplied key is missing this will make the task fail if C(yes).",
			]
			type:    "bool"
			default: "yes"
		}
	}

	notes: [
		"Not all databases support enumeration, check system documentation for details.",
	]
	author: ["Brian Coca (@bcoca)"]
}
