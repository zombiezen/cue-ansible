package ansible

module: ovirt_host_storage_info: {
	module:            "ovirt_host_storage_info"
	short_description: "Retrieve information about one or more oVirt/RHV HostStorages (applicable only for block storage)"
	author:            "Daniel Erez (@derez)"
	version_added:     "2.4"
	description: [
		"Retrieve information about one or more oVirt/RHV HostStorages (applicable only for block storage).",
		"This module was called C(ovirt_host_storage_facts) before Ansible 2.9, returning C(ansible_facts). Note that the M(ovirt_host_storage_info) module no longer returns C(ansible_facts)!",
	]

	options: {
		host: {
			description: [
				"Host to get device list from.",
			]
			required: true
		}
		iscsi: description: [
			"Dictionary with values for iSCSI storage type:",
			"C(address) - Address of the iSCSI storage server.",
			"C(target) - The target IQN for the storage device.",
			"C(username) - A CHAP user name for logging into a target.",
			"C(password) - A CHAP password for logging into a target.",
		]
		fcp: description: [
			"Dictionary with values for fibre channel storage type:",
			"C(address) - Address of the fibre channel storage server.",
			"C(port) - Port of the fibre channel storage server.",
			"C(lun_id) - LUN id.",
		]
	}
	extends_documentation_fragment: "ovirt_info"
}
