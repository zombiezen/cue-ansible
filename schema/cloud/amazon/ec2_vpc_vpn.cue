package ansible

module: ec2_vpc_vpn: {
	module:            "ec2_vpc_vpn"
	short_description: "Create, modify, and delete EC2 VPN connections."
	description: [
		"This module creates, modifies, and deletes VPN connections. Idempotence is achieved by using the filters option or specifying the VPN connection identifier.",
	]

	version_added: "2.4"
	extends_documentation_fragment: [
		"ec2",
		"aws",
	]
	requirements: ["boto3", "botocore"]
	author: "Sloane Hertel (@s-hertel)"
	options: {
		state: {
			description: [
				"The desired state of the VPN connection.",
			]
			choices: ["present", "absent"]
			default:  "present"
			required: false
			type:     "str"
		}
		customer_gateway_id: {
			description: [
				"The ID of the customer gateway.",
			]
			type: "str"
		}
		connection_type: {
			description: [
				"The type of VPN connection.",
				"At this time only 'ipsec.1' is supported.",
			]
			default: "ipsec.1"
			type:    "str"
		}
		vpn_gateway_id: {
			description: [
				"The ID of the virtual private gateway.",
			]
			type: "str"
		}
		vpn_connection_id: {
			description: [
				"The ID of the VPN connection. Required to modify or delete a connection if the filters option does not provide a unique match.",
			]
			type: "str"
		}
		tags: {
			description: [
				"Tags to attach to the VPN connection.",
			]
			type: "dict"
		}
		purge_tags: {
			description: [
				"Whether or not to delete VPN connections tags that are associated with the connection but not specified in the task.",
			]
			type:    "bool"
			default: false
		}
		static_only: {
			description: [
				"Indicates whether the VPN connection uses static routes only. Static routes must be used for devices that don't support BGP.",
			]
			default:  false
			type:     "bool"
			required: false
		}
		tunnel_options: {
			description: [
				"An optional list object containing no more than two dict members, each of which may contain 'TunnelInsideCidr' and/or 'PreSharedKey' keys with appropriate string values.  AWS defaults will apply in absence of either of the aforementioned keys.",
			]

			required:      false
			version_added: "2.5"
			type:          "list"
			elements:      "dict"
			suboptions: {
				TunnelInsideCidr: {
					type:        "str"
					description: "The range of inside IP addresses for the tunnel."
				}
				PreSharedKey: {
					type:        "str"
					description: "The pre-shared key (PSK) to establish initial authentication between the virtual private gateway and customer gateway."
				}
			}
		}
		filters: {
			description: [
				"An alternative to using vpn_connection_id. If multiple matches are found, vpn_connection_id is required. If one of the following suboptions is a list of items to filter by, only one item needs to match to find the VPN that correlates. e.g. if the filter 'cidr' is ['194.168.2.0/24', '192.168.2.0/24'] and the VPN route only has the destination cidr block of '192.168.2.0/24' it will be found with this filter (assuming there are not multiple VPNs that are matched). Another example, if the filter 'vpn' is equal to ['vpn-ccf7e7ad', 'vpn-cb0ae2a2'] and one of of the VPNs has the state deleted (exists but is unmodifiable) and the other exists and is not deleted, it will be found via this filter. See examples.",
			]

			suboptions: {
				"cgw-config": description: [
					"The customer gateway configuration of the VPN as a string (in the format of the return value) or a list of those strings.",
				]
				"static-routes-only": description: [
					"The type of routing; true or false.",
				]
				cidr: description: [
					"The destination cidr of the VPN's route as a string or a list of those strings.",
				]
				bgp: description: [
					"The BGP ASN number associated with a BGP device. Only works if the connection is attached. This filtering option is currently not working.",
				]

				vpn: description: [
					"The VPN connection id as a string or a list of those strings.",
				]
				vgw: description: [
					"The virtual private gateway as a string or a list of those strings.",
				]
				"tag-keys": description: [
					"The key of a tag as a string or a list of those strings.",
				]
				"tag-values": description: [
					"The value of a tag as a string or a list of those strings.",
				]
				tags: description: [
					"A dict of key value pairs.",
				]
				cgw: description: [
					"The customer gateway id as a string or a list of those strings.",
				]
			}
			type: "dict"
		}
		routes: {
			description: [
				"Routes to add to the connection.",
			]
			type:     "list"
			elements: "str"
		}
		purge_routes: {
			description: [
				"Whether or not to delete VPN connections routes that are not specified in the task.",
			]
			type: "bool"
		}
		wait_timeout: {
			description: [
				"How long before wait gives up, in seconds.",
			]
			default:       600
			type:          "int"
			required:      false
			version_added: "2.8"
		}
		delay: {
			description: [
				"The time to wait before checking operation again. in seconds.",
			]
			required:      false
			type:          "int"
			default:       15
			version_added: "2.8"
		}
	}
}
