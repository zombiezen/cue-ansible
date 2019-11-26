package ansible

module: ovirt_permission_info: {
	module:            "ovirt_permission_info"
	short_description: "Retrieve information about one or more oVirt/RHV permissions"
	author:            "Ondra Machacek (@machacekondra)"
	version_added:     "2.3"
	description: [
		"Retrieve information about one or more oVirt/RHV permissions.",
		"This module was called C(ovirt_permission_facts) before Ansible 2.9, returning C(ansible_facts). Note that the M(ovirt_permission_info) module no longer returns C(ansible_facts)!",
	]

	notes: [
		"This module returns a variable C(ovirt_permissions), which contains a list of permissions. You need to register the result with the I(register) keyword to use it.",
	]

	options: {
		user_name: description: [
			"Username of the user to manage. In most LDAPs it's I(uid) of the user, but in Active Directory you must specify I(UPN) of the user.",
		]
		group_name: description: [
			"Name of the group to manage.",
		]
		authz_name: {
			description: [
				"Authorization provider of the user/group. In previous versions of oVirt/RHV known as domain.",
			]
			required: true
			aliases: ["domain"]
		}
		namespace: {
			description: [
				"Namespace of the authorization provider, where user/group resides.",
			]
			required: false
		}
	}
	extends_documentation_fragment: "ovirt_info"
}
