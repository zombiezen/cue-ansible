package ansible

module: rax_files: {
	module:            "rax_files"
	short_description: "Manipulate Rackspace Cloud Files Containers"
	description: [
		"Manipulate Rackspace Cloud Files Containers",
	]
	version_added: "1.5"
	options: {
		clear_meta: {
			description: [
				"Optionally clear existing metadata when applying metadata to existing containers. Selecting this option is only appropriate when setting type=meta",
			]

			type:    "bool"
			default: "no"
		}
		container: {
			description: [
				"The container to use for container or metadata operations.",
			]
			required: true
		}
		meta: description: [
			"A hash of items to set as metadata values on a container",
		]
		private: {
			description: [
				"Used to set a container as private, removing it from the CDN.  B(Warning!) Private containers, if previously made public, can have live objects available until the TTL on cached objects expires",
			]

			type: "bool"
		}
		public: {
			description: [
				"Used to set a container as public, available via the Cloud Files CDN",
			]
			type: "bool"
		}
		region: {
			description: [
				"Region to create an instance in",
			]
			default: "DFW"
		}
		state: {
			description: [
				"Indicate desired state of the resource",
			]
			choices: ["present", "absent"]
			default: "present"
		}
		ttl: description: [
			"In seconds, set a container-wide TTL for all objects cached on CDN edge nodes. Setting a TTL is only appropriate for containers that are public",
		]

		type: {
			description: [
				"Type of object to do work on, i.e. metadata object or a container object",
			]
			choices: [
				"file",
				"meta",
			]
			default: "file"
		}
		web_error: description: [
			"Sets an object to be presented as the HTTP error page when accessed by the CDN URL",
		]
		web_index: description: [
			"Sets an object to be presented as the HTTP index page when accessed by the CDN URL",
		]
	}
	author: "Paul Durivage (@angstwad)"
	extends_documentation_fragment: [
		"rackspace",
		"rackspace.openstack",
	]
}
