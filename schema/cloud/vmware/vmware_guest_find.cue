package ansible

module: vmware_guest_find: {
	module:            "vmware_guest_find"
	short_description: "Find the folder path(s) for a virtual machine by name or UUID"
	description: [
		"Find the folder path(s) for a virtual machine by name or UUID",
	]
	version_added: 2.4
	author: [
		"Abhijeet Kasurde (@Akasurde) <akasurde@redhat.com>",
	]
	notes: [
		"Tested on vSphere 6.5",
	]
	requirements: [
		"python >= 2.6",
		"PyVmomi",
	]
	options: {
		name: {
			description: [
				"Name of the VM to work with.",
				"This is required if C(uuid) parameter is not supplied.",
			]
			type: "str"
		}
		uuid: {
			description: [
				"UUID of the instance to manage if known, this is VMware's BIOS UUID by default.",
				"This is required if C(name) parameter is not supplied.",
			]
			type: "str"
		}
		use_instance_uuid: {
			description: [
				"Whether to use the VMware instance UUID rather than the BIOS UUID.",
			]
			default:       false
			type:          "bool"
			version_added: "2.8"
		}
		datacenter: {
			description: [
				"Destination datacenter for the find operation.",
				"Deprecated in 2.5, will be removed in 2.9 release.",
			]
			type: "str"
		}
	}
	extends_documentation_fragment: "vmware.documentation"
}
