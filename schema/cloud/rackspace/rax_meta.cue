package ansible

module: rax_meta: {
	module:            "rax_meta"
	short_description: "Manipulate metadata for Rackspace Cloud Servers"
	description: [
		"Manipulate metadata for Rackspace Cloud Servers",
	]
	version_added: 1.7
	options: {
		address: description: [
			"Server IP address to modify metadata for, will match any IP assigned to the server",
		]

		id: description: [
			"Server ID to modify metadata for",
		]
		name: description: [
			"Server name to modify metadata for",
		]
		meta: description: [
			"A hash of metadata to associate with the instance",
		]
	}
	author:                         "Matt Martz (@sivel)"
	extends_documentation_fragment: "rackspace.openstack"
}
