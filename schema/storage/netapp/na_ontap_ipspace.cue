package ansible

module: na_ontap_ipspace: {
	module: "na_ontap_ipspace"

	short_description: "NetApp ONTAP Manage an ipspace"

	version_added: "2.9"

	author: [
		"NTTE Storage Engineering (@vicmunoz) <cl.eng.sto@ntt.eu>",
	]

	description: [
		"Manage an ipspace for an Ontap Cluster",
	]

	extends_documentation_fragment: [
		"netapp.na_ontap",
	]

	options: {
		state: {
			description: [
				"Whether the specified ipspace should exist or not",
			]
			choices: ["present", "absent"]
			default: "present"
		}
		name: {
			description: [
				"The name of the ipspace to manage",
			]
			required: true
		}
		from_name: description: ["Name of the existing ipspace to be renamed to name"]
	}
}
