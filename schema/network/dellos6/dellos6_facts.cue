package ansible

module: dellos6_facts: {
	module:            "dellos6_facts"
	version_added:     "2.2"
	author:            "Abirami N (@abirami-n)"
	short_description: "Collect facts from remote devices running Dell EMC Networking OS6"
	description: [
		"Collects a base set of device facts from a remote device that is running OS6.  This module prepends all of the base network fact keys with C(ansible_net_<fact>).  The facts module will always collect a base set of facts from the device and can enable or disable collection of additional facts.",
	]

	extends_documentation_fragment: "dellos6"
	options: gather_subset: {
		description: [
			"When supplied, this argument will restrict the facts collected to a given subset.  Possible values for this argument include all, hardware, config, and interfaces. Can specify a list of values to include a larger subset.  Values can also be used with an initial C(M(!)) to specify that a specific subset should not be collected.",
		]

		default: ["!config"]
	}
}
