package ansible

module: na_ontap_dns: {
	module:            "na_ontap_dns"
	short_description: "NetApp ONTAP Create, delete, modify DNS servers."
	extends_documentation_fragment: [
		"netapp.na_ontap",
	]
	version_added: "2.7"
	author:        "NetApp Ansible Team (@carchi8py) <ng-ansibleteam@netapp.com>"
	description: [
		"Create, delete, modify DNS servers.",
	]
	options: {
		state: {
			description: [
				"Whether the DNS servers should be enabled for the given vserver.",
			]
			choices: ["present", "absent"]
			default: "present"
		}

		vserver: {
			description: [
				"The name of the vserver to use.",
			]
			required: true
		}

		domains: description: [
			"List of DNS domains such as 'sales.bar.com'. The first domain is the one that the Vserver belongs to.",
		]

		nameservers: description: [
			"List of IPv4 addresses of name servers such as '123.123.123.123'.",
		]

		skip_validation: {
			type: "bool"
			description: [
				"By default, all nameservers are checked to validate they are available to resolve.",
				"If you DNS servers are not yet installed or momentarily not available, you can set this option to 'true'",
				"to bypass the check for all servers specified in nameservers field.",
			]
			version_added: "2.8"
		}
	}
}
