package ansible

module: bigip_profile_persistence_src_addr: {
	module:            "bigip_profile_persistence_src_addr"
	short_description: "Manage source address persistence profiles"
	description: [
		"Manages source address persistence profiles.",
	]
	version_added: 2.7
	options: {
		name: {
			description: [
				"Specifies the name of the profile.",
			]
			type:     "str"
			required: true
		}
		parent: {
			description: [
				"Specifies the profile from which this profile inherits settings.",
				"When creating a new profile, if this parameter is not specified, the default is the system-supplied C(source_addr) profile.",
			]

			type: "str"
		}
		match_across_services: {
			description: [
				"When C(yes), specifies that all persistent connections from a client IP address that go to the same virtual IP address also go to the same node.",
				"When creating a new profile, if this parameter is not specified, the default is provided by the parent profile.",
			]

			type: "bool"
		}
		match_across_virtuals: {
			description: [
				"When C(yes), specifies that all persistent connections from the same client IP address go to the same node.",
				"When creating a new profile, if this parameter is not specified, the default is provided by the parent profile.",
			]

			type: "bool"
		}
		match_across_pools: {
			description: [
				"When C(yes), specifies that the system can use any pool that contains this persistence record.",
				"When creating a new profile, if this parameter is not specified, the default is provided by the parent profile.",
			]

			type: "bool"
		}
		hash_algorithm: {
			description: [
				"Specifies the algorithm the system uses for hash persistence load balancing. The hash result is the input for the algorithm.",
				"When C(default), specifies that the system uses the index of pool members to obtain the hash result for the input to the algorithm.",
				"When C(carp), specifies that the system uses the Cache Array Routing Protocol (CARP) to obtain the hash result for the input to the algorithm.",
				"When creating a new profile, if this parameter is not specified, the default is provided by the parent profile.",
			]

			type: "str"
			choices: [
				"default",
				"carp",
			]
		}
		entry_timeout: {
			description: [
				"Specifies the duration of the persistence entries.",
				"When creating a new profile, if this parameter is not specified, the default is provided by the parent profile.",
				"To specify an indefinite timeout, use the value C(indefinite).",
				"If specifying a numeric timeout, the value must be between C(1) and C(4294967295).",
			]
			type: "str"
		}
		override_connection_limit: {
			description: [
				"When C(yes), specifies that the system allows you to specify that pool member connection limits will be overridden for persisted clients.",
				"Per-virtual connection limits remain hard limits and are not overridden.",
			]
			type: "bool"
		}
		partition: {
			description: [
				"Device partition to manage resources on.",
			]
			type:    "str"
			default: "Common"
		}
		state: {
			description: [
				"When C(present), ensures that the profile exists.",
				"When C(absent), ensures the profile is removed.",
			]
			type: "str"
			choices: [
				"present",
				"absent",
			]
			default: "present"
		}
	}
	extends_documentation_fragment: "f5"
	author: ["Tim Rupp (@caphrim007)"]
}
