package ansible

module: netapp_e_storagepool: {
	module:            "netapp_e_storagepool"
	short_description: "NetApp E-Series manage volume groups and disk pools"
	description:       "Create or remove volume groups and disk pools for NetApp E-series storage arrays."
	version_added:     "2.2"
	author: [
		"Kevin Hulquest (@hulquest)",
		"Nathan Swartz (@ndswartz)",
	]
	extends_documentation_fragment: [
		"netapp.eseries",
	]
	options: {
		state: {
			description: [
				"Whether the specified storage pool should exist or not.",
				"Note that removing a storage pool currently requires the removal of all defined volumes first.",
			]
			required: true
			choices: ["present", "absent"]
		}
		name: {
			description: [
				"The name of the storage pool to manage",
			]
			required: true
		}
		criteria_drive_count: {
			description: [
				"The number of disks to use for building the storage pool.",
				"When I(state==\"present\") then I(criteria_drive_count) or I(criteria_min_usable_capacity) must be specified.",
				"The pool will be expanded if this number exceeds the number of disks already in place (See expansion note below)",
			]
			required: false
			type:     "int"
		}
		criteria_min_usable_capacity: {
			description: [
				"The minimum size of the storage pool (in size_unit).",
				"When I(state==\"present\") then I(criteria_drive_count) or I(criteria_min_usable_capacity) must be specified.",
				"The pool will be expanded if this value exceeds its current size. (See expansion note below)",
			]
			required: false
			type:     "float"
		}
		criteria_drive_type: {
			description: [
				"The type of disk (hdd or ssd) to use when searching for candidates to use.",
				"When not specified each drive type will be evaluated until successful drive candidates are found starting with the most prevalent drive type.",
			]

			required: false
			choices: ["hdd", "ssd"]
		}
		criteria_size_unit: {
			description: [
				"The unit used to interpret size parameters",
			]
			choices: ["bytes", "b", "kb", "mb", "gb", "tb", "pb", "eb", "zb", "yb"]
			default: "gb"
		}
		criteria_drive_min_size: description: [
			"The minimum individual drive size (in size_unit) to consider when choosing drives for the storage pool.",
		]
		criteria_drive_interface_type: {
			description: [
				"The interface type to use when selecting drives for the storage pool",
				"If not provided then all interface types will be considered.",
			]
			choices: ["sas", "sas4k", "fibre", "fibre520b", "scsi", "sata", "pata"]
			required: false
		}
		criteria_drive_require_da: {
			description: [
				"Ensures the storage pool will be created with only data assurance (DA) capable drives.",
				"Only available for new storage pools; existing storage pools cannot be converted.",
			]
			default:       false
			type:          "bool"
			version_added: "2.9"
		}
		criteria_drive_require_fde: {
			description: [
				"Whether full disk encryption ability is required for drives to be added to the storage pool",
			]
			default: false
			type:    "bool"
		}
		raid_level: {
			description: [
				"The RAID level of the storage pool to be created.",
				"Required only when I(state==\"present\").",
				"When I(raid_level==\"raidDiskPool\") then I(criteria_drive_count >= 10 or criteria_drive_count >= 11) is required depending on the storage array specifications.",
				"When I(raid_level==\"raid0\") then I(1<=criteria_drive_count) is required.",
				"When I(raid_level==\"raid1\") then I(2<=criteria_drive_count) is required.",
				"When I(raid_level==\"raid3\") then I(3<=criteria_drive_count<=30) is required.",
				"When I(raid_level==\"raid5\") then I(3<=criteria_drive_count<=30) is required.",
				"When I(raid_level==\"raid6\") then I(5<=criteria_drive_count<=30) is required.",
				"Note that raidAll will be treated as raidDiskPool and raid3 as raid5.",
			]
			required: false
			choices: ["raidAll", "raid0", "raid1", "raid3", "raid5", "raid6", "raidDiskPool"]
			default: "raidDiskPool"
		}
		secure_pool: {
			description: [
				"Enables security at rest feature on the storage pool.",
				"Will only work if all drives in the pool are security capable (FDE, FIPS, or mix)",
				"Warning, once security is enabled it is impossible to disable without erasing the drives.",
			]
			required: false
			type:     "bool"
		}
		reserve_drive_count: {
			description: [
				"Set the number of drives reserved by the storage pool for reconstruction operations.",
				"Only valid on raid disk pools.",
			]
			required: false
		}
		remove_volumes: {
			description: [
				"Prior to removing a storage pool, delete all volumes in the pool.",
			]
			default: true
		}
		erase_secured_drives: {
			description: [
				"If I(state==\"absent\") then all storage pool drives will be erase",
				"If I(state==\"present\") then delete all available storage array drives that have security enabled.",
			]
			default: true
			type:    "bool"
		}
	}
	notes: [
		"The expansion operations are non-blocking due to the time consuming nature of expanding volume groups",
		"Traditional volume groups (raid0, raid1, raid5, raid6) are performed in steps dictated by the storage array. Each required step will be attempted until the request fails which is likely because of the required expansion time.",
		"raidUnsupported will be treated as raid0, raidAll as raidDiskPool and raid3 as raid5.",
		"Tray loss protection and drawer loss protection will be chosen if at all possible.",
	]
}
