package ansible

module: proxysql_global_variables: {
	module:            "proxysql_global_variables"
	version_added:     "2.3"
	author:            "Ben Mildren (@bmildren)"
	short_description: "Gets or sets the proxysql global variables."
	description: [
		"The M(proxysql_global_variables) module gets or sets the proxysql global variables.",
	]

	options: {
		variable: {
			description: [
				"Defines which variable should be returned, or if I(value) is specified which variable should be updated.",
			]

			required: true
		}
		value: description: [
			"Defines a value the variable specified using I(variable) should be set to.",
		]
	}

	extends_documentation_fragment: [
		"proxysql.managing_config",
		"proxysql.connectivity",
	]
}
