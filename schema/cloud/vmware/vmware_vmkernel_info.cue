package ansible

module: vmware_vmkernel_info: {
	module:            "vmware_vmkernel_info"
	short_description: "Gathers VMKernel info about an ESXi host"
	description: [
		"This module can be used to gather VMKernel information about an ESXi host from given ESXi hostname or cluster name.",
	]
	version_added: "2.9"
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
				"VMKernel information about each ESXi server will be returned for the given cluster.",
				"If C(esxi_hostname) is not given, this parameter is required.",
			]
			type: "str"
		}
		esxi_hostname: {
			description: [
				"ESXi hostname.",
				"VMKernel information about this ESXi server will be returned.",
				"If C(cluster_name) is not given, this parameter is required.",
			]
			type: "str"
		}
	}
	extends_documentation_fragment: "vmware.documentation"
}
