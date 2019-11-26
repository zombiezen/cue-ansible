package ansible

module: gluster_heal_info: {
	module:            "gluster_heal_info"
	short_description: "Gather information on self-heal or rebalance status"
	author:            "Devyani Kota (@devyanikota)"
	version_added:     "2.8"
	description: [
		"Gather facts about either self-heal or rebalance status.",
		"This module was called C(gluster_heal_facts) before Ansible 2.9, returning C(ansible_facts). Note that the M(gluster_heal_info) module no longer returns C(ansible_facts)!",
	]

	options: {
		name: {
			description: [
				"The volume name.",
			]
			required: true
			aliases: ["volume"]
		}
		status_filter: {
			default: "self-heal"
			choices: ["self-heal", "rebalance"]
			description: [
				"Determines which facts are to be returned.",
				"If the C(status_filter) is C(self-heal), status of self-heal, along with the number of files still in process are returned.",
				"If the C(status_filter) is C(rebalance), rebalance status is returned.",
			]
		}
	}
	requirements: ["GlusterFS > 3.2"]
}
