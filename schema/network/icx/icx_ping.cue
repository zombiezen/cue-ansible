package ansible

module: icx_ping: {
	module:            "icx_ping"
	version_added:     "2.9"
	author:            "Ruckus Wireless (@Commscope)"
	short_description: "Tests reachability using ping from Ruckus ICX 7000 series switches"
	description: [
		"Tests reachability using ping from switch to a remote destination.",
	]
	notes: [
		"Tested against ICX 10.1",
	]
	options: {
		count: {
			description: [
				"Number of packets to send. Default is 1.",
			]
			type: "int"
		}
		dest: {
			description: [
				"ip-addr | host-name | vrf vrf-name | ipv6 [ ipv6-addr | host-name | vrf vrf-name]  (resolvable by switch) of the remote node.",
			]
			required: true
			type:     "str"
		}
		timeout: {
			description: [
				"Specifies the time, in milliseconds for which the device waits for a reply from the pinged device. The value can range from 1 to 4294967296. The default is 5000 (5 seconds).",
			]

			type: "int"
		}
		ttl: {
			description: [
				"Specifies the time to live as a maximum number of hops. The value can range from 1 to 255. The default is 64.",
			]
			type: "int"
		}
		size: {
			description: [
				"Specifies the size of the ICMP data portion of the packet, in bytes. This is the payload and does not include the header. The value can range from 0 to 10000. The default is 16..",
			]

			type: "int"
		}
		source: {
			description: [
				"IP address to be used as the origin of the ping packets.",
			]
			type: "str"
		}
		vrf: {
			description: [
				"Specifies the Virtual Routing and Forwarding (VRF) instance of the device to be pinged.",
			]
			type: "str"
		}
		state: {
			description: [
				"Determines if the expected result is success or fail.",
			]
			type: "str"
			choices: ["absent", "present"]
			default: "present"
		}
	}
}
