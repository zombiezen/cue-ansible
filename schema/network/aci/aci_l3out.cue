package ansible

module: aci_l3out: {
	module:            "aci_l3out"
	short_description: "Manage Layer 3 Outside (L3Out) objects (l3ext:Out)"
	description: [
		"Manage Layer 3 Outside (L3Out) on Cisco ACI fabrics.",
	]
	version_added: "2.6"
	options: {
		tenant: {
			description: [
				"Name of an existing tenant.",
			]
			type:     "str"
			required: true
			aliases: ["tenant_name"]
		}
		l3out: {
			description: [
				"Name of L3Out being created.",
			]
			type:     "str"
			required: true
			aliases: ["l3out_name", "name"]
		}
		vrf: {
			description: [
				"Name of the VRF being associated with the L3Out.",
			]
			type:     "str"
			required: true
			aliases: ["vrf_name"]
		}
		domain: {
			description: [
				"Name of the external L3 domain being associated with the L3Out.",
			]
			type:     "str"
			required: true
			aliases: ["ext_routed_domain_name", "routed_domain"]
		}
		dscp: {
			description: [
				"The target Differentiated Service (DSCP) value.",
				"The APIC defaults to C(unspecified) when unset during creation.",
			]
			type: "str"
			choices: ["AF11", "AF12", "AF13", "AF21", "AF22", "AF23", "AF31", "AF32", "AF33", "AF41", "AF42", "AF43", "CS0", "CS1", "CS2", "CS3", "CS4", "CS5", "CS6", "CS7", "EF", "VA", "unspecified"]
			aliases: ["target"]
		}
		route_control: {
			description: [
				"Route Control enforcement direction. The only allowed values are export or import,export.",
			]
			type: "list"
			choices: ["export", "import"]
			aliases: ["route_control_enforcement"]
		}
		l3protocol: {
			description: [
				"Routing protocol for the L3Out",
			]
			type: "list"
			choices: ["bgp", "eigrp", "ospf", "pim", "static"]
		}
		asn: {
			description: [
				"The AS number for the L3Out.",
				"Only applicable when using 'eigrp' as the l3protocol",
			]
			type: "int"
			aliases: ["as_number"]
			version_added: "2.8"
		}
		description: {
			description: [
				"Description for the L3Out.",
			]
			type: "str"
			aliases: ["descr"]
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
		"The C(tenant) and C(domain) and C(vrf) used must exist before using this module in your playbook. The M(aci_tenant) and M(aci_domain) and M(aci_vrf) modules can be used for this.",
	]

	seealso: [{
		module: "aci_tenant"
	}, {
		module: "aci_domain"
	}, {
		module: "aci_vrf"
	}, {
		name:        "APIC Management Information Model reference"
		description: "More information about the internal APIC class B(l3ext:Out)."
		link:        "https://developer.cisco.com/docs/apic-mim-ref/"
	}]
	author: ["Rostyslav Davydenko (@rost-d)"]
}
