package ansible

module: podman_volume_info: {
	module: "podman_volume_info"
	author: [
		"Sagi Shnaidman (@sshnaidm)",
	]
	version_added:     "2.10"
	short_description: "Gather info about podman volumes"
	notes: []
	description: [
		"Gather info about podman volumes with podman inspect command.",
	]
	requirements: [
		"Podman installed on host",
	]
	options: {
		name: {
			description: [
				"Name of the volume",
			]
			type: "str"
		}
		executable: {
			description: [
				"Path to C(podman) executable if it is not in the C($PATH) on the machine running C(podman)",
			]

			default: "podman"
			type:    "str"
		}
	}
}
