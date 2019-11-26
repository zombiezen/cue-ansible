package ansible

module: na_ontap_cluster_peer: {
	author: "NetApp Ansible Team (@carchi8py) <ng-ansibleteam@netapp.com>"
	description: [
		"Create/Delete cluster peer relations on ONTAP",
	]
	extends_documentation_fragment: [
		"netapp.na_ontap",
	]
	module: "na_ontap_cluster_peer"
	options: {
		state: {
			choices: ["present", "absent"]
			description: [
				"Whether the specified cluster peer should exist or not.",
			]
			default: "present"
		}
		source_intercluster_lifs: {
			description: [
				"List of intercluster addresses of the source cluster.",
				"Used as peer-addresses in destination cluster.",
				"All these intercluster lifs should belong to the source cluster.",
			]
			version_added: "2.8"
			aliases: [
				"source_intercluster_lif",
			]
		}
		dest_intercluster_lifs: {
			description: [
				"List of intercluster addresses of the destination cluster.",
				"Used as peer-addresses in source cluster.",
				"All these intercluster lifs should belong to the destination cluster.",
			]
			version_added: "2.8"
			aliases: [
				"dest_intercluster_lif",
			]
		}
		passphrase: description: [
			"The arbitrary passphrase that matches the one given to the peer cluster.",
		]
		source_cluster_name: description: [
			"The name of the source cluster name in the peer relation to be deleted.",
		]
		dest_cluster_name: description: [
			"The name of the destination cluster name in the peer relation to be deleted.",
			"Required for delete",
		]
		dest_hostname: {
			description: [
				"Destination cluster IP or hostname which needs to be peered",
				"Required to complete the peering process at destination cluster.",
			]
			required: true
		}
		dest_username: description: [
			"Destination username.",
			"Optional if this is same as source username.",
		]
		dest_password: description: [
			"Destination password.",
			"Optional if this is same as source password.",
		]
	}
	short_description: "NetApp ONTAP Manage Cluster peering"
	version_added:     "2.7"
}
