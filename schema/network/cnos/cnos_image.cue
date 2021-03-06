package ansible

module: cnos_image: {
	module:            "cnos_image"
	author:            "Anil Kumar Muraleedharan (@amuraleedhar)"
	short_description: "Perform firmware upgrade/download from a remote server on devices running Lenovo CNOS"

	description: [
		"This module allows you to work with switch firmware images. It provides a way to download a firmware image to a network device from a remote server using FTP, SFTP, TFTP, or SCP. The first step is to create a directory from where the remote server can be reached. The next step is to provide the full file path of the image's location. Authentication details required by the remote server must be provided as well. By default, this method makes the newly downloaded firmware image the active image, which will be used by the switch during the next restart. This module uses SSH to manage network device configuration. The results of the operation will be placed in a directory named 'results' that must be created by the user in their local directory to where the playbook is run.",
	]

	version_added:                  "2.3"
	extends_documentation_fragment: "cnos"
	options: {
		protocol: {
			description: [
				"This refers to the protocol used by the network device to interact with the remote server from where to download the firmware image. The choices are FTP, SFTP, TFTP, or SCP. Any other protocols will result in error. If this parameter is not specified there is no default value to be used.",
			]

			required: true
			choices: ["SFTP", "SCP", "FTP", "TFTP"]
		}
		serverip: {
			description: [
				"This specifies the IP Address of the remote server from where the software image will be downloaded.",
			]

			required: true
		}
		imgpath: {
			description: [
				"This specifies the full file path of the image located on the remote server. In case the relative path is used as the variable value, the root folder for the user of the server needs to be specified.",
			]

			required: true
		}
		imgtype: {
			description: [
				"This specifies the firmware image type to be downloaded",
			]
			required: true
			choices: ["all", "boot", "os", "onie"]
		}
		serverusername: {
			description: [
				"Specify the username for the server relating to the protocol used",
			]
			required: true
		}
		serverpassword: description: ["Specify the password for the server relating to the protocol used"]
	}
}
