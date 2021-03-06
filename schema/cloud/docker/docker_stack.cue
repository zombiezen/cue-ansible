package ansible

module: docker_stack: {
	module:            "docker_stack"
	author:            "Dario Zanzico (@dariko)"
	short_description: "docker stack module"
	description: [
		"Manage docker stacks using the 'docker stack' command on the target node (see examples).",
	]

	version_added: "2.8"
	options: {
		name: {
			description: [
				"Stack name",
			]
			type:     "str"
			required: true
		}
		state: {
			description: [
				"Service state.",
			]
			type:    "str"
			default: "present"
			choices: [
				"present",
				"absent",
			]
		}
		compose: {
			description: [
				"List of compose definitions. Any element may be a string referring to the path of the compose file on the target host or the YAML contents of a compose file nested as dictionary.",
			]

			type: "list"
			// elements: raw
			default: []
		}
		prune: {
			description: [
				"If true will add the C(--prune) option to the C(docker stack deploy) command. This will have docker remove the services not present in the current stack definition.",
			]

			type:    "bool"
			default: false
		}
		with_registry_auth: {
			description: [
				"If true will add the C(--with-registry-auth) option to the C(docker stack deploy) command. This will have docker send registry authentication details to Swarm agents.",
			]

			type:    "bool"
			default: false
		}
		resolve_image: {
			description: [
				"If set will add the C(--resolve-image) option to the C(docker stack deploy) command. This will have docker query the registry to resolve image digest and supported platforms. If not set, docker use \"always\" by default.",
			]

			type: "str"
			choices: ["always", "changed", "never"]
		}
		absent_retries: {
			description: [
				"If C(>0) and I(state) is C(absent) the module will retry up to I(absent_retries) times to delete the stack until all the resources have been effectively deleted. If the last try still reports the stack as not completely removed the module will fail.",
			]

			type:    "int"
			default: 0
		}
		absent_retries_interval: {
			description: [
				"Interval in seconds between consecutive I(absent_retries).",
			]
			type:    "int"
			default: 1
		}
	}

	requirements: [
		"jsondiff",
		"pyyaml",
	]

	notes: ["Return values I(out) and I(err) have been deprecated and will be removed in Ansible 2.14. Use I(stdout) and I(stderr) instead."]
}
