package ansible

module: os_object: {
	module:                         "os_object"
	short_description:              "Create or Delete objects and containers from OpenStack"
	version_added:                  "2.0"
	author:                         "Monty Taylor (@emonty)"
	extends_documentation_fragment: "openstack"
	description: [
		"Create or Delete objects and containers from OpenStack",
	]
	options: {
		container: {
			description: [
				"The name of the container in which to create the object",
			]
			required: true
		}
		name: {
			description: [
				"Name to be give to the object. If omitted, operations will be on the entire container",
			]

			required: false
		}
		filename: {
			description: [
				"Path to local file to be uploaded.",
			]
			required: false
		}
		container_access: {
			description: [
				"desired container access level.",
			]
			required: false
			choices: ["private", "public"]
			default: "private"
		}
		state: {
			description: [
				"Should the resource be present or absent.",
			]
			choices: ["present", "absent"]
			default: "present"
		}
		availability_zone: {
			description: [
				"Ignored. Present for backwards compatibility",
			]
			required: false
		}
	}
}
