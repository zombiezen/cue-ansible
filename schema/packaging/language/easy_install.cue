package ansible

module: easy_install: {
	module:            "easy_install"
	short_description: "Installs Python libraries"
	description: [
		"Installs Python libraries, optionally in a I(virtualenv)",
	]
	version_added: "0.7"
	options: {
		name: {
			description: [
				"A Python library name",
			]
			required: true
		}
		virtualenv: description: [
			"an optional I(virtualenv) directory path to install into. If the I(virtualenv) does not exist, it is created automatically",
		]

		virtualenv_site_packages: {
			version_added: "1.1"
			description: [
				"Whether the virtual environment will inherit packages from the global site-packages directory.  Note that if this setting is changed on an already existing virtual environment it will not have any effect, the environment must be deleted and newly created.",
			]

			type:    "bool"
			default: "no"
		}
		virtualenv_command: {
			version_added: "1.1"
			description: [
				"The command to create the virtual environment with. For example C(pyvenv), C(virtualenv), C(virtualenv2).",
			]

			default: "virtualenv"
		}
		executable: {
			description: [
				"The explicit executable or a pathname to the executable to be used to run easy_install for a specific version of Python installed in the system. For example C(easy_install-3.3), if there are both Python 2.7 and 3.3 installations in the system and you want to run easy_install for the Python 3.3 installation.",
			]

			version_added: "1.3"
		}
		state: {
			version_added: "2.0"
			description: [
				"The desired state of the library. C(latest) ensures that the latest version is installed.",
			]
			choices: ["present", "latest"]
			default: "present"
		}
	}
	notes: [
		"Please note that the C(easy_install) module can only install Python libraries. Thus this module is not able to remove libraries. It is generally recommended to use the M(pip) module which you can first install using M(easy_install).",
		"Also note that I(virtualenv) must be installed on the remote host if the C(virtualenv) parameter is specified.",
	]

	requirements: ["virtualenv"]
	author: "Matt Wright (@mattupstate)"
}
