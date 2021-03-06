package ansible

module: avi_backupconfiguration: {
	module: "avi_backupconfiguration"
	author: "Gaurav Rastogi (@grastogi23) <grastogi@avinetworks.com>"

	short_description: "Module for setup of BackupConfiguration Avi RESTful Object"
	description: [
		"This module is used to configure BackupConfiguration object",
		"more examples at U(https://github.com/avinetworks/devops)",
	]
	requirements: ["avisdk"]
	version_added: "2.4"
	options: {
		state: {
			description: [
				"The state that should be applied on the entity.",
			]
			default: "present"
			choices: ["absent", "present"]
		}
		avi_api_update_method: {
			description: [
				"Default method for object update is HTTP PUT.",
				"Setting to patch will override that behavior to use HTTP PATCH.",
			]
			version_added: "2.5"
			default:       "put"
			choices: ["put", "patch"]
		}
		avi_api_patch_op: {
			description: [
				"Patch operation to use when using avi_api_update_method as patch.",
			]
			version_added: "2.5"
			choices: ["add", "replace", "delete"]
		}
		aws_access_key: {
			description: [
				"Aws access key id.",
				"Field introduced in 18.2.3.",
			]
			version_added: "2.9"
		}
		aws_bucket_id: {
			description: [
				"Aws bucket.",
				"Field introduced in 18.2.3.",
			]
			version_added: "2.9"
		}
		aws_secret_access: {
			description: [
				"Aws secret access key.",
				"Field introduced in 18.2.3.",
			]
			version_added: "2.9"
		}
		backup_file_prefix: description: [
			"Prefix of the exported configuration file.",
			"Field introduced in 17.1.1.",
		]
		backup_passphrase: description: [
			"Passphrase of backup configuration.",
		]
		maximum_backups_stored: description: [
			"Rotate the backup files based on this count.",
			"Allowed values are 1-20.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 4.",
		]
		name: {
			description: [
				"Name of backup configuration.",
			]
			required: true
		}
		remote_directory: description: [
			"Directory at remote destination with write permission for ssh user.",
		]
		remote_hostname: description: [
			"Remote destination.",
		]
		save_local: {
			description: [
				"Local backup.",
			]
			type: "bool"
		}
		ssh_user_ref: description: [
			"Access credentials for remote destination.",
			"It is a reference to an object of type cloudconnectoruser.",
		]
		tenant_ref: description: [
			"It is a reference to an object of type tenant.",
		]
		upload_to_remote_host: {
			description: [
				"Remote backup.",
			]
			type: "bool"
		}
		upload_to_s3: {
			description: [
				"Cloud backup.",
				"Field introduced in 18.2.3.",
			]
			version_added: "2.9"
			type:          "bool"
		}
		url: description: [
			"Avi controller URL of the object.",
		]
		uuid: description: [
			"Unique object identifier of the object.",
		]
	}
	extends_documentation_fragment: ["avi"]
}
