package ansible

module: vyos_ping: {
	module:            "vyos_ping"
	short_description: "Tests reachability using ping from VyOS network devices"
	description: [
		"Tests reachability using ping from a VyOS device to a remote destination.",
		"Tested against VyOS 1.1.8 (helium)",
		"For a general purpose network module, see the M(net_ping) module.",
		"For Windows targets, use the M(win_ping) module instead.",
		"For targets running Python, use the M(ping) module instead.",
	]
	author: [
		"Nilashish Chakraborty (@NilashishC)",
	]
	version_added: "2.8"
	options: {
		dest: {
			description: [
				"The IP Address or hostname (resolvable by the device) of the remote node.",
			]
			required: true
		}
		count: {
			description: [
				"Number of packets to send to check reachability.",
			]
			type:    "int"
			default: 5
		}
		source: description: [
			"The source interface or IP Address to use while sending the ping packet(s).",
		]
		ttl: {
			description: [
				"The time-to-live value for the ICMP packet(s).",
			]
			type: "int"
		}
		size: {
			description: [
				"Determines the size (in bytes) of the ping packet(s).",
			]
			type: "int"
		}
		interval: {
			description: [
				"Determines the interval (in seconds) between consecutive pings.",
			]
			type: "int"
		}
		state: {
			description: [
				"Determines if the expected result is success or fail.",
			]
			choices: ["absent", "present"]
			default: "present"
		}
	}
	notes: [
		"Tested against VyOS 1.1.8 (helium).",
		"For a general purpose network module, see the M(net_ping) module.",
		"For Windows targets, use the M(win_ping) module instead.",
		"For targets running Python, use the M(ping) module instead.",
		"This module works with connection C(network_cli). See L(the VyOS OS Platform Options,../network/user_guide/platform_vyos.html).",
	]
	extends_documentation_fragment: "vyos"
}
