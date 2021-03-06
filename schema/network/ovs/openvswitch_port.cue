package ansible

module: openvswitch_port: {
	module:            "openvswitch_port"
	version_added:     1.4
	author:            "David Stygstra (@stygstra)"
	short_description: "Manage Open vSwitch ports"
	requirements: ["ovs-vsctl"]
	description: [
		"Manage Open vSwitch ports",
	]
	options: {
		bridge: {
			required: true
			description: [
				"Name of bridge to manage",
			]
		}
		port: {
			required: true
			description: [
				"Name of port to manage on the bridge",
			]
		}
		tag: {
			version_added: 2.2
			description: [
				"VLAN tag for this port. Must be a value between 0 and 4095.",
			]
		}

		state: {
			default: "present"
			choices: ["present", "absent"]
			description: [
				"Whether the port should exist",
			]
		}
		timeout: {
			default: 5
			description: [
				"How long to wait for ovs-vswitchd to respond",
			]
		}
		external_ids: {
			version_added: 2.0
			default: {}
			description: [
				"Dictionary of external_ids applied to a port.",
			]
		}
		set: {
			version_added: 2.0
			description: ["Set a single property on a port."]
		}
	}
}
