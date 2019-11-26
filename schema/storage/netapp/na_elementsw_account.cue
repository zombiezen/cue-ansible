package ansible

module: na_elementsw_account: {
	module: "na_elementsw_account"

	short_description: "NetApp Element Software Manage Accounts"
	extends_documentation_fragment: [
		"netapp.solidfire",
	]
	version_added: "2.7"
	author:        "NetApp Ansible Team (@carchi8py) <ng-ansibleteam@netapp.com>"
	description: [
		"Create, destroy, or update accounts on Element SW",
	]

	options: {

		state: {
			description: [
				"Whether the specified account should exist or not.",
			]
			required: true
			choices: ["present", "absent"]
		}

		element_username: {
			description: [
				"Unique username for this account. (May be 1 to 64 characters in length).",
			]
			required: true
			aliases: [
				"account_id",
			]
		}

		from_name: {
			description: [
				"ID or Name of the account to rename.",
				"Required to create an account called 'element_username' by renaming 'from_name'.",
			]
			version_added: "2.8"
		}

		initiator_secret: description: [
			"CHAP secret to use for the initiator. Should be 12-16 characters long and impenetrable.",
			"The CHAP initiator secrets must be unique and cannot be the same as the target CHAP secret.",
			"If not specified, a random secret is created.",
		]

		target_secret: description: [
			"CHAP secret to use for the target (mutual CHAP authentication).",
			"Should be 12-16 characters long and impenetrable.",
			"The CHAP target secrets must be unique and cannot be the same as the initiator CHAP secret.",
			"If not specified, a random secret is created.",
		]

		attributes: description: "List of Name/Value pairs in JSON object format."

		status: description: [
			"Status of the account.",
		]
	}
}
