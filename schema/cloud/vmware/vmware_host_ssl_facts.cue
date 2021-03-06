package ansible

module: vmware_host_ssl_facts: {
	module: "vmware_host_ssl_facts"
	deprecated: {
		removed_in:  "2.13"
		why:         "Deprecated in favour of C(_info) module."
		alternative: "Use M(vmware_host_ssl_info) instead."
	}
	short_description: "Gather facts of ESXi host system about SSL"
	description: [
		"This module can be used to gather facts of the SSL thumbprint information for a host.",
	]
	version_added: 2.7
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
				"SSL thumbprint information about all ESXi host system in the given cluster will be reported.",
				"If C(esxi_hostname) is not given, this parameter is required.",
			]
			type: "str"
		}
		esxi_hostname: {
			description: [
				"ESXi hostname.",
				"SSL thumbprint information of this ESXi host system will be reported.",
				"If C(cluster_name) is not given, this parameter is required.",
			]
			type: "str"
		}
	}
	extends_documentation_fragment: "vmware.documentation"
}
