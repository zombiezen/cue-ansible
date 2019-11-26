package ansible

module: ping: {
	module:            "ping"
	version_added:     "historical"
	short_description: "Try to connect to host, verify a usable python and return C(pong) on success"
	description: [
		"A trivial test module, this module always returns C(pong) on successful contact. It does not make sense in playbooks, but it is useful from C(/usr/bin/ansible) to verify the ability to login and that a usable Python is configured.",
		"This is NOT ICMP ping, this is just a trivial test module that requires Python on the remote-node.",
		"For Windows targets, use the M(win_ping) module instead.",
		"For Network targets, use the M(net_ping) module instead.",
	]
	options: data: {
		description: [
			"Data to return for the C(ping) return value.",
			"If this parameter is set to C(crash), the module will cause an exception.",
		]
		type:    "str"
		default: "pong"
	}
	seealso: [{
		module: "net_ping"
	}, {
		module: "win_ping"
	}]
	author: [
		"Ansible Core Team",
		"Michael DeHaan",
	]
}
