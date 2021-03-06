package ansible

module: gcp_compute_network_endpoint_group: {
	module: "gcp_compute_network_endpoint_group"
	description: [
		"Network endpoint groups (NEGs) are zonal resources that represent collections of IP address and port combinations for GCP resources within a single subnet. Each IP address and port combination is called a network endpoint.",
		"Network endpoint groups can be used as backends in backend services for HTTP(S), TCP proxy, and SSL proxy load balancers. You cannot use NEGs as a backend with internal load balancers. Because NEG backends allow you to specify IP addresses and ports, you can distribute traffic in a granular fashion among applications or containers running within VM instances.",
	]

	short_description: "Creates a GCP NetworkEndpointGroup"
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
		name: {
			description: [
				"Name of the resource; provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.",
			]

			required: true
			type:     "str"
		}
		description: {
			description: [
				"An optional description of this resource. Provide this property when you create the resource.",
			]

			required: false
			type:     "str"
		}
		network_endpoint_type: {
			description: [
				"Type of network endpoints in this network endpoint group. Currently the only supported value is GCE_VM_IP_PORT.",
				"Some valid choices include: \"GCE_VM_IP_PORT\"",
			]
			required: false
			default:  "GCE_VM_IP_PORT"
			type:     "str"
		}
		network: {
			description: [
				"The network to which all network endpoints in the NEG belong.",
				"Uses \"default\" project network if unspecified.",
				"This field represents a link to a Network resource in GCP. It can be specified in two ways. First, you can place a dictionary with key 'selfLink' and value of your resource's selfLink Alternatively, you can add `register: name-of-resource` to a gcp_compute_network task and then set this network field to \"{{ name-of-resource }}\"",
			]

			required: true
			type:     "dict"
		}
		subnetwork: {
			description: [
				"Optional subnetwork to which all network endpoints in the NEG belong.",
				"This field represents a link to a Subnetwork resource in GCP. It can be specified in two ways. First, you can place a dictionary with key 'selfLink' and value of your resource's selfLink Alternatively, you can add `register: name-of-resource` to a gcp_compute_subnetwork task and then set this subnetwork field to \"{{ name-of-resource }}\"",
			]

			required: false
			type:     "dict"
		}
		default_port: {
			description: [
				"The default port used if the port number is not specified in the network endpoint.",
			]
			required: false
			type:     "int"
		}
		zone: {
			description: [
				"Zone where the network endpoint group is located.",
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
	notes: [
		"API Reference: U(https://cloud.google.com/compute/docs/reference/rest/beta/networkEndpointGroups)",
		"Official Documentation: U(https://cloud.google.com/load-balancing/docs/negs/)",
		"for authentication, you can set service_account_file using the C(gcp_service_account_file) env variable.",
		"for authentication, you can set service_account_contents using the C(GCP_SERVICE_ACCOUNT_CONTENTS) env variable.",
		"For authentication, you can set service_account_email using the C(GCP_SERVICE_ACCOUNT_EMAIL) env variable.",
		"For authentication, you can set auth_kind using the C(GCP_AUTH_KIND) env variable.",
		"For authentication, you can set scopes using the C(GCP_SCOPES) env variable.",
		"Environment variables values will only be used if the playbook values are not set.",
		"The I(service_account_email) and I(service_account_file) options are mutually exclusive.",
	]
}
