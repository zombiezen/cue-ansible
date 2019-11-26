package ansible

module: mysql_info: {
	module:            "mysql_info"
	short_description: "Gather information about MySQL servers"
	description: [
		"Gathers information about MySQL servers.",
	]
	version_added: "2.9"

	options: {
		filter: {
			description: [
				"Limit the collected information by comma separated string or YAML list.",
				"Allowable values are C(version), C(databases), C(settings), C(global_status), C(users), C(engines), C(master_status), C(slave_status), C(slave_hosts).",
				"By default, collects all subsets.",
				"You can use '!' before value (for example, C(!settings)) to exclude it from the information.",
				"If you pass including and excluding values to the filter, for example, I(filter=!settings,version), the excluding values, C(!settings) in this case, will be ignored.",
			]

			type:     "list"
			elements: "str"
		}
		login_db: {
			description: [
				"Database name to connect to.",
				"It makes sense if I(login_user) is allowed to connect to a specific database only.",
			]
			type: "str"
		}
	}

	author: [
		"Andrew Klychkov (@Andersson007)",
	]

	extends_documentation_fragment: "mysql"
}
