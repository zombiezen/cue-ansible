package ansible

module: na_cdot_volume: {
	module: "na_cdot_volume"

	short_description: "Manage NetApp cDOT volumes"
	extends_documentation_fragment: [
		"netapp.ontap",
	]
	version_added: "2.3"
	author:        "Sumit Kumar (@timuster) <sumit4@netapp.com>"

	deprecated: {
		removed_in:  "2.11"
		why:         "Updated modules released with increased functionality"
		alternative: "Use M(na_ontap_volume) instead."
	}

	description: [
		"Create or destroy volumes on NetApp cDOT",
	]

	options: {

		state: {
			description: [
				"Whether the specified volume should exist or not.",
			]
			required: true
			choices: ["present", "absent"]
		}

		name: {
			description: [
				"The name of the volume to manage.",
			]
			required: true
		}

		infinite: {
			description: [
				"Set True if the volume is an Infinite Volume.",
			]
			type:    "bool"
			default: "no"
		}

		online: {
			description: [
				"Whether the specified volume is online, or not.",
			]
			type:    "bool"
			default: "yes"
		}

		aggregate_name: description: [
			"The name of the aggregate the flexvol should exist on. Required when C(state=present).",
		]

		size: description: [
			"The size of the volume in (size_unit). Required when C(state=present).",
		]

		size_unit: {
			description: [
				"The unit used to interpret the size parameter.",
			]
			choices: ["bytes", "b", "kb", "mb", "gb", "tb", "pb", "eb", "zb", "yb"]
			default: "gb"
		}

		vserver: {
			description: [
				"Name of the vserver to use.",
			]
			required: true
		}

		junction_path: {
			description: [
				"Junction path where to mount the volume",
			]
			required:      false
			version_added: "2.6"
		}

		export_policy: {
			description: [
				"Export policy to set for the specified junction path.",
			]
			required:      false
			default:       "default"
			version_added: "2.6"
		}

		snapshot_policy: {
			description: [
				"Snapshot policy to set for the specified volume.",
			]
			required:      false
			default:       "default"
			version_added: "2.6"
		}
	}
}
