package ansible

module: vmware_host_acceptance: {
	module:            "vmware_host_acceptance"
	short_description: "Manage the host acceptance level of an ESXi host"
	description: [
		"This module can be used to manage the host acceptance level of an ESXi host.",
		"The host acceptance level controls the acceptance level of each VIB on a ESXi host.",
	]
	version_added: "2.5"
	author: [
		"Abhijeet Kasurde (@Akasurde)",
	]
	notes: [
		"Tested on vSphere 6.5",
	]
	requirements: [
		"python >= 2.6",
		"PyVmomi",
	]
	options: {
		cluster_name: {
			description: [
				"Name of the cluster.",
				"Acceptance level of all ESXi host system in the given cluster will be managed.",
				"If C(esxi_hostname) is not given, this parameter is required.",
			]
			type: "str"
		}
		esxi_hostname: {
			description: [
				"ESXi hostname.",
				"Acceptance level of this ESXi host system will be managed.",
				"If C(cluster_name) is not given, this parameter is required.",
			]
			type: "str"
		}
		state: {
			description: [
				"Set or list acceptance level of the given ESXi host.",
				"If set to C(list), then will return current acceptance level of given host system/s.",
				"If set to C(present), then will set given acceptance level.",
			]
			choices: ["list", "present"]
			required: false
			default:  "list"
			type:     "str"
		}
		acceptance_level: {
			description: [
				"Name of acceptance level.",
				"If set to C(partner), then accept only partner and VMware signed and certified VIBs.",
				"If set to C(vmware_certified), then accept only VIBs that are signed and certified by VMware.",
				"If set to C(vmware_accepted), then accept VIBs that have been accepted by VMware.",
				"If set to C(community), then accept all VIBs, even those that are not signed.",
			]
			choices: ["community", "partner", "vmware_accepted", "vmware_certified"]
			required: false
			type:     "str"
		}
	}
	extends_documentation_fragment: "vmware.documentation"
}
