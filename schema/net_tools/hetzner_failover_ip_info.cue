package ansible

module: hetzner_failover_ip_info: {
	module:            "hetzner_failover_ip_info"
	version_added:     "2.9"
	short_description: "Retrieve information on Hetzner's failover IPs"
	author: [
		"Felix Fontein (@felixfontein)",
	]
	description: [
		"Retrieve information on Hetzner's failover IPs.",
	]
	seealso: [{
		name:        "Failover IP documentation"
		description: "Hetzner's documentation on failover IPs."
		link:        "https://wiki.hetzner.de/index.php/Failover/en"
	}, {
		module:      "hetzner_failover_ip"
		description: "Manage failover IPs."
	}]
	extends_documentation_fragment: [
		"hetzner",
	]
	options: failover_ip: {
		description: "The failover IP address."
		type:        "str"
		required:    true
	}
}
