package ansible

module: docker_login: {
	module:            "docker_login"
	short_description: "Log into a Docker registry."
	version_added:     "2.0"
	description: [
		"Provides functionality similar to the \"docker login\" command.",
		"Authenticate with a docker registry and add the credentials to your local Docker config file respectively the credentials store associated to the registry. Adding the credentials to the config files resp. the credential store allows future connections to the registry using tools such as Ansible's Docker modules, the Docker CLI and Docker SDK for Python without needing to provide credentials.",
		"Running in check mode will perform the authentication without updating the config file.",
	]
	options: {
		registry_url: {
			required: false
			description: [
				"The registry URL.",
			]
			type:    "str"
			default: "https://index.docker.io/v1/"
			aliases: [
				"registry",
				"url",
			]
		}
		username: {
			description: [
				"The username for the registry account",
			]
			type:     "str"
			required: true
		}
		password: {
			description: [
				"The plaintext password for the registry account",
			]
			type:     "str"
			required: true
		}
		email: {
			required: false
			description: [
				"Does nothing, do not use.",
				"Will be removed in Ansible 2.14.",
			]
			type: "str"
		}
		reauthorize: {
			description: [
				"Refresh existing authentication found in the configuration file.",
			]
			type:    "bool"
			default: false
			aliases: [
				"reauth",
			]
		}
		config_path: {
			description: [
				"Custom path to the Docker CLI configuration file.",
			]
			type:    "path"
			default: "~/.docker/config.json"
			aliases: [
				"dockercfg_path",
			]
		}
		state: {
			version_added: "2.3"
			description: [
				"This controls the current state of the user. C(present) will login in a user, C(absent) will log them out.",
				"To logout you only need the registry server, which defaults to DockerHub.",
				"Before 2.1 you could ONLY log in.",
				"Docker does not support 'logout' with a custom config file.",
			]
			type:    "str"
			default: "present"
			choices: ["present", "absent"]
		}
	}

	extends_documentation_fragment: [
		"docker",
		"docker.docker_py_1_documentation",
	]
	requirements: [
		"L(Docker SDK for Python,https://docker-py.readthedocs.io/en/stable/) >= 1.8.0 (use L(docker-py,https://pypi.org/project/docker-py/) for Python 2.6)",
		"L(Python bindings for docker credentials store API) >= 0.2.1 (use L(docker-pycreds,https://pypi.org/project/docker-pycreds/) when using Docker SDK for Python < 4.0.0)",
		"Docker API >= 1.20",
	]
	author: [
		"Olaf Kilian (@olsaki) <olaf.kilian@symanex.com>",
		"Chris Houseknecht (@chouseknecht)",
	]
}
