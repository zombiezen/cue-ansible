package ansible

module: hcloud_volume_info: {
	module: "hcloud_volume_info"

	short_description: "Gather infos about your Hetzner Cloud Volumes."

	version_added: "2.8"
	description: [
		"Gather infos about your Hetzner Cloud Volumes.",
	]

	author: [
		"Lukas Kaemmerling (@LKaemmerling)",
	]

	options: {
		id: {
			description: [
				"The ID of the Volume you want to get.",
			]
			type: "int"
		}
		name: {
			description: [
				"The name of the Volume you want to get.",
			]
			type: "str"
		}
		label_selector: {
			description: [
				"The label selector for the Volume you want to get.",
			]
			type: "str"
		}
	}
	extends_documentation_fragment: "hcloud"
}
