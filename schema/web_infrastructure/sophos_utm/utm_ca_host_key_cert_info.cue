package ansible

module: utm_ca_host_key_cert_info: {
	module: "utm_ca_host_key_cert_info"

	author: [
		"Stephan Schwarz (@stearz)",
	]

	short_description: "Get info for a ca host_key_cert entry in Sophos UTM"

	description: [
		"Get info for a ca host_key_cert entry in SOPHOS UTM.",
	]

	version_added: "2.8"

	options: name: {
		description: [
			"The name of the object. Will be used to identify the entry",
		]
		required: true
	}

	extends_documentation_fragment: ["utm"]
}
