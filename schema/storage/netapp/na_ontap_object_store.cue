package ansible

module: na_ontap_object_store: {
	module:            "na_ontap_object_store"
	short_description: "NetApp ONTAP manage object store config."
	extends_documentation_fragment: [
		"netapp.na_ontap",
	]
	version_added: "2.9"
	author:        "NetApp Ansible Team (@carchi8py) <ng-ansibleteam@netapp.com>"

	description: [
		"Create or delete object store config on ONTAP.",
	]

	options: {

		state: {
			description: [
				"Whether the specified object store config should exist or not.",
			]
			choices: ["present", "absent"]
			default: "present"
			type:    "str"
		}

		name: {
			required: true
			description: [
				"The name of the object store config to manage.",
			]
			type: "str"
		}

		provider_type: {
			required: false
			description: [
				"The name of the object store config provider.",
			]
			type: "str"
		}

		server: {
			required: false
			description: [
				"Fully qualified domain name of the object store config.",
			]
			type: "str"
		}

		container: {
			required: false
			description: [
				"Data bucket/container name used in S3 requests.",
			]
			type: "str"
		}

		access_key: {
			required: false
			description: [
				"Access key ID for AWS_S3 and SGWS provider types.",
			]
			type: "str"
		}

		secret_password: {
			required: false
			description: [
				"Secret access key for AWS_S3 and SGWS provider types.",
			]
			type: "str"
		}
	}
}
