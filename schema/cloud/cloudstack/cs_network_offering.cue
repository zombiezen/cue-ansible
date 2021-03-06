package ansible

module: cs_network_offering: {
	module:            "cs_network_offering"
	short_description: "Manages network offerings on Apache CloudStack based clouds."
	description: [
		"Create, update, enable, disable and remove network offerings.",
	]
	version_added: "2.5"
	author:        "David Passante (@dpassante)"
	options: {
		state: {
			description: [
				"State of the network offering.",
			]
			type: "str"
			choices: ["enabled", "present", "disabled", "absent"]
			default: "present"
		}
		display_text: {
			description: [
				"Display text of the network offerings.",
			]
			type: "str"
		}
		guest_ip_type: {
			description: [
				"Guest type of the network offering.",
			]
			type: "str"
			choices: ["Shared", "Isolated"]
		}
		name: {
			description: [
				"The name of the network offering.",
			]
			type:     "str"
			required: true
		}
		supported_services: {
			description: [
				"Services supported by the network offering.",
				"A list of one or more items from the choice list.",
			]
			type: "list"
			choices: ["Dns", "PortForwarding", "Dhcp", "SourceNat", "UserData", "Firewall", "StaticNat", "Vpn", "Lb"]
			aliases: ["supported_service"]
		}
		traffic_type: {
			description: [
				"The traffic type for the network offering.",
			]
			type:    "str"
			default: "Guest"
		}
		availability: {
			description: [
				"The availability of network offering. Default value is Optional",
			]
			type: "str"
		}
		conserve_mode: {
			description: [
				"Whether the network offering has IP conserve mode enabled.",
			]
			type: "bool"
		}
		details: {
			description: [
				"Network offering details in key/value pairs.",
				"with service provider as a value",
			]
			type: "list"
		}
		egress_default_policy: {
			description: [
				"Whether the default egress policy is allow or to deny.",
			]
			type: "str"
			choices: ["allow", "deny"]
		}
		persistent: {
			description: [
				"True if network offering supports persistent networks",
				"defaulted to false if not specified",
			]
			type: "bool"
		}
		keepalive_enabled: {
			description: [
				"If true keepalive will be turned on in the loadbalancer.",
				"At the time of writing this has only an effect on haproxy.",
				"the mode http and httpclose options are unset in the haproxy conf file.",
			]
			type: "bool"
		}
		max_connections: {
			description: [
				"Maximum number of concurrent connections supported by the network offering.",
			]
			type: "int"
		}
		network_rate: {
			description: [
				"Data transfer rate in megabits per second allowed.",
			]
			type: "int"
		}
		service_capabilities: {
			description: [
				"Desired service capabilities as part of network offering.",
			]
			type: "list"
			aliases: ["service_capability"]
		}
		service_offering: {
			description: [
				"The service offering name or ID used by virtual router provider.",
			]
			type: "str"
		}
		service_providers: {
			description: [
				"Provider to service mapping.",
				"If not specified, the provider for the service will be mapped to the default provider on the physical network.",
			]
			type: "list"
			aliases: ["service_provider"]
		}
		specify_ip_ranges: {
			description: [
				"Whether the network offering supports specifying IP ranges.",
				"Defaulted to C(no) by the API if not specified.",
			]
			type: "bool"
		}
		specify_vlan: {
			description: [
				"Whether the network offering supports vlans or not.",
			]
			type: "bool"
		}
		for_vpc: {
			description: [
				"Whether the offering is meant to be used for VPC or not.",
			]
			type:          "bool"
			version_added: "2.8"
		}
	}
	extends_documentation_fragment: "cloudstack"
}
