package ansible

module: vyos_facts: {
	module:            "vyos_facts"
	version_added:     2.2
	short_description: "Get facts about vyos devices."
	description: [
		"Collects facts from network devices running the vyos operating system. This module places the facts gathered in the fact tree keyed by the respective resource name.  The facts module will always collect a base set of facts from the device and can enable or disable collection of additional facts.",
	]

	author: [
		"Nathaniel Case (@qalthos)",
		"Nilashish Chakraborty (@Nilashishc)",
		"Rohit Thakur (@rohitthakur2590)",
	]
	extends_documentation_fragment: "vyos"
	notes: [
		"Tested against VyOS 1.1.8 (helium).",
		"This module works with connection C(network_cli). See L(the VyOS OS Platform Options,../network/user_guide/platform_vyos.html).",
	]
	options: {
		gather_subset: {
			description: [
				"When supplied, this argument will restrict the facts collected to a given subset.  Possible values for this argument include all, default, config, and neighbors. Can specify a list of values to include a larger subset. Values can also be used with an initial C(M(!)) to specify that a specific subset should not be collected.",
			]

			required: false
			default:  "!config"
		}
		gather_network_resources: {
			description: [
				"When supplied, this argument will restrict the facts collected to a given subset. Possible values for this argument include all and the resources like interfaces. Can specify a list of values to include a larger subset. Values can also be used with an initial C(M(!)) to specify that a specific subset should not be collected. Valid subsets are 'all', 'interfaces', 'l3_interfaces', 'lag_interfaces', 'lldp_global', 'lldp_interfaces'.",
			]

			required:      false
			version_added: "2.9"
		}
	}
}
