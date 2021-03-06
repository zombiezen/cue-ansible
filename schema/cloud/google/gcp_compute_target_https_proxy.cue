package ansible

module: gcp_compute_target_https_proxy: {
	module: "gcp_compute_target_https_proxy"
	description: [
		"Represents a TargetHttpsProxy resource, which is used by one or more global forwarding rule to route incoming HTTPS requests to a URL map.",
	]

	short_description: "Creates a GCP TargetHttpsProxy"
	version_added:     "2.6"
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
		quic_override: {
			description: [
				"Specifies the QUIC override policy for this resource. This determines whether the load balancer will attempt to negotiate QUIC with clients or not. Can specify one of NONE, ENABLE, or DISABLE. If NONE is specified, uses the QUIC policy with no user overrides, which is equivalent to DISABLE. Not specifying this field is equivalent to specifying NONE.",
				"Some valid choices include: \"NONE\", \"ENABLE\", \"DISABLE\"",
			]
			required:      false
			type:          "str"
			version_added: "2.7"
		}
		ssl_certificates: {
			description: [
				"A list of SslCertificate resources that are used to authenticate connections between users and the load balancer. Currently, exactly one SSL certificate must be specified.",
			]

			required: true
			type:     "list"
		}
		ssl_policy: {
			description: [
				"A reference to the SslPolicy resource that will be associated with the TargetHttpsProxy resource. If not set, the TargetHttpsProxy resource will not have any SSL policy configured.",
				"This field represents a link to a SslPolicy resource in GCP. It can be specified in two ways. First, you can place a dictionary with key 'selfLink' and value of your resource's selfLink Alternatively, you can add `register: name-of-resource` to a gcp_compute_ssl_policy task and then set this ssl_policy field to \"{{ name-of-resource }}\"",
			]

			required:      false
			type:          "dict"
			version_added: "2.8"
		}
		url_map: {
			description: [
				"A reference to the UrlMap resource that defines the mapping from URL to the BackendService.",
				"This field represents a link to a UrlMap resource in GCP. It can be specified in two ways. First, you can place a dictionary with key 'selfLink' and value of your resource's selfLink Alternatively, you can add `register: name-of-resource` to a gcp_compute_url_map task and then set this url_map field to \"{{ name-of-resource }}\"",
			]

			required: true
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
		"API Reference: U(https://cloud.google.com/compute/docs/reference/v1/targetHttpsProxies)",
		"Official Documentation: U(https://cloud.google.com/compute/docs/load-balancing/http/target-proxies)",
		"for authentication, you can set service_account_file using the C(gcp_service_account_file) env variable.",
		"for authentication, you can set service_account_contents using the C(GCP_SERVICE_ACCOUNT_CONTENTS) env variable.",
		"For authentication, you can set service_account_email using the C(GCP_SERVICE_ACCOUNT_EMAIL) env variable.",
		"For authentication, you can set auth_kind using the C(GCP_AUTH_KIND) env variable.",
		"For authentication, you can set scopes using the C(GCP_SCOPES) env variable.",
		"Environment variables values will only be used if the playbook values are not set.",
		"The I(service_account_email) and I(service_account_file) options are mutually exclusive.",
	]
}
