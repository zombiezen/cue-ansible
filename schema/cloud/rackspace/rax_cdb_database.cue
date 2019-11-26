package ansible

module: rax_cdb_database: {
	module:            "rax_cdb_database"
	short_description: "create / delete a database in the Cloud Databases"
	description: [
		"create / delete a database in the Cloud Databases.",
	]
	version_added: "1.8"
	options: {
		cdb_id: description: [
			"The databases server UUID",
		]
		name: description: [
			"Name to give to the database",
		]
		character_set: {
			description: [
				"Set of symbols and encodings",
			]
			default: "utf8"
		}
		collate: {
			description: [
				"Set of rules for comparing characters in a character set",
			]
			default: "utf8_general_ci"
		}
		state: {
			description: [
				"Indicate desired state of the resource",
			]
			choices: ["present", "absent"]
			default: "present"
		}
	}
	author: "Simon JAILLET (@jails)"
	extends_documentation_fragment: [
		"rackspace",
		"rackspace.openstack",
	]
}
