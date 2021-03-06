package ansible

module: na_ontap_nvme_subsystem: {
	author: "NetApp Ansible Team (@carchi8py) <ng-ansibleteam@netapp.com>"
	description: [
		"Create/Delete NVME subsystem",
		"Associate(modify) host/map to NVME subsystem",
		"NVMe service should be existing in the data vserver with NVMe protocol as a pre-requisite",
	]
	extends_documentation_fragment: [
		"netapp.na_ontap",
	]
	module: "na_ontap_nvme_subsystem"
	options: {
		state: {
			choices: ["present", "absent"]
			description: [
				"Whether the specified subsystem should exist or not.",
			]
			default: "present"
		}
		vserver: {
			description: [
				"Name of the vserver to use.",
			]
			required: true
		}
		subsystem: {
			description: [
				"Specifies the subsystem",
			]
			required: true
		}
		ostype: {
			description: [
				"Specifies the ostype for initiators",
			]
			choices: ["windows", "linux", "vmware", "xen", "hyper_v"]
		}
		skip_host_check: {
			description: [
				"Skip host check",
				"Required to delete an NVMe Subsystem with attached NVMe namespaces",
			]
			default: false
			type:    "bool"
		}
		skip_mapped_check: {
			description: [
				"Skip mapped namespace check",
				"Required to delete an NVMe Subsystem with attached NVMe namespaces",
			]
			default: false
			type:    "bool"
		}
		hosts: {
			description: [
				"List of host NQNs (NVMe Qualification Name) associated to the controller.",
			]
			type: "list"
		}
		paths: {
			description: [
				"List of Namespace paths to be associated with the subsystem.",
			]
			type: "list"
		}
	}
	short_description: "NetApp ONTAP Manage NVME Subsystem"
	version_added:     "2.8"
}
