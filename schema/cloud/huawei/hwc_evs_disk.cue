package ansible

module: hwc_evs_disk: {
	module: "hwc_evs_disk"
	description: [
		"block storage management.",
	]
	short_description: "Creates a resource of Evs/Disk in Huawei Cloud"
	version_added:     "2.10"
	author:            "Huawei Inc. (@huaweicloud)"
	requirements: [
		"keystoneauth1 >= 3.6.0",
	]
	options: {
		state: {
			description: [
				"Whether the given object should exist in Huaweicloud Cloud.",
			]
			type: "str"
			choices: ["present", "absent"]
			default: "present"
		}
		timeouts: {
			description: [
				"The timeouts for each operations.",
			]
			type: "dict"
			suboptions: {
				create: {
					description: [
						"The timeouts for create operation.",
					]
					type:    "str"
					default: "30m"
				}
				update: {
					description: [
						"The timeouts for update operation.",
					]
					type:    "str"
					default: "30m"
				}
				delete: {
					description: [
						"The timeouts for delete operation.",
					]
					type:    "str"
					default: "30m"
				}
			}
		}
		availability_zone: {
			description: [
				"Specifies the AZ where you want to create the disk.",
			]
			type:     "str"
			required: true
		}
		name: {
			description: [
				"Specifies the disk name. The value can contain a maximum of 255 bytes.",
			]

			type:     "str"
			required: true
		}
		volume_type: {
			description: [
				"Specifies the disk type. Currently, the value can be SSD, SAS, or SATA.",
				"SSD specifies the ultra-high I/O disk type.",
				"SAS specifies the high I/O disk type.",
				"SATA specifies the common I/O disk type.",
				"If the specified disk type is not available in the AZ, the disk will fail to create. If the EVS disk is created from a snapshot, the volume_type field must be the same as that of the snapshot's source disk.",
			]

			type:     "str"
			required: true
		}
		backup_id: {
			description: [
				"Specifies the ID of the backup that can be used to create a disk. This parameter is mandatory when you use a backup to create the disk.",
			]

			type:     "str"
			required: false
		}
		description: {
			description: [
				"Specifies the disk description. The value can contain a maximum of 255 bytes.",
			]

			type:     "str"
			required: false
		}
		enable_full_clone: {
			description: [
				"If the disk is created from a snapshot and linked cloning needs to be used, set this parameter to True.",
			]

			type:     "bool"
			required: false
		}
		enable_scsi: {
			description: [
				"If this parameter is set to True, the disk device type will be SCSI, which allows ECS OSs to directly access underlying storage media. SCSI reservation command is supported. If this parameter is set to False, the disk device type will be VBD, which supports only simple SCSI read/write commands.",
				"If parameter enable_share is set to True and this parameter is not specified, shared SCSI disks are created. SCSI EVS disks cannot be created from backups, which means that this parameter cannot be True if backup_id has been specified.",
			]

			type:     "bool"
			required: false
		}
		enable_share: {
			description: [
				"Specifies whether the disk is shareable. The default value is False.",
			]

			type:     "bool"
			required: false
		}
		encryption_id: {
			description: [
				"Specifies the encryption ID. The length of it fixes at 36 bytes.",
			]
			type:     "str"
			required: false
		}
		enterprise_project_id: {
			description: [
				"Specifies the enterprise project ID. This ID is associated with the disk during the disk creation. If it is not specified, the disk is bound to the default enterprise project.",
			]

			type:     "str"
			required: false
		}
		image_id: {
			description: [
				"Specifies the image ID. If this parameter is specified, the disk is created from an image. BMS system disks cannot be created from BMS images.",
			]

			type:     "str"
			required: false
		}
		size: {
			description: [
				"Specifies the disk size, in GB. Its values are as follows, System disk 1 GB to 1024 GB, Data disk 10 GB to 32768 GB. This parameter is mandatory when you create an empty disk or use an image or a snapshot to create a disk. If you use an image or a snapshot to create a disk, the disk size must be greater than or equal to the image or snapshot size. This parameter is optional when you use a backup to create a disk. If this parameter is not specified, the disk size is equal to the backup size.",
			]

			type:     "int"
			required: false
		}
		snapshot_id: {
			description: [
				"Specifies the snapshot ID. If this parameter is specified, the disk is created from a snapshot.",
			]

			type:     "str"
			required: false
		}
	}
	extends_documentation_fragment: "hwc"
}
