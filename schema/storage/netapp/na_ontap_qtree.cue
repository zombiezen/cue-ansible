package ansible

module: na_ontap_qtree: {
	module: "na_ontap_qtree"

	short_description: "NetApp ONTAP manage qtrees"
	extends_documentation_fragment: [
		"netapp.na_ontap",
	]
	version_added: "2.6"
	author:        "NetApp Ansible Team (@carchi8py) <ng-ansibleteam@netapp.com>"

	description: [
		"Create or destroy Qtrees.",
	]

	options: {

		state: {
			description: [
				"Whether the specified qtree should exist or not.",
			]
			choices: ["present", "absent"]
			default: "present"
		}

		name: {
			description: [
				"The name of the qtree to manage.",
			]
			required: true
			type:     "str"
		}

		from_name: {
			description: [
				"Name of the qtree to be renamed.",
			]
			version_added: "2.7"
			type:          "str"
		}

		flexvol_name: {
			description: [
				"The name of the FlexVol the qtree should exist on. Required when C(state=present).",
			]
			required: true
			type:     "str"
		}

		vserver: {
			description: [
				"The name of the vserver to use.",
			]
			required: true
			type:     "str"
		}

		export_policy: {
			description: [
				"The name of the export policy to apply.",
			]
			version_added: "2.9"
			type:          "str"
		}

		security_style: {
			description: [
				"The security style for the qtree.",
			]
			choices: ["unix", "ntfs", "mixed"]
			version_added: "2.9"
		}

		oplocks: {
			description: [
				"Whether the oplocks should be enabled or not for the qtree.",
			]
			choices: ["enabled", "disabled"]
			version_added: "2.9"
		}

		unix_permissions: {
			description: [
				"File permissions bits of the qtree.",
			]
			version_added: "2.9"
			type:          "str"
		}
	}
}
