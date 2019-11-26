package ansible

module: na_ontap_unix_user: {
	module: "na_ontap_unix_user"

	short_description: "NetApp ONTAP UNIX users"
	extends_documentation_fragment: [
		"netapp.na_ontap",
	]
	version_added: "2.8"
	author:        "NetApp Ansible Team (@carchi8py) <ng-ansibleteam@netapp.com>"

	description: [
		"Create, delete or modify UNIX users local to ONTAP.",
	]

	options: {

		state: {
			description: [
				"Whether the specified user should exist or not.",
			]
			choices: ["present", "absent"]
			default: "present"
		}

		name: {
			description: [
				"Specifies user's UNIX account name.",
				"Non-modifiable.",
			]
			required: true
		}

		group_id: description: [
			"Specifies the primary group identification number for the UNIX user",
			"Required for create, modifiable.",
		]

		vserver: {
			description: [
				"Specifies the Vserver for the UNIX user.",
				"Non-modifiable.",
			]
			required: true
		}

		id: description: [
			"Specifies an identification number for the UNIX user.",
			"Required for create, modifiable.",
		]

		full_name: description: [
			"Specifies the full name of the UNIX user",
			"Optional for create, modifiable.",
		]
	}
}
