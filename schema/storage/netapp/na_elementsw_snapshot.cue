package ansible

module: na_elementsw_snapshot: {
	module: "na_elementsw_snapshot"

	short_description: "NetApp Element Software Manage Snapshots"
	extends_documentation_fragment: [
		"netapp.solidfire",
	]
	version_added: "2.7"
	author:        "NetApp Ansible Team (@carchi8py) <ng-ansibleteam@netapp.com>"
	description: [
		"Create, Modify or Delete Snapshot on Element OS Cluster.",
	]

	options: {
		name: description: [
			"Name of new snapshot create.",
			"If unspecified, date and time when the snapshot was taken is used.",
		]

		state: {
			description: [
				"Whether the specified snapshot should exist or not.",
			]
			choices: ["present", "absent"]
			default: "present"
		}

		src_volume_id: {
			description: [
				"ID or Name of active volume.",
			]
			required: true
		}

		account_id: {
			description: [
				"Account ID or Name of Parent/Source Volume.",
			]
			required: true
		}

		retention: description: [
			"Retention period for the snapshot.",
			"Format is 'HH:mm:ss'.",
		]

		src_snapshot_id: description: [
			"ID or Name of an existing snapshot.",
			"Required when C(state=present), to modify snapshot properties.",
			"Required when C(state=present), to create snapshot from another snapshot in the volume.",
			"Required when C(state=absent), to delete snapshot.",
		]

		enable_remote_replication: {
			description: [
				"Flag, whether to replicate the snapshot created to a remote replication cluster.",
				"To enable specify 'true' value.",
			]
			type: "bool"
		}

		snap_mirror_label: description: [
			"Label used by SnapMirror software to specify snapshot retention policy on SnapMirror endpoint.",
		]

		expiration_time: description: [
			"The date and time (format ISO 8601 date string) at which this snapshot will expire.",
		]

		password: {
			description: [
				"Element OS access account password",
			]
			aliases: [
				"pass",
			]
		}

		username: {
			description: [
				"Element OS access account user-name",
			]
			aliases: [
				"user",
			]
		}
	}
}
