package ansible

module: digital_ocean_block_storage: {
	module:            "digital_ocean_block_storage"
	short_description: "Create/destroy or attach/detach Block Storage volumes in DigitalOcean"
	description: [
		"Create/destroy Block Storage volume in DigitalOcean, or attach/detach Block Storage volume to a droplet.",
	]
	version_added: "2.2"
	options: {
		command: {
			description: [
				"Which operation do you want to perform.",
			]
			choices: ["create", "attach"]
			required: true
		}
		state: {
			description: [
				"Indicate desired state of the target.",
			]
			choices: ["present", "absent"]
			required: true
		}
		block_size: description: [
			"The size of the Block Storage volume in gigabytes. Required when command=create and state=present. If snapshot_id is included, this will be ignored.",
		]
		volume_name: {
			description: [
				"The name of the Block Storage volume.",
			]
			required: true
		}
		description: description: [
			"Description of the Block Storage volume.",
		]
		region: {
			description: [
				"The slug of the region where your Block Storage volume should be located in. If snapshot_id is included, this will be ignored.",
			]
			required: true
		}
		snapshot_id: {
			version_added: "2.5"
			description: [
				"The snapshot id you would like the Block Storage volume created with. If included, region and block_size will be ignored and changed to null.",
			]
		}
		droplet_id: description: [
			"The droplet id you want to operate on. Required when command=attach.",
		]
	}
	extends_documentation_fragment: "digital_ocean.documentation"
	notes: [
		"Two environment variables can be used, DO_API_KEY and DO_API_TOKEN. They both refer to the v2 token.",
		"If snapshot_id is used, region and block_size will be ignored and changed to null.",
	]

	author: ["Harnek Sidhu (@harneksidhu)"]
}
