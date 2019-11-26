package ansible

module: na_cdot_svm: {
	module: "na_cdot_svm"

	short_description: "Manage NetApp cDOT svm"
	extends_documentation_fragment: [
		"netapp.ontap",
	]
	version_added: "2.3"
	author:        "Sumit Kumar (@timuster) <sumit4@netapp.com>"

	deprecated: {
		removed_in:  "2.11"
		why:         "Updated modules released with increased functionality"
		alternative: "Use M(na_ontap_svm) instead."
	}

	description: [
		"Create or destroy svm on NetApp cDOT",
	]

	options: {

		state: {
			description: [
				"Whether the specified SVM should exist or not.",
			]
			required: true
			choices: ["present", "absent"]
		}

		name: {
			description: [
				"The name of the SVM to manage.",
			]
			required: true
		}

		root_volume: description: [
			"Root volume of the SVM. Required when C(state=present).",
		]

		root_volume_aggregate: description: [
			"The aggregate on which the root volume will be created.",
			"Required when C(state=present).",
		]

		root_volume_security_style: {
			description: [
				"Security Style of the root volume.",
				"When specified as part of the vserver-create, this field represents the security style for the Vserver root volume.",
				"When specified as part of vserver-get-iter call, this will return the list of matching Vservers.",
				"Possible values are 'unix', 'ntfs', 'mixed'.",
				"The 'unified' security style, which applies only to Infinite Volumes, cannot be applied to a Vserver's root volume.",
				"Valid options are \"unix\" for NFS, \"ntfs\" for CIFS, \"mixed\" for Mixed, \"unified\" for Unified.",
				"Required when C(state=present)",
			]
			choices: ["unix", "ntfs", "mixed", "unified"]
		}
	}
}
