package ansible

module: aci_domain: {
	module:            "aci_domain"
	short_description: "Manage physical, virtual, bridged, routed or FC domain profiles (phys:DomP, vmm:DomP, l2ext:DomP, l3ext:DomP, fc:DomP)"
	description: [
		"Manage physical, virtual, bridged, routed or FC domain profiles on Cisco ACI fabrics.",
	]
	version_added: "2.5"
	options: {
		domain: {
			description: [
				"Name of the physical, virtual, bridged routed or FC domain profile.",
			]
			type: "str"
			aliases: ["domain_name", "domain_profile", "name"]
		}
		domain_type: {
			description: [
				"The type of domain profile.",
				"C(fc): The FC domain profile is a policy pertaining to single FC Management domain",
				"C(l2dom): The external bridged domain profile is a policy for managing L2 bridged infrastructure bridged outside the fabric.",
				"C(l3dom): The external routed domain profile is a policy for managing L3 routed infrastructure outside the fabric.",
				"C(phys): The physical domain profile stores the physical resources and encap resources that should be used for EPGs associated with this domain.",
				"C(vmm): The VMM domain profile is a policy for grouping VM controllers with similar networking policy requirements.",
			]
			type: "str"
			choices: ["fc", "l2dom", "l3dom", "phys", "vmm"]
			aliases: ["type"]
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
		encap_mode: {
			description: [
				"The layer 2 encapsulation protocol to use with the virtual switch.",
			]
			type: "str"
			choices: ["unknown", "vlan", "vxlan"]
		}
		multicast_address: {
			description: [
				"The multicast IP address to use for the virtual switch.",
			]
			type: "str"
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
		vswitch: {
			description: [
				"The virtual switch to use for vmm domains.",
				"The APIC defaults to C(default) when unset during creation.",
			]
			type: "str"
			choices: ["avs", "default", "dvs", "unknown"]
		}
	}
	extends_documentation_fragment: "aci"
	seealso: [{
		module: "aci_aep_to_domain"
	}, {
		module: "aci_domain_to_encap_pool"
	}, {
		module: "aci_domain_to_vlan_pool"
	}, {
		name:        "APIC Management Information Model reference"
		description: "More information about the internal APIC classes B(phys:DomP), B(vmm:DomP), B(l2ext:DomP), B(l3ext:DomP) and B(fc:DomP)"

		link: "https://developer.cisco.com/docs/apic-mim-ref/"
	}]
	author: ["Dag Wieers (@dagwieers)"]
}
