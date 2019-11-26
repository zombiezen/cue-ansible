package ansible

module: purefb_info: {
	module:            "purefb_info"
	version_added:     "2.9"
	short_description: "Collect information from Pure Storage FlashBlade"
	description: [
		"Collect information from a Pure Storage FlashBlade running the Purity//FB operating system. By default, the module will collect basic information including hosts, host groups, protection groups and volume counts. Additional information can be collected based on the configured set of arguments.",
	]

	author: [
		"Pure Storage Ansible Team (@sdodsley) <pure-ansible-team@purestorage.com>",
	]
	options: gather_subset: {
		description: [
			"When supplied, this argument will define the information to be collected. Possible values for this include all, minimum, config, performance, capacity, network, subnets, lags, filesystems and snapshots.",
		]

		required: false
		type:     "list"
		default:  "minimum"
	}
	extends_documentation_fragment: ["purestorage.fb"]
}
