package ansible

module: vmware_category_facts: {
	module: "vmware_category_facts"
	deprecated: {
		removed_in:  "2.13"
		why:         "Deprecated in favour of C(_info) module."
		alternative: "Use M(vmware_category_info) instead."
	}
	short_description: "Gather facts about VMware tag categories"
	description: [
		"This module can be used to gather facts about VMware tag categories.",
		"Tag feature is introduced in vSphere 6 version, so this module is not supported in earlier versions of vSphere.",
		"All variables and VMware object names are case sensitive.",
	]
	version_added: "2.7"
	author: [
		"Abhijeet Kasurde (@Akasurde)",
	]
	notes: [
		"Tested on vSphere 6.5",
	]
	requirements: [
		"python >= 2.6",
		"PyVmomi",
		"vSphere Automation SDK",
	]
	extends_documentation_fragment: "vmware_rest_client.documentation"
}
