package ansible

module: na_ontap_qos_policy_group: {
	module:            "na_ontap_qos_policy_group"
	short_description: "NetApp ONTAP manage policy group in Quality of Service."
	extends_documentation_fragment: [
		"netapp.na_ontap",
	]
	version_added: "2.8"
	author:        "NetApp Ansible Team (@carchi8py) <ng-ansibleteam@netapp.com>"

	description: [
		"Create, destroy, modify, or rename QoS policy group on NetApp ONTAP.",
	]

	options: {
		state: {
			choices: ["present", "absent"]
			description: [
				"Whether the specified policy group should exist or not.",
			]
			default: "present"
		}

		name: description: [
			"The name of the policy group to manage.",
		]

		vserver: description: [
			"Name of the vserver to use.",
		]

		from_name: description: [
			"Name of the existing policy group to be renamed to name.",
		]

		max_throughput: description: [
			"Maximum throughput defined by this policy.",
		]

		min_throughput: description: [
			"Minimum throughput defined by this policy.",
		]

		force: {
			type:    "bool"
			default: false
			description: ["Setting to 'true' forces the deletion of the workloads associated with the policy group along with the policy group."]
		}
	}
}
