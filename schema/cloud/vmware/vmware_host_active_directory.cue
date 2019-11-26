package ansible

module: vmware_host_active_directory: {
	module:            "vmware_host_active_directory"
	short_description: "Joins an ESXi host system to an Active Directory domain or leaves it"
	description: [
		"This module can be used to join or leave an ESXi host to or from an Active Directory domain.",
	]
	version_added: 2.8
	author: [
		"Christian Kotte (@ckotte)",
	]
	notes: [
		"Tested on vSphere 6.5",
	]
	requirements: [
		"python >= 2.6",
		"PyVmomi",
	]
	options: {
		ad_domain: {
			description: [
				"AD Domain to join.",
			]
			type: "str"
			aliases: ["domain", "domain_name"]
		}
		ad_user: {
			description: [
				"Username for AD domain join.",
			]
			type: "str"
		}
		ad_password: {
			description: [
				"Password for AD domain join.",
			]
			type: "str"
		}
		ad_state: {
			description: [
				"Whether the ESXi host is joined to an AD domain or not.",
			]
			type: "str"
			choices: ["present", "absent"]
			default: "absent"
			aliases: ["state"]
		}
		esxi_hostname: {
			description: [
				"Name of the host system to work with.",
				"This parameter is required if C(cluster_name) is not specified.",
			]
			type: "str"
		}
		cluster_name: {
			description: [
				"Name of the cluster from which all host systems will be used.",
				"This parameter is required if C(esxi_hostname) is not specified.",
			]
			type: "str"
		}
	}
	extends_documentation_fragment: "vmware.documentation"
}
