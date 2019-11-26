package ansible

module: cs_facts: {
	module:            "cs_facts"
	short_description: "Gather facts on instances of Apache CloudStack based clouds."
	description: [
		"This module fetches data from the metadata API in CloudStack. The module must be called from within the instance itself.",
	]
	version_added: "2.0"
	author:        "René Moser (@resmo)"
	options: {
		filter: {
			description: ["Filter for a specific fact."]
			type: "str"
			choices: [
				"cloudstack_service_offering",
				"cloudstack_availability_zone",
				"cloudstack_public_hostname",
				"cloudstack_public_ipv4",
				"cloudstack_local_hostname",
				"cloudstack_local_ipv4",
				"cloudstack_instance_id",
				"cloudstack_user_data",
			]
		}
		meta_data_host: {
			description: [
				"Host or IP of the meta data API service.",
				"If not set, determination by parsing the dhcp lease file.",
			]
			type:          "str"
			version_added: "2.4"
		}
	}
	requirements: ["yaml"]
}
