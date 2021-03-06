package ansible

module: ipinfoio_facts: {
	module:            "ipinfoio_facts"
	short_description: "Retrieve IP geolocation facts of a host's IP address"
	description: [
		"Gather IP geolocation facts of a host's IP address using ipinfo.io API",
	]
	version_added: "2.3"
	author:        "Aleksei Kostiuk (@akostyuk)"
	options: {
		timeout: {
			description: [
				"HTTP connection timeout in seconds",
			]
			required: false
			default:  10
		}
		http_agent: {
			description: [
				"Set http user agent",
			]
			required: false
			default:  "ansible-ipinfoio-module/0.0.1"
		}
	}
	notes: ["Check http://ipinfo.io/ for more information"]
}
