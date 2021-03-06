package ansible

module: gcp_storage_object: {
	module: "gcp_storage_object"
	description: [
		"Upload or download a file from a GCS bucket.",
	]
	short_description: "Creates a GCP Object"
	version_added:     "2.8"
	author:            "Google Inc. (@googlecloudplatform)"
	requirements: [
		"python >= 2.6",
		"requests >= 2.18.4",
		"google-auth >= 1.3.0",
	]
	options: {
		state: {
			description: [
				"Whether the given object should exist in GCP",
			]
			choices: [
				"present",
				"absent",
			]
			default: "present"
			type:    "str"
		}
		action: {
			description: [
				"Upload or download from the bucket.",
				"Some valid choices include: \"download\", \"upload\"",
			]
			required: false
			type:     "str"
		}
		overwrite: {
			description: [
				"'Overwrite the file on the bucket/local machine. If overwrite is false and a difference exists between GCS + local, module will fail with error' .",
			]

			required: false
			type:     "bool"
		}
		src: {
			description: [
				"Source location of file (may be local machine or cloud depending on action).",
			]
			required: false
			type:     "path"
		}
		dest: {
			description: [
				"Destination location of file (may be local machine or cloud depending on action).",
			]
			required: false
			type:     "path"
		}
		bucket: {
			description: [
				"The name of the bucket.",
			]
			required: false
			type:     "str"
		}
		project: {
			description: [
				"The Google Cloud Platform project to use.",
			]
			type: "str"
		}
		auth_kind: {
			description: [
				"The type of credential used.",
			]
			type:     "str"
			required: true
			choices: [
				"application",
				"machineaccount",
				"serviceaccount",
			]
		}
		service_account_contents: {
			description: [
				"The contents of a Service Account JSON file, either in a dictionary or as a JSON string that represents it.",
			]

			type: "jsonarg"
		}
		service_account_file: {
			description: [
				"The path of a Service Account JSON file if serviceaccount is selected as type.",
			]
			type: "path"
		}
		service_account_email: {
			description: [
				"An optional service account email address if machineaccount is selected and the user does not wish to use the default email.",
			]

			type: "str"
		}
		scopes: {
			description: [
				"Array of scopes to be used",
			]
			type: "list"
		}
		env_type: {
			description: [
				"Specifies which Ansible environment you're running this module within.",
				"This should not be set unless you know what you're doing.",
				"This only alters the User Agent string for any API requests.",
			]
			type: "str"
		}
	}
}
