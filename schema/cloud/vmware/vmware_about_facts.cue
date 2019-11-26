package ansible

module: vmware_about_facts: {
	module: "vmware_about_facts"
	deprecated: {
		removed_in:  "2.13"
		why:         "Deprecated in favour of C(_info) module."
		alternative: "Use M(vmware_about_info) instead."
	}
	short_description: "Provides information about VMware server to which user is connecting to"
	description: [
		"This module can be used to gather information about VMware server to which user is trying to connect.",
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
	extends_documentation_fragment: "vmware.documentation"
}
