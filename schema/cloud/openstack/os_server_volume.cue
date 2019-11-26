package ansible

module: os_server_volume: {
	module:                         "os_server_volume"
	short_description:              "Attach/Detach Volumes from OpenStack VM's"
	extends_documentation_fragment: "openstack"
	version_added:                  "2.0"
	author:                         "Monty Taylor (@emonty)"
	description: [
		"Attach or Detach volumes from OpenStack VM's",
	]
	options: {
		state: {
			description: [
				"Should the resource be present or absent.",
			]
			choices: ["present", "absent"]
			default:  "present"
			required: false
		}
		server: {
			description: [
				"Name or ID of server you want to attach a volume to",
			]
			required: true
		}
		volume: {
			description: [
				"Name or id of volume you want to attach to a server",
			]
			required: true
		}
		device: description: [
			"Device you want to attach. Defaults to auto finding a device name.",
		]
		availability_zone: description: [
			"Ignored. Present for backwards compatibility",
		]
	}
	requirements: [
		"python >= 2.7",
		"openstacksdk",
	]
}
