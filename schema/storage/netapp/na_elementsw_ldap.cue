package ansible

module: na_elementsw_ldap: {
	module: "na_elementsw_ldap"

	short_description: "NetApp Element Software Manage ldap admin users"
	extends_documentation_fragment: [
		"netapp.solidfire",
	]
	version_added: "2.7"
	author:        "NetApp Ansible Team (@carchi8py) <ng-ansibleteam@netapp.com>"
	description: [
		"Enable, disable ldap, and add ldap users",
	]

	options: {

		state: {
			description: [
				"Whether the specified volume should exist or not.",
			]
			required: true
			choices: ["present", "absent"]
		}

		authType: {
			description: [
				"Identifies which user authentication method to use.",
			]
			choices: ["DirectBind", "SearchAndBind"]
		}

		groupSearchBaseDn: description: [
			"The base DN of the tree to start the group search (will do a subtree search from here)",
		]

		groupSearchType: {
			description: [
				"Controls the default group search filter used",
			]
			choices: ["NoGroup", "ActiveDirectory", "MemberDN"]
		}

		serverURIs: description: [
			"A comma-separated list of LDAP server URIs",
		]

		userSearchBaseDN: description: [
			"The base DN of the tree to start the search (will do a subtree search from here)",
		]

		searchBindDN: description: [
			"A dully qualified DN to log in with to perform an LDAp search for the user (needs read access to the LDAP directory).",
		]

		searchBindPassword: description: [
			"The password for the searchBindDN account used for searching",
		]

		userSearchFilter: description: [
			"the LDAP Filter to use",
		]

		userDNTemplate: description: [
			"A string that is used form a fully qualified user DN.",
		]

		groupSearchCustomFilter: description: ["For use with the CustomFilter Search type"]
	}
}
