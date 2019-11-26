package ansible

module: zabbix_user_info: {
	module:            "zabbix_user_info"
	short_description: "Gather information about Zabbix user"
	author: [
		"sky-joker (@sky-joker)",
	]
	version_added: "2.10"
	description: [
		"This module allows you to search for Zabbix user entries.",
	]
	requirements: [
		"python >= 2.6",
		"zabbix-api",
	]
	options: alias: {
		description: [
			"Name of the user alias in Zabbix.",
		]
		required: true
		type:     "str"
	}
	extends_documentation_fragment: ["zabbix"]
}
