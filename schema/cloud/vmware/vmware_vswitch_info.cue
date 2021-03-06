package ansible

module: vmware_vswitch_info: {
	module:            "vmware_vswitch_info"
	short_description: "Gathers info about an ESXi host's vswitch configurations"
	description: [
		"This module can be used to gather information about an ESXi host's vswitch configurations when ESXi hostname or Cluster name is given.",
		"The vSphere Client shows the value for the number of ports as elastic from vSphere 5.5 and above.",
		"Other tools like esxcli might show the number of ports as 1536 or 5632.",
		"See U(https://kb.vmware.com/s/article/2064511) for more details.",
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
				"Info about vswitch belonging to every ESXi host systems under this cluster will be returned.",
				"If C(esxi_hostname) is not given, this parameter is required.",
			]
			type: "str"
		}
		esxi_hostname: {
			description: [
				"ESXi hostname to gather information from.",
				"If C(cluster_name) is not given, this parameter is required.",
			]
			type: "str"
		}
	}
	extends_documentation_fragment: "vmware.documentation"
}
