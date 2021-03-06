package ansible

module: vmware_host_dns_facts: {
	module: "vmware_host_dns_facts"
	deprecated: {
		removed_in:  "2.13"
		why:         "Deprecated in favour of C(_info) module."
		alternative: "Use M(vmware_host_dns_info) instead."
	}
	short_description: "Gathers facts about an ESXi host's DNS configuration information"
	description: [
		"This module can be used to gather facts about an ESXi host's DNS configuration information when ESXi hostname or Cluster name is given.",
		"All parameters and VMware object names are case sensitive.",
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
				"Name of the cluster from which the ESXi host belong to.",
				"If C(esxi_hostname) is not given, this parameter is required.",
			]
			type: "str"
		}
		esxi_hostname: {
			description: [
				"ESXi hostname to gather facts from.",
				"If C(cluster_name) is not given, this parameter is required.",
			]
			type: "str"
		}
	}
	extends_documentation_fragment: "vmware.documentation"
}
