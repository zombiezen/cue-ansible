package ansible

module: docker_secret: {
	module: "docker_secret"

	short_description: "Manage docker secrets."

	version_added: "2.4"

	description: [
		"Create and remove Docker secrets in a Swarm environment. Similar to C(docker secret create) and C(docker secret rm).",
		"Adds to the metadata of new secrets 'ansible_key', an encrypted hash representation of the data, which is then used in future runs to test if a secret has changed. If 'ansible_key is not present, then a secret will not be updated unless the I(force) option is set.",
		"Updates to secrets are performed by removing the secret and creating it again.",
	]
	options: {
		data: {
			description: [
				"The value of the secret. Required when state is C(present).",
			]
			type: "str"
		}
		data_is_b64: {
			description: [
				"If set to C(true), the data is assumed to be Base64 encoded and will be decoded before being used.",
				"To use binary I(data), it is better to keep it Base64 encoded and let it be decoded by this option.",
			]

			type:          "bool"
			default:       false
			version_added: "2.8"
		}
		labels: {
			description: [
				"A map of key:value meta data, where both key and value are expected to be strings.",
				"If new meta data is provided, or existing meta data is modified, the secret will be updated by removing it and creating it again.",
			]
			type: "dict"
		}
		force: {
			description: [
				"Use with state C(present) to always remove and recreate an existing secret.",
				"If C(true), an existing secret will be replaced, even if it has not changed.",
			]
			type:    "bool"
			default: false
		}
		name: {
			description: [
				"The name of the secret.",
			]
			type:     "str"
			required: true
		}
		state: {
			description: [
				"Set to C(present), if the secret should exist, and C(absent), if it should not.",
			]
			type:    "str"
			default: "present"
			choices: [
				"absent",
				"present",
			]
		}
	}

	extends_documentation_fragment: [
		"docker",
		"docker.docker_py_2_documentation",
	]

	requirements: [
		"L(Docker SDK for Python,https://docker-py.readthedocs.io/en/stable/) >= 2.1.0",
		"Docker API >= 1.25",
	]

	author: ["Chris Houseknecht (@chouseknecht)"]
}
