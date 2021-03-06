package ansible

module: vmware_dvswitch_nioc: {
	module:            "vmware_dvswitch_nioc"
	short_description: "Manage distributed switch Network IO Control"
	description: [
		"This module can be used to manage distributed switch Network IO Control configurations.",
	]
	version_added: "2.9"
	author: [
		"Joseph Andreatta (@vmwjoseph)",
	]
	notes: [
		"Tested on vSphere 6.7",
	]
	requirements: [
		"python >= 2.6",
		"PyVmomi",
	]
	options: {
		switch: {
			description: [
				"The name of the distributed switch.",
			]
			required: true
			aliases: ["dvswitch"]
			type: "str"
		}
		version: {
			description: [
				"Network IO control version.",
			]
			choices: [
				"version2",
				"version3",
			]
			required: false
			type:     "str"
		}
		state: {
			description: [
				"Enable or disable NIOC on the distributed switch.",
			]
			default: "present"
			choices: ["present", "absent"]
			required: false
			type:     "str"
		}
		resources: {
			description: [
				"List of dicts containing { name: Resource name is one of the following: \"faultTolerance\", \"hbr\", \"iSCSI\", \"management\", \"nfs\", \"vdp\", \"virtualMachine\", \"vmotion\", \"vsan\" limit: The maximum allowed usage for a traffic class belonging to this resource pool per host physical NIC. reservation: (Ignored if NIOC version is set to version2) Amount of bandwidth resource that is guaranteed available to the host infrastructure traffic class. If the utilization is less than the reservation, the extra bandwidth is used for other host infrastructure traffic class types. Reservation is not allowed to exceed the value of limit, if limit is set. Unit is Mbits/sec. shares_level: The allocation level (\"low\", \"normal\", \"high\", \"custom\"). The level is a simplified view of shares. Levels map to a pre-determined set of numeric values for shares. shares: Ignored unless shares_level is \"custom\".  The number of shares allocated. reservation: Ignored unless version is \"version3\". Amount of bandwidth resource that is guaranteed available to the host infrastructure traffic class. }",
			]

			required: false
			type:     "list"
		}
	}
	extends_documentation_fragment: "vmware.documentation"
}
