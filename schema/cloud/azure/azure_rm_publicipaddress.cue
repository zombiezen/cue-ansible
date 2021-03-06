package ansible

module: azure_rm_publicipaddress: {
	module: "azure_rm_publicipaddress"

	version_added: "2.1"

	short_description: "Manage Azure Public IP Addresses"

	description: [
		"Create, update and delete a Public IP address.",
		"Allows setting and updating the address allocation method and domain name label.",
		"Use the M(azure_rm_networkinterface) module to associate a Public IP with a network interface.",
	]

	options: {
		resource_group: {
			description: [
				"Name of resource group with which the Public IP is associated.",
			]
			required: true
		}
		allocation_method: {
			description: [
				"Control whether the assigned Public IP remains permanently assigned to the object.",
				"If not set to C(Static), the IP address my changed anytime an associated virtual machine is power cycled.",
			]
			choices: [
				"dynamic",
				"static",
				"Static",
				"Dynamic",
			]
			default: "dynamic"
		}
		domain_name: {
			description: [
				"The customizable portion of the FQDN assigned to public IP address. This is an explicit setting.",
				"If no value is provided, any existing value will be removed on an existing public IP.",
			]
			aliases: [
				"domain_name_label",
			]
		}
		name: {
			description: [
				"Name of the Public IP.",
			]
			required: true
		}
		state: {
			description: [
				"Assert the state of the Public IP. Use C(present) to create or update a and C(absent) to delete.",
			]
			default: "present"
			choices: [
				"absent",
				"present",
			]
		}
		location: description: [
			"Valid Azure location. Defaults to location of the resource group.",
		]
		sku: {
			description: [
				"The public IP address SKU.",
			]
			choices: [
				"basic",
				"standard",
				"Basic",
				"Standard",
			]
			version_added: "2.6"
		}
		ip_tags: {
			description: [
				"List of IpTag associated with the public IP address.",
				"Each element should contain type:value pair.",
			]
			suboptions: {
				type: description: [
					"Sets the ip_tags type.",
				]
				value: description: [
					"Sets the ip_tags value.",
				]
			}
			version_added: "2.8"
		}
		idle_timeout: {
			description: [
				"Idle timeout in minutes.",
			]
			type:          "int"
			version_added: "2.8"
		}
		version: {
			description: [
				"The public IP address version.",
			]
			choices: [
				"ipv4",
				"ipv6",
			]
			default:       "ipv4"
			version_added: "2.8"
		}
	}

	extends_documentation_fragment: [
		"azure",
		"azure_tags",
	]

	author: [
		"Chris Houseknecht (@chouseknecht)",
		"Matt Davis (@nitzmahone)",
	]
}
