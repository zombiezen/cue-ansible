package ansible

module: icx_facts: {
	module:            "icx_facts"
	version_added:     "2.9"
	author:            "Ruckus Wireless (@Commscope)"
	short_description: "Collect facts from remote Ruckus ICX 7000 series switches"
	description: [
		"Collects a base set of device facts from a remote device that is running ICX.  This module prepends all of the base network fact keys with C(ansible_net_<fact>). The facts module will always collect a base set of facts from the device and can enable or disable collection of additional facts.",
	]

	notes: [
		"Tested against ICX 10.1.",
		"For information on using ICX platform, see L(the ICX OS Platform Options guide,../network/user_guide/platform_icx.html).",
	]
	options: gather_subset: {
		description: [
			"When supplied, this argument will restrict the facts collected to a given subset.  Possible values for this argument include all, hardware, config, and interfaces.  Can specify a list of values to include a larger subset.  Values can also be used with an initial C(M(!)) to specify that a specific subset should not be collected.",
		]

		required: false
		type:     "list"
		default:  "!config"
	}
}
