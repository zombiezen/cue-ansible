package ansible

module: aws_netapp_cvs_snapshots: {
	module: "aws_netapp_cvs_snapshots"

	short_description: "NetApp AWS Cloud Volumes Service Manage Snapshots."
	extends_documentation_fragment: [
		"netapp.awscvs",
	]
	version_added: "2.9"
	author:        "NetApp Ansible Team (@carchi8py) <ng-ansibleteam@netapp.com>"
	description: [
		"Create, Update, Delete Snapshot on AWS Cloud Volumes Service.",
	]

	options: {
		state: {
			description: [
				"Whether the specified snapshot should exist or not.",
			]
			required: true
			type:     "str"
			choices: ["present", "absent"]
		}

		region: {
			description: [
				"The region to which the snapshot belongs to.",
			]
			required: true
			type:     "str"
		}

		name: {
			description: [
				"Name of the snapshot",
			]
			required: true
			type:     "str"
		}

		fileSystemId: {
			description: [
				"Name or Id of the filesystem.",
				"Required for create operation",
			]
			type: "str"
		}

		from_name: {
			description: [
				"ID or Name of the snapshot to rename.",
				"Required to create an snapshot called 'name' by renaming 'from_name'.",
			]
			type: "str"
		}
	}
}
