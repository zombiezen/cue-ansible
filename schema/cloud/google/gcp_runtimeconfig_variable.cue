package ansible

module: gcp_runtimeconfig_variable: {
	module: "gcp_runtimeconfig_variable"
	description: [
		"Describes a single variable within a runtime config resource.",
	]
	short_description: "Creates a GCP Variable"
	version_added:     "2.10"
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
		value: {
			description: [
				"The binary value of the variable. Either this or `text` can be set.",
			]
			required: false
			type:     "str"
		}
		text: {
			description: [
				"The string value of the variable. Either this or `value` can be set.",
			]
			required: false
			type:     "str"
		}
		name: {
			description: [
				"The name of the variable resource.",
			]
			required: true
			type:     "str"
		}
		config: {
			description: [
				"The name of the runtime config that this variable belongs to.",
			]
			required: true
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
