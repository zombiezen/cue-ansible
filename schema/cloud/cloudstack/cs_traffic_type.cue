package ansible

module: cs_traffic_type: {
	module:            "cs_traffic_type"
	short_description: "Manages traffic types on CloudStack Physical Networks"
	description: [
		"Add, remove, update Traffic Types associated with CloudStack Physical Networks.",
	]
	extends_documentation_fragment: "cloudstack"
	version_added:                  "2.8"
	author: [
		"Patryk Cichy (@PatTheSilent)",
	]
	options: {
		physical_network: {
			description: [
				"the name of the Physical Network",
			]
			required: true
			type:     "str"
		}
		zone: {
			description: [
				"Name of the zone with the physical network.",
				"Default zone will be used if this is empty.",
			]
			type: "str"
		}
		traffic_type: {
			description: [
				"the trafficType to be added to the physical network.",
			]
			required: true
			choices: ["Management", "Guest", "Public", "Storage"]
			type: "str"
		}
		state: {
			description: [
				"State of the traffic type",
			]
			choices: ["present", "absent"]
			default: "present"
			type:    "str"
		}
		hyperv_networklabel: {
			description: [
				"The network name label of the physical device dedicated to this traffic on a HyperV host.",
			]
			type: "str"
		}
		isolation_method: {
			description: [
				"Use if the physical network has multiple isolation types and traffic type is public.",
			]
			choices: ["vlan", "vxlan"]
			type: "str"
		}
		kvm_networklabel: {
			description: [
				"The network name label of the physical device dedicated to this traffic on a KVM host.",
			]
			type: "str"
		}
		ovm3_networklabel: {
			description: [
				"The network name of the physical device dedicated to this traffic on an OVM3 host.",
			]
			type: "str"
		}
		vlan: {
			description: [
				"The VLAN id to be used for Management traffic by VMware host.",
			]
			type: "str"
		}
		vmware_networklabel: {
			description: [
				"The network name label of the physical device dedicated to this traffic on a VMware host.",
			]
			type: "str"
		}
		xen_networklabel: {
			description: [
				"The network name label of the physical device dedicated to this traffic on a XenServer host.",
			]
			type: "str"
		}
		poll_async: {
			description: [
				"Poll async jobs until job has finished.",
			]
			default: true
			type:    "bool"
		}
	}
}
