package ansible

module: avi_ipaddrgroup: {
	module: "avi_ipaddrgroup"
	author: "Gaurav Rastogi (@grastogi23) <grastogi@avinetworks.com>"

	short_description: "Module for setup of IpAddrGroup Avi RESTful Object"
	description: [
		"This module is used to configure IpAddrGroup object",
		"more examples at U(https://github.com/avinetworks/devops)",
	]
	requirements: ["avisdk"]
	version_added: "2.4"
	options: {
		state: {
			description: [
				"The state that should be applied on the entity.",
			]
			default: "present"
			choices: ["absent", "present"]
		}
		avi_api_update_method: {
			description: [
				"Default method for object update is HTTP PUT.",
				"Setting to patch will override that behavior to use HTTP PATCH.",
			]
			version_added: "2.5"
			default:       "put"
			choices: ["put", "patch"]
		}
		avi_api_patch_op: {
			description: [
				"Patch operation to use when using avi_api_update_method as patch.",
			]
			version_added: "2.5"
			choices: ["add", "replace", "delete"]
		}
		addrs: description: [
			"Configure ip address(es).",
		]
		apic_epg_name: description: [
			"Populate ip addresses from members of this cisco apic epg.",
		]
		country_codes: description: [
			"Populate the ip address ranges from the geo database for this country.",
		]
		description: description: [
			"User defined description for the object.",
		]
		ip_ports: description: [
			"Configure (ip address, port) tuple(s).",
		]
		marathon_app_name: description: [
			"Populate ip addresses from tasks of this marathon app.",
		]
		marathon_service_port: description: [
			"Task port associated with marathon service port.",
			"If marathon app has multiple service ports, this is required.",
			"Else, the first task port is used.",
		]
		name: {
			description: [
				"Name of the ip address group.",
			]
			required: true
		}
		prefixes: description: [
			"Configure ip address prefix(es).",
		]
		ranges: description: [
			"Configure ip address range(s).",
		]
		tenant_ref: description: [
			"It is a reference to an object of type tenant.",
		]
		url: description: [
			"Avi controller URL of the object.",
		]
		uuid: description: [
			"Uuid of the ip address group.",
		]
	}
	extends_documentation_fragment: ["avi"]
}
