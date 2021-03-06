package ansible

module: zpool_facts: {
	module:            "zpool_facts"
	short_description: "Gather facts about ZFS pools."
	description: [
		"Gather facts from ZFS pool properties.",
	]
	version_added: "2.3"
	author:        "Adam Števko (@xen0l)"
	options: {
		name: {
			description: ["ZFS pool name."]
			aliases: ["pool", "zpool"]
			required: false
		}
		parsable: {
			description: [
				"Specifies if property values should be displayed in machine friendly format.",
			]

			type:     "bool"
			default:  false
			required: false
		}
		properties: {
			description: [
				"Specifies which dataset properties should be queried in comma-separated format. For more information about dataset properties, check zpool(1M) man page.",
			]

			aliases: ["props"]
			default:  "all"
			required: false
		}
	}
}
