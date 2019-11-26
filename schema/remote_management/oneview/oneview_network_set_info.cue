package ansible

module: oneview_network_set_info: {
	module:            "oneview_network_set_info"
	short_description: "Retrieve information about the OneView Network Sets"
	description: [
		"Retrieve information about the Network Sets from OneView.",
		"This module was called C(oneview_network_set_facts) before Ansible 2.9, returning C(ansible_facts). Note that the M(oneview_network_set_info) module no longer returns C(ansible_facts)!",
	]

	version_added: "2.4"
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
			"Network Set name.",
		]

		options: description: [
			"List with options to gather information about Network Set. Option allowed: C(withoutEthernet). The option C(withoutEthernet) retrieves the list of network_sets excluding Ethernet networks.",
		]
	}

	extends_documentation_fragment: [
		"oneview",
		"oneview.factsparams",
	]
}
