package ansible

module: bigip_hostname: {
	module:            "bigip_hostname"
	short_description: "Manage the hostname of a BIG-IP"
	description: [
		"Manage the hostname of a BIG-IP.",
	]
	version_added: 2.3
	options: hostname: {
		description: [
			"Hostname of the BIG-IP host.",
		]
		type:     "str"
		required: true
	}
	extends_documentation_fragment: "f5"
	author: [
		"Tim Rupp (@caphrim007)",
		"Matthew Lam (@mryanlam)",
		"Wojciech Wypior (@wojtek0806)",
	]
}
