package ansible

module: aci_filter: {
	module:            "aci_filter"
	short_description: "Manages top level filter objects (vz:Filter)"
	description: [
		"Manages top level filter objects on Cisco ACI fabrics.",
		"This modules does not manage filter entries, see M(aci_filter_entry) for this functionality.",
	]
	version_added: "2.4"
	options: {
		filter: {
			description: [
				"The name of the filter.",
			]
			type:     "str"
			required: true
			aliases: ["filter_name", "name"]
		}
		description: {
			description: [
				"Description for the filter.",
			]
			type: "str"
			aliases: ["descr"]
		}
		tenant: {
			description: [
				"The name of the tenant.",
			]
			type:     "str"
			required: true
			aliases: ["tenant_name"]
		}
		state: {
			description: [
				"Use C(present) or C(absent) for adding or removing.",
				"Use C(query) for listing an object or multiple objects.",
			]
			type: "str"
			choices: ["absent", "present", "query"]
			default: "present"
		}
	}
	extends_documentation_fragment: "aci"
	notes: [
		"The C(tenant) used must exist before using this module in your playbook. The M(aci_tenant) module can be used for this.",
	]

	seealso: [{
		module: "aci_tenant"
	}, {
		name:        "APIC Management Information Model reference"
		description: "More information about the internal APIC class B(vz:Filter)."
		link:        "https://developer.cisco.com/docs/apic-mim-ref/"
	}]
	author: ["Dag Wieers (@dagwieers)"]
}
