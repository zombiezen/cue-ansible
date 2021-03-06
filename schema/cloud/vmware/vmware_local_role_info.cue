package ansible

module: vmware_local_role_info: {
	module:            "vmware_local_role_info"
	short_description: "Gather info about local roles on an ESXi host"
	description: [
		"This module can be used to gather information about local role info on an ESXi host",
	]
	version_added: "2.9"
	author: [
		"Abhijeet Kasurde (@Akasurde)",
	]
	notes: [
		"Tested on ESXi 6.5",
		"Be sure that the ESXi user used for login, has the appropriate rights to view roles",
		"The module returns a list of dict in version 2.8 and above.",
	]
	requirements: [
		"python >= 2.6",
		"PyVmomi",
	]
	extends_documentation_fragment: "vmware.documentation"
}
