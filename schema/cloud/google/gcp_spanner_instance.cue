package ansible

module: gcp_spanner_instance: {
	module: "gcp_spanner_instance"
	description: [
		"An isolated set of Cloud Spanner resources on which databases can be hosted.",
	]
	short_description: "Creates a GCP Instance"
	version_added:     "2.7"
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
		name: {
			description: [
				"A unique identifier for the instance, which cannot be changed after the instance is created. The name must be between 6 and 30 characters in length.",
			]

			required: true
			type:     "str"
		}
		config: {
			description: [
				"The name of the instance's configuration (similar but not quite the same as a region) which defines defines the geographic placement and replication of your databases in this instance. It determines where your data is stored. Values are typically of the form `regional-europe-west1` , `us-central` etc.",
				"In order to obtain a valid list please consult the [Configuration section of the docs](U(https://cloud.google.com/spanner/docs/instances)).",
			]

			required: true
			type:     "str"
		}
		display_name: {
			description: [
				"The descriptive name for this instance as it appears in UIs. Must be unique per project and between 4 and 30 characters in length.",
			]

			required: true
			type:     "str"
		}
		node_count: {
			description: [
				"The number of nodes allocated to this instance.",
			]
			required: false
			default:  "1"
			type:     "int"
		}
		labels: {
			description: [
				"An object containing a list of \"key\": value pairs.",
				"Example: { \"name\": \"wrench\", \"mass\": \"1.3kg\", \"count\": \"3\" }.",
			]
			required: false
			type:     "dict"
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
	notes: [
		"API Reference: U(https://cloud.google.com/spanner/docs/reference/rest/v1/projects.instances)",
		"Official Documentation: U(https://cloud.google.com/spanner/)",
		"for authentication, you can set service_account_file using the C(gcp_service_account_file) env variable.",
		"for authentication, you can set service_account_contents using the C(GCP_SERVICE_ACCOUNT_CONTENTS) env variable.",
		"For authentication, you can set service_account_email using the C(GCP_SERVICE_ACCOUNT_EMAIL) env variable.",
		"For authentication, you can set auth_kind using the C(GCP_AUTH_KIND) env variable.",
		"For authentication, you can set scopes using the C(GCP_SCOPES) env variable.",
		"Environment variables values will only be used if the playbook values are not set.",
		"The I(service_account_email) and I(service_account_file) options are mutually exclusive.",
	]
}
