package ansible

module: na_ontap_export_policy: {
	module:            "na_ontap_export_policy"
	short_description: "NetApp ONTAP manage export-policy"
	extends_documentation_fragment: [
		"netapp.na_ontap",
	]
	version_added: "2.6"
	author:        "NetApp Ansible Team (@carchi8py) <ng-ansibleteam@netapp.com>"
	description: [
		"Create or destroy or rename export-policies on ONTAP",
	]
	options: {
		state: {
			description: [
				"Whether the specified export policy should exist or not.",
			]
			choices: ["present", "absent"]
			default: "present"
		}
		name: {
			description: [
				"The name of the export-policy to manage.",
			]
			required: true
		}
		from_name: {
			description: [
				"The name of the export-policy to be renamed.",
			]
			version_added: "2.7"
		}
		vserver: description: ["Name of the vserver to use."]
	}
}
