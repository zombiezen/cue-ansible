package ansible

module: bigip_configsync_action: {
	module:            "bigip_configsync_action"
	short_description: "Perform different actions related to config-sync"
	description: [
		"Allows one to run different config-sync actions. These actions allow you to manually sync your configuration across multiple BIG-IPs when those devices are in an HA pair.",
	]

	version_added: 2.4
	options: {
		device_group: {
			description: [
				"The device group that you want to perform config-sync actions on.",
			]
			type:     "str"
			required: true
		}
		sync_device_to_group: {
			description: [
				"Specifies that the system synchronizes configuration data from this device to other members of the device group. In this case, the device will do a \"push\" to all the other devices in the group. This option is mutually exclusive with the C(sync_group_to_device) option.",
			]

			type: "bool"
		}
		sync_most_recent_to_device: {
			description: [
				"Specifies that the system synchronizes configuration data from the device with the most recent configuration. In this case, the device will do a \"pull\" from the most recently updated device. This option is mutually exclusive with the C(sync_device_to_group) options.",
			]

			type: "bool"
		}
		overwrite_config: {
			description: [
				"Indicates that the sync operation overwrites the configuration on the target.",
			]

			type:    "bool"
			default: false
		}
	}
	notes: [
		"Requires the objectpath Python package on the host. This is as easy as C(pip install objectpath).",
	]

	extends_documentation_fragment: "f5"
	author: [
		"Tim Rupp (@caphrim007)",
		"Wojciech Wypior (@wojtek0806)",
	]
}
