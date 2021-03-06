package ansible

module: aci_domain_to_vlan_pool: {
	module:            "aci_domain_to_vlan_pool"
	short_description: "Bind Domain to VLAN Pools (infra:RsVlanNs)"
	description: [
		"Bind Domain to VLAN Pools on Cisco ACI fabrics.",
	]
	version_added: "2.5"
	options: {
		domain: {
			description: [
				"Name of the domain being associated with the VLAN Pool.",
			]
			type: "str"
			aliases: ["domain_name", "domain_profile"]
		}
		domain_type: {
			description: [
				"Determines if the Domain is physical (phys) or virtual (vmm).",
			]
			type: "str"
			choices: ["fc", "l2dom", "l3dom", "phys", "vmm"]
		}
		pool: {
			description: [
				"The name of the pool.",
			]
			type: "str"
			aliases: ["pool_name", "vlan_pool"]
		}
		pool_allocation_mode: {
			description: [
				"The method used for allocating VLANs to resources.",
			]
			type:     "str"
			required: true
			choices: ["dynamic", "static"]
			aliases: ["allocation_mode", "mode"]
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
		vm_provider: {
			description: [
				"The VM platform for VMM Domains.",
				"Support for Kubernetes was added in ACI v3.0.",
				"Support for CloudFoundry, OpenShift and Red Hat was added in ACI v3.1.",
			]
			type: "str"
			choices: ["cloudfoundry", "kubernetes", "microsoft", "openshift", "openstack", "redhat", "vmware"]
		}
	}
	extends_documentation_fragment: "aci"
	notes: [
		"The C(domain) and C(vlan_pool) parameters should exist before using this module. The M(aci_domain) and M(aci_vlan_pool) can be used for these.",
	]

	seealso: [{
		module: "aci_domain"
	}, {
		module: "aci_vlan_pool"
	}, {
		name:        "APIC Management Information Model reference"
		description: "More information about the internal APIC class B(infra:RsVlanNs)."
		link:        "https://developer.cisco.com/docs/apic-mim-ref/"
	}]
	author: ["Dag Wieers (@dagwieers)"]
}
