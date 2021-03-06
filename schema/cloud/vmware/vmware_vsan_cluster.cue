package ansible

module: vmware_vsan_cluster: {
	module:            "vmware_vsan_cluster"
	short_description: "Configure VSAN clustering on an ESXi host"
	description: [
		"This module can be used to configure VSAN clustering on an ESXi host",
	]
	version_added: 2.0
	author: [
		"Russell Teague (@mtnbikenc)",
	]
	notes: [
		"Tested on vSphere 5.5",
	]
	requirements: [
		"python >= 2.6",
		"PyVmomi",
	]
	options: cluster_uuid: {
		description: [
			"Desired cluster UUID",
		]
		required: false
		type:     "str"
	}
	extends_documentation_fragment: "vmware.documentation"
}
