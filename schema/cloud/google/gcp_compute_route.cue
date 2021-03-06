package ansible

module: gcp_compute_route: {
	module: "gcp_compute_route"
	description: [
		"Represents a Route resource.",
		"A route is a rule that specifies how certain packets should be handled by the virtual network. Routes are associated with virtual machines by tag, and the set of routes for a particular virtual machine is called its routing table. For each packet leaving a virtual machine, the system searches that virtual machine's routing table for a single best matching route.",
		"Routes match packets by destination IP address, preferring smaller or more specific ranges over larger ones. If there is a tie, the system selects the route with the smallest priority value. If there is still a tie, it uses the layer three and four packet headers to select just one of the remaining matching routes. The packet is then forwarded as specified by the next_hop field of the winning route -- either to another virtual machine destination, a virtual machine gateway or a Compute Engine-operated gateway. Packets that do not match any route in the sending virtual machine's routing table will be dropped.",
		"A Route resource must have exactly one specification of either nextHopGateway, nextHopInstance, nextHopIp, or nextHopVpnTunnel.",
	]

	short_description: "Creates a GCP Route"
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
		dest_range: {
			description: [
				"The destination range of outgoing packets that this route applies to.",
				"Only IPv4 is supported.",
			]
			required: true
			type:     "str"
		}
		description: {
			description: [
				"An optional description of this resource. Provide this property when you create the resource.",
			]

			required:      false
			type:          "str"
			version_added: "2.7"
		}
		name: {
			description: [
				"Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.",
			]

			required: true
			type:     "str"
		}
		network: {
			description: [
				"The network that this route applies to.",
				"This field represents a link to a Network resource in GCP. It can be specified in two ways. First, you can place a dictionary with key 'selfLink' and value of your resource's selfLink Alternatively, you can add `register: name-of-resource` to a gcp_compute_network task and then set this network field to \"{{ name-of-resource }}\"",
			]

			required: true
			type:     "dict"
		}
		priority: {
			description: [
				"The priority of this route. Priority is used to break ties in cases where there is more than one matching route of equal prefix length.",
				"In the case of two routes with equal prefix length, the one with the lowest-numbered priority value wins.",
				"Default value is 1000. Valid range is 0 through 65535.",
			]
			required: false
			type:     "int"
		}
		tags: {
			description: [
				"A list of instance tags to which this route applies.",
			]
			required: false
			type:     "list"
		}
		next_hop_gateway: {
			description: [
				"URL to a gateway that should handle matching packets.",
				"Currently, you can only specify the internet gateway, using a full or partial valid URL: * U(https://www.googleapis.com/compute/v1/projects/project/global/gateways/default-internet-gateway) * projects/project/global/gateways/default-internet-gateway * global/gateways/default-internet-gateway .",
			]

			required: false
			type:     "str"
		}
		next_hop_instance: {
			description: [
				"URL to an instance that should handle matching packets.",
				"You can specify this as a full or partial URL. For example: * U(https://www.googleapis.com/compute/v1/projects/project/zones/zone/) instances/instance * projects/project/zones/zone/instances/instance * zones/zone/instances/instance .",
				"This field represents a link to a Instance resource in GCP. It can be specified in two ways. First, you can place a dictionary with key 'selfLink' and value of your resource's selfLink Alternatively, you can add `register: name-of-resource` to a gcp_compute_instance task and then set this next_hop_instance field to \"{{ name-of-resource }}\"",
			]

			required: false
			type:     "dict"
		}
		next_hop_ip: {
			description: [
				"Network IP address of an instance that should handle matching packets.",
			]
			required: false
			type:     "str"
		}
		next_hop_vpn_tunnel: {
			description: [
				"URL to a VpnTunnel that should handle matching packets.",
				"This field represents a link to a VpnTunnel resource in GCP. It can be specified in two ways. First, you can place a dictionary with key 'selfLink' and value of your resource's selfLink Alternatively, you can add `register: name-of-resource` to a gcp_compute_vpn_tunnel task and then set this next_hop_vpn_tunnel field to \"{{ name-of-resource }}\"",
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
		"API Reference: U(https://cloud.google.com/compute/docs/reference/rest/v1/routes)",
		"Using Routes: U(https://cloud.google.com/vpc/docs/using-routes)",
		"for authentication, you can set service_account_file using the C(gcp_service_account_file) env variable.",
		"for authentication, you can set service_account_contents using the C(GCP_SERVICE_ACCOUNT_CONTENTS) env variable.",
		"For authentication, you can set service_account_email using the C(GCP_SERVICE_ACCOUNT_EMAIL) env variable.",
		"For authentication, you can set auth_kind using the C(GCP_AUTH_KIND) env variable.",
		"For authentication, you can set scopes using the C(GCP_SCOPES) env variable.",
		"Environment variables values will only be used if the playbook values are not set.",
		"The I(service_account_email) and I(service_account_file) options are mutually exclusive.",
	]
}
