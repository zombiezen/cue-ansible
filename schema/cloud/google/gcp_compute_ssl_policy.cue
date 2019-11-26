package ansible

module: gcp_compute_ssl_policy: {
	module: "gcp_compute_ssl_policy"
	description: [
		"Represents a SSL policy. SSL policies give you the ability to control the features of SSL that your SSL proxy or HTTPS load balancer negotiates.",
	]

	short_description: "Creates a GCP SslPolicy"
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
		description: {
			description: [
				"An optional description of this resource.",
			]
			required: false
			type:     "str"
		}
		name: {
			description: [
				"Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.",
			]

			required: true
			type:     "str"
		}
		profile: {
			description: [
				"Profile specifies the set of SSL features that can be used by the load balancer when negotiating SSL with clients. This can be one of `COMPATIBLE`, `MODERN`, `RESTRICTED`, or `CUSTOM`. If using `CUSTOM`, the set of SSL features to enable must be specified in the `customFeatures` field.",
				"Some valid choices include: \"COMPATIBLE\", \"MODERN\", \"RESTRICTED\", \"CUSTOM\"",
			]
			required: false
			type:     "str"
		}
		min_tls_version: {
			description: [
				"The minimum version of SSL protocol that can be used by the clients to establish a connection with the load balancer. This can be one of `TLS_1_0`, `TLS_1_1`, `TLS_1_2`.",
				"Some valid choices include: \"TLS_1_0\", \"TLS_1_1\", \"TLS_1_2\"",
			]
			required: false
			type:     "str"
		}
		custom_features: {
			description: [
				"A list of features enabled when the selected profile is CUSTOM. The method returns the set of features that can be specified in this list. This field must be empty if the profile is not CUSTOM.",
			]

			required: false
			type:     "list"
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
		"API Reference: U(https://cloud.google.com/compute/docs/reference/rest/v1/sslPolicies)",
		"Using SSL Policies: U(https://cloud.google.com/compute/docs/load-balancing/ssl-policies)",
		"for authentication, you can set service_account_file using the C(gcp_service_account_file) env variable.",
		"for authentication, you can set service_account_contents using the C(GCP_SERVICE_ACCOUNT_CONTENTS) env variable.",
		"For authentication, you can set service_account_email using the C(GCP_SERVICE_ACCOUNT_EMAIL) env variable.",
		"For authentication, you can set auth_kind using the C(GCP_AUTH_KIND) env variable.",
		"For authentication, you can set scopes using the C(GCP_SCOPES) env variable.",
		"Environment variables values will only be used if the playbook values are not set.",
		"The I(service_account_email) and I(service_account_file) options are mutually exclusive.",
	]
}
