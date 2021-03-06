package ansible

module: clc_publicip: {
	module:            "clc_publicip"
	short_description: "Add and Delete public ips on servers in CenturyLink Cloud."
	description: [
		"An Ansible module to add or delete public ip addresses on an existing server or servers in CenturyLink Cloud.",
	]
	version_added: "2.0"
	options: {
		protocol: {
			description: [
				"The protocol that the public IP will listen for.",
			]
			default: "TCP"
			choices: ["TCP", "UDP", "ICMP"]
		}
		ports: description: [
			"A list of ports to expose. This is required when state is 'present'",
		]
		server_ids: {
			description: [
				"A list of servers to create public ips on.",
			]
			required: true
		}
		state: {
			description: [
				"Determine whether to create or delete public IPs. If present module will not create a second public ip if one already exists.",
			]

			default: "present"
			choices: ["present", "absent"]
		}
		wait: {
			description: [
				"Whether to wait for the tasks to finish before returning.",
			]
			type:    "bool"
			default: "yes"
		}
	}
	requirements: [
		"python = 2.7",
		"requests >= 2.5.0",
		"clc-sdk",
	]
	author: "CLC Runner (@clc-runner)"
	notes: [
		"To use this module, it is required to set the below environment variables which enables access to the Centurylink Cloud - CLC_V2_API_USERNAME, the account login id for the centurylink cloud - CLC_V2_API_PASSWORD, the account password for the centurylink cloud",
		"Alternatively, the module accepts the API token and account alias. The API token can be generated using the CLC account login and password via the HTTP api call @ https://api.ctl.io/v2/authentication/login - CLC_V2_API_TOKEN, the API token generated from https://api.ctl.io/v2/authentication/login - CLC_ACCT_ALIAS, the account alias associated with the centurylink cloud",
		"Users can set CLC_V2_API_URL to specify an endpoint for pointing to a different CLC environment.",
	]
}
