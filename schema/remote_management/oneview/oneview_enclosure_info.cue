package ansible

module: oneview_enclosure_info: {
	module:            "oneview_enclosure_info"
	short_description: "Retrieve information about one or more Enclosures"
	description: [
		"Retrieve information about one or more of the Enclosures from OneView.",
		"This module was called C(oneview_enclosure_facts) before Ansible 2.9, returning C(ansible_facts). Note that the M(oneview_enclosure_info) module no longer returns C(ansible_facts)!",
	]

	version_added: "2.5"
	requirements: [
		"hpOneView >= 2.0.1",
	]
	author: [
		"Felipe Bulsoni (@fgbulsoni)",
		"Thiago Miotto (@tmiotto)",
		"Adriane Cardozo (@adriane-cardozo)",
	]
	options: {
		name: description: [
			"Enclosure name.",
		]
		options: description: [
			"List with options to gather additional information about an Enclosure and related resources. Options allowed: C(script), C(environmentalConfiguration), and C(utilization). For the option C(utilization), you can provide specific parameters.",
		]
	}

	extends_documentation_fragment: [
		"oneview",
		"oneview.factsparams",
	]
}
