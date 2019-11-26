package ansible

module: na_ontap_igroup_initiator: {
	module:            "na_ontap_igroup_initiator"
	short_description: "NetApp ONTAP igroup initiator configuration"
	extends_documentation_fragment: [
		"netapp.na_ontap",
	]
	version_added: "2.8"
	author:        "NetApp Ansible Team (@carchi8py) <ng-ansibleteam@netapp.com>"

	description: [
		"Add/Remove initiators from an igroup",
	]

	options: {
		state: {
			description: [
				"Whether the specified initiator should exist or not in an igroup.",
			]
			choices: ["present", "absent"]
			default: "present"
		}

		names: {
			description: [
				"List of initiators to manage.",
			]
			required: true
			aliases: [
				"name",
			]
		}

		initiator_group: {
			description: [
				"Name of the initiator group to which the initiator belongs.",
			]
			required: true
		}

		vserver: {
			description: [
				"The name of the vserver to use.",
			]
			required: true
		}
	}
}
