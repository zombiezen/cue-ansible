package ansible

module: cnos_rollback: {
	module:            "cnos_rollback"
	author:            "Anil Kumar Muraleedharan (@amuraleedhar)"
	short_description: "Roll back the running or startup configuration from a remote server on devices running Lenovo CNOS"

	description: [
		"This module allows you to work with switch configurations. It provides a way to roll back configurations of a switch from a remote server. This is achieved by using startup or running configurations of the target device that were previously backed up to a remote server using FTP, SFTP, TFTP, or SCP. The first step is to create a directory from where the remote server can be reached. The next step is to provide the full file path of he backup configuration's location. Authentication details required by the remote server must be provided as well. By default, this method overwrites the switch's configuration file with the newly downloaded file. This module uses SSH to manage network device configuration. The results of the operation will be placed in a directory named 'results' that must be created by the user in their local directory to where the playbook is run.",
	]

	version_added:                  "2.3"
	extends_documentation_fragment: "cnos"
	options: {
		configType: {
			description: [
				"This refers to the type of configuration which will be used for the rolling back process. The choices are the running or startup configurations. There is no default value, so it will result in an error if the input is incorrect.",
			]

			required: true
			default:  null
			choices: ["running-config", "startup-config"]
		}
		protocol: {
			description: [
				"This refers to the protocol used by the network device to interact with the remote server from where to download the backup configuration. The choices are FTP, SFTP, TFTP, or SCP. Any other protocols will result in error. If this parameter is not specified, there is no default value to be used.",
			]

			required: true
			default:  null
			choices: ["SFTP", "SCP", "FTP", "TFTP"]
		}
		rcserverip: {
			description: [
				"This specifies the IP Address of the remote server from where the backup configuration will be downloaded.",
			]

			required: true
			default:  null
		}
		rcpath: {
			description: [
				"This specifies the full file path of the configuration file located on the remote server. In case the relative path is used as the variable value, the root folder for the user of the server needs to be specified.",
			]

			required: true
			default:  null
		}
		serverusername: {
			description: [
				"Specify username for the server relating to the protocol used.",
			]
			required: true
			default:  null
		}
		serverpassword: {
			description: [
				"Specify password for the server relating to the protocol used.",
			]
			required: true
			default:  null
		}
	}
}
