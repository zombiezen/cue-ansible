package ansible

module: netapp_e_flashcache: {
	module:            "netapp_e_flashcache"
	author:            "Kevin Hulquest (@hulquest)"
	version_added:     "2.2"
	short_description: "NetApp E-Series manage SSD caches"
	description: [
		"Create or remove SSD caches on a NetApp E-Series storage array.",
	]
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
			type: "bool"
		}
		ssid: {
			required: true
			description: [
				"The ID of the array to manage (as configured on the web services proxy).",
			]
		}
		state: {
			required: true
			description: [
				"Whether the specified SSD cache should exist or not.",
			]
			choices: ["present", "absent"]
			default: "present"
		}
		name: {
			required: true
			description: [
				"The name of the SSD cache to manage",
			]
		}
		io_type: {
			description: [
				"The type of workload to optimize the cache for.",
			]
			choices: ["filesystem", "database", "media"]
			default: "filesystem"
		}
		disk_count: description: [
			"The minimum number of disks to use for building the cache. The cache will be expanded if this number exceeds the number of disks already in place",
		]
		size_unit: {
			description: [
				"The unit to be applied to size arguments",
			]
			choices: ["bytes", "b", "kb", "mb", "gb", "tb", "pb", "eb", "zb", "yb"]
			default: "gb"
		}
		cache_size_min: description: ["The minimum size (in size_units) of the ssd cache. The cache will be expanded if this exceeds the current size of the cache."]
	}
}
