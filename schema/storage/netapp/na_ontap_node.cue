package ansible

module: na_ontap_node: {
	module:            "na_ontap_node"
	short_description: "NetApp ONTAP Rename a node."
	extends_documentation_fragment: [
		"netapp.na_ontap",
	]
	version_added: "2.7"
	author:        "NetApp Ansible Team (@carchi8py) <ng-ansibleteam@netapp.com>"
	description: [
		"Rename an ONTAP node.",
	]
	options: {
		name: {
			description: [
				"The new name for the node",
			]
			required: true
		}

		from_name: {
			description: [
				"The name of the node to be renamed.  If I(name) already exists, no action will be performed.",
			]
			required: true
		}
	}
}
