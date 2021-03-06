package ansible

module: netapp_e_snapshot_images: {
	module:            "netapp_e_snapshot_images"
	short_description: "NetApp E-Series create and delete snapshot images"
	description: [
		"Create and delete snapshots images on snapshot groups for NetApp E-series storage arrays.",
		"Only the oldest snapshot image can be deleted so consistency is preserved.",
		"Related: Snapshot volumes are created from snapshot images.",
	]
	version_added: "2.2"
	author:        "Kevin Hulquest (@hulquest)"
	options: {
		api_username: {
			required: true
			description: [
				"The username to authenticate with the SANtricity WebServices Proxy or embedded REST API.",
			]
		}
		api_password: {
			required: true
			description: [
				"The password to authenticate with the SANtricity WebServices Proxy or embedded REST API.",
			]
		}
		api_url: {
			required: true
			description: [
				"The url to the SANtricity WebServices Proxy or embedded REST API.",
			]
		}
		validate_certs: {
			required: false
			default:  true
			description: [
				"Should https certificates be validated?",
			]
		}
		snapshot_group: {
			description: [
				"The name of the snapshot group in which you want to create a snapshot image.",
			]
			required: true
		}
		state: {
			description: [
				"Whether a new snapshot image should be created or oldest be deleted.",
			]
			required: true
			choices: ["create", "remove"]
		}
	}
}
