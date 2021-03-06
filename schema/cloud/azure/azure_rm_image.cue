package ansible

module: azure_rm_image: {
	module:            "azure_rm_image"
	version_added:     "2.5"
	short_description: "Manage Azure image"
	description: [
		"Create, delete an image from virtual machine, blob uri, managed disk or snapshot.",
	]
	options: {
		resource_group: {
			description: [
				"Name of resource group.",
			]
			required: true
		}
		name: {
			description: [
				"Name of the image.",
			]
			required: true
		}
		source: {
			description: [
				"OS disk source from the same region.",
				"It can be a virtual machine, OS disk blob URI, managed OS disk, or OS snapshot.",
				"Each type of source except for blob URI can be given as resource id, name or a dict contains C(resource_group), C(name) and C(type).",
				"If source type is blob URI, the source should be the full URI of the blob in string type.",
				"If you specify the I(type) in a dict, acceptable value contains C(disks), C(virtual_machines) and C(snapshots).",
			]
			type:     "raw"
			required: true
		}
		data_disk_sources: {
			description: [
				"List of data disk sources, including unmanaged blob URI, managed disk id or name, or snapshot id or name.",
			]
			type: "list"
		}
		location: description: [
			"Location of the image. Derived from I(resource_group) if not specified.",
		]
		os_type: {
			description: "The OS type of image."
			choices: [
				"Windows",
				"Linux",
			]
		}
		state: {
			description: [
				"Assert the state of the image. Use C(present) to create or update a image and C(absent) to delete an image.",
			]
			default: "present"
			choices: [
				"absent",
				"present",
			]
		}
	}

	extends_documentation_fragment: [
		"azure",
		"azure_tags",
	]

	author: [
		"Yuwei Zhou (@yuwzho)",
	]
}
