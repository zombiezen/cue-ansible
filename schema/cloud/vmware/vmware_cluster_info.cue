package ansible

module: vmware_cluster_info: {
	module:            "vmware_cluster_info"
	short_description: "Gather info about clusters available in given vCenter"
	description: [
		"This module can be used to gather information about clusters in VMWare infrastructure.",
		"All values and VMware object names are case sensitive.",
		"This module was called C(vmware_cluster_facts) before Ansible 2.9. The usage did not change.",
	]
	version_added: "2.6"
	author: [
		"Abhijeet Kasurde (@Akasurde)",
	]
	notes: [
		"Tested on vSphere 6.5, 6.7",
	]
	requirements: [
		"python >= 2.6",
		"PyVmomi",
	]
	options: {
		datacenter: {
			description: [
				"Datacenter to search for cluster/s.",
				"This parameter is required, if C(cluster_name) is not supplied.",
			]
			required: false
			type:     "str"
		}
		cluster_name: {
			description: [
				"Name of the cluster.",
				"If set, information of this cluster will be returned.",
				"This parameter is required, if C(datacenter) is not supplied.",
			]
			required: false
			type:     "str"
		}
		show_tag: {
			description: [
				"Tags related to cluster are shown if set to C(True).",
			]
			default:       false
			type:          "bool"
			version_added: 2.9
		}
	}
	extends_documentation_fragment: "vmware.documentation"
}
