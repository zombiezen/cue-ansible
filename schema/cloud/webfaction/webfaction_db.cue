package ansible

module: webfaction_db: {
	module:            "webfaction_db"
	short_description: "Add or remove a database on Webfaction"
	description: [
		"Add or remove a database on a Webfaction host. Further documentation at https://github.com/quentinsf/ansible-webfaction.",
	]
	author:        "Quentin Stafford-Fraser (@quentinsf)"
	version_added: "2.0"
	notes: [
		"""
		You can run playbooks that use this on a local machine, or on a Webfaction host, or elsewhere, since the scripts use the remote webfaction API. The location is not important. However, running them on multiple hosts I(simultaneously) is best avoided. If you don't specify I(localhost) as your host, you may want to add C(serial: 1) to the plays.

		""",
		"See `the webfaction API <https://docs.webfaction.com/xmlrpc-api/>`_ for more info.",
	]
	options: {

		name: {
			description: [
				"The name of the database",
			]
			required: true
		}

		state: {
			description: [
				"Whether the database should exist",
			]
			choices: ["present", "absent"]
			default: "present"
		}

		type: {
			description: [
				"The type of database to create.",
			]
			required: true
			choices: ["mysql", "postgresql"]
		}

		password: description: [
			"The password for the new database user.",
		]

		login_name: {
			description: [
				"The webfaction account to use",
			]
			required: true
		}

		login_password: {
			description: [
				"The webfaction password to use",
			]
			required: true
		}

		machine: description: ["The machine name to use (optional for accounts with only one machine)"]
	}
}
