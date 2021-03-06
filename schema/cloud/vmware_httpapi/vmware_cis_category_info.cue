package ansible

module: vmware_cis_category_info: {
	module:            "vmware_cis_category_info"
	short_description: "Gathers info about all, or a specified category."
	description: [
		"This module can be used to gather information about a specific category.",
		"This module can also gather facts about all categories.",
		"This module is based on REST API and uses httpapi connection plugin for persistent connection.",
	]
	version_added: "2.10"
	author: [
		"Paul Knight (@n3pjk)",
	]
	notes: [
		"Tested on vSphere 6.7",
	]
	requirements: [
		"python >= 2.6",
	]
	options: {
		category_id: {
			description: [
				"The object id of the category.",
				"Exclusive of category_name and used_by_*.",
			]
			required: false
			type:     "str"
		}
		category_name: {
			description: [
				"The name of the category.",
				"Exclusive of category_id and used_by_*.",
			]
			required: false
			type:     "str"
		}
		used_by_id: {
			description: [
				"The id of the entity to list applied categories.",
				"Exclusive of other used_by_* and category_*.",
			]
			type: "str"
		}
		used_by_name: {
			description: [
				"The name of the entity to list applied categories, whose type is specified in used_by_type.",
				"Exclusive of other used_by_id and category_*.",
			]
			type: "str"
		}
		used_by_type: {
			description: [
				"The type of the entity to list applied categories, whose name is specified in used_by_name.",
				"Exclusive of other used_by_id and category_*.",
			]
			choices: [
				"cluster",
				"content_library",
				"content_type",
				"datacenter",
				"datastore",
				"folder",
				"host",
				"local_library",
				"network",
				"resource_pool",
				"subscribed_library",
				"tag",
				"vm",
			]
			type: "str"
		}
	}
	extends_documentation_fragment: "VmwareRestModule.documentation"
}
