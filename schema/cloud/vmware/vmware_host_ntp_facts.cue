package ansible

module: vmware_host_ntp_facts: {
	module: "vmware_host_ntp_facts"
	deprecated: {
		removed_in:  "2.13"
		why:         "Deprecated in favour of C(_info) module."
		alternative: "Use M(vmware_host_ntp_info) instead."
	}
	short_description: "Gathers facts about NTP configuration on an ESXi host"
	description: [
		"This module can be used to gather facts about NTP configurations on an ESXi host.",
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
				"NTP config facts about each ESXi server will be returned for the given cluster.",
				"If C(esxi_hostname) is not given, this parameter is required.",
			]
			type: "str"
		}
		esxi_hostname: {
			description: [
				"ESXi hostname.",
				"NTP config facts about this ESXi server will be returned.",
				"If C(cluster_name) is not given, this parameter is required.",
			]
			type: "str"
		}
	}
	extends_documentation_fragment: "vmware.documentation"
}
