package ansible

module: manageiq_user: {
	module: "manageiq_user"

	short_description:              "Management of users in ManageIQ."
	extends_documentation_fragment: "manageiq"
	version_added:                  "2.4"
	author:                         "Daniel Korn (@dkorn)"
	description: [
		"The manageiq_user module supports adding, updating and deleting users in ManageIQ.",
	]

	options: {
		state: {
			description: [
				"absent - user should not exist, present - user should be.",
			]
			choices: ["absent", "present"]
			default: "present"
		}
		userid: {
			description: [
				"The unique userid in manageiq, often mentioned as username.",
			]
			required: true
		}
		name: description: [
			"The users' full name.",
		]
		password: description: [
			"The users' password.",
		]
		group: description: [
			"The name of the group to which the user belongs.",
		]
		email: description: [
			"The users' E-mail address.",
		]
		update_password: {
			default: "always"
			choices: ["always", "on_create"]
			description: [
				"C(always) will update passwords unconditionally.  C(on_create) will only set the password for a newly created user.",
			]
			version_added: "2.5"
		}
	}
}
