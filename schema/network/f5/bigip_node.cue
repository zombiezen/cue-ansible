package ansible

module: bigip_node: {
	module:            "bigip_node"
	short_description: "Manages F5 BIG-IP LTM nodes"
	description: [
		"Manages F5 BIG-IP LTM nodes.",
	]
	version_added: 1.4
	options: {
		state: {
			description: [
				"Specifies the current state of the node. C(enabled) (All traffic allowed), specifies that system sends traffic to this node regardless of the node's state. C(disabled) (Only persistent or active connections allowed), Specifies that the node can handle only persistent or active connections. C(offline) (Only active connections allowed), Specifies that the node can handle only active connections. In all cases except C(absent), the node will be created if it does not yet exist.",
				"Be particularly careful about changing the status of a node whose FQDN cannot be resolved. These situations disable your ability to change their C(state) to C(disabled) or C(offline). They will remain in an *Unavailable - Enabled* state.",
			]

			type: "str"
			choices: [
				"present",
				"absent",
				"enabled",
				"disabled",
				"offline",
			]
			default: "present"
		}
		name: {
			description: [
				"Specifies the name of the node.",
			]
			type:     "str"
			required: true
		}
		monitor_type: {
			description: [
				"Monitor rule type when C(monitors) is specified. When creating a new pool, if this value is not specified, the default of 'and_list' will be used.",
				"Both C(single) and C(and_list) are functionally identical since BIG-IP considers all monitors as \"a list\". BIG=IP either has a list of many, or it has a list of one. Where they differ is in the extra guards that C(single) provides; namely that it only allows a single monitor.",
			]

			version_added: "1.3"
			type:          "str"
			choices: [
				"and_list",
				"m_of_n",
				"single",
			]
		}
		quorum: {
			description: [
				"Monitor quorum value when C(monitor_type) is C(m_of_n).",
			]
			type:          "int"
			version_added: 2.2
		}
		monitors: {
			description: [
				"Specifies the health monitors that the system currently uses to monitor this node.",
			]

			type:          "list"
			version_added: 2.2
		}
		address: {
			description: [
				"IP address of the node. This can be either IPv4 or IPv6. When creating a new node, one of either C(address) or C(fqdn) must be provided. This parameter cannot be updated after it is set.",
			]

			type: "str"
			aliases: [
				"ip",
				"host",
			]
			version_added: 2.2
		}
		fqdn: {
			description: [
				"FQDN name of the node. This can be any name that is a valid RFC 1123 DNS name. Therefore, the only characters that can be used are \"A\" to \"Z\", \"a\" to \"z\", \"0\" to \"9\", the hyphen (\"-\") and the period (\".\").",
				"FQDN names must include at lease one period; delineating the host from the domain. ex. C(host.domain).",
				"FQDN names must end with a letter or a number.",
				"When creating a new node, one of either C(address) or C(fqdn) must be provided. This parameter cannot be updated after it is set.",
			]

			type: "str"
			aliases: [
				"hostname",
			]
			version_added: 2.5
		}
		fqdn_address_type: {
			description: [
				"Specifies whether the FQDN of the node resolves to an IPv4 or IPv6 address.",
				"When creating a new node, if this parameter is not specified and C(fqdn) is specified, this parameter will default to C(ipv4).",
				"This parameter cannot be changed after it has been set.",
			]
			type: "str"
			choices: [
				"ipv4",
				"ipv6",
				"all",
			]
			version_added: 2.6
		}
		fqdn_auto_populate: {
			description: [
				"Specifies whether the system automatically creates ephemeral nodes using the IP addresses returned by the resolution of a DNS query for a node defined by an FQDN.",
				"When C(yes), the system generates an ephemeral node for each IP address returned in response to a DNS query for the FQDN of the node. Additionally, when a DNS response indicates the IP address of an ephemeral node no longer exists, the system deletes the ephemeral node.",
				"When C(no), the system resolves a DNS query for the FQDN of the node with the single IP address associated with the FQDN.",
				"When creating a new node, if this parameter is not specified and C(fqdn) is specified, this parameter will default to C(yes).",
				"This parameter cannot be changed after it has been set.",
			]
			type:          "bool"
			version_added: 2.6
		}
		fqdn_up_interval: {
			description: [
				"Specifies the interval in which a query occurs, when the DNS server is up. The associated monitor attempts to probe three times, and marks the server down if it there is no response within the span of three times the interval value, in seconds.",
				"This parameter accepts a value of C(ttl) to query based off of the TTL of the FQDN. The default TTL interval is akin to specifying C(3600).",
				"When creating a new node, if this parameter is not specified and C(fqdn) is specified, this parameter will default to C(3600).",
			]

			type:          "str"
			version_added: 2.6
		}
		fqdn_down_interval: {
			description: [
				"Specifies the interval in which a query occurs, when the DNS server is down. The associated monitor continues polling as long as the DNS server is down.",
				"When creating a new node, if this parameter is not specified and C(fqdn) is specified, this parameter will default to C(5).",
			]

			type:          "int"
			version_added: 2.6
		}
		description: {
			description: [
				"Specifies descriptive text that identifies the node.",
				"You can remove a description by either specifying an empty string, or by specifying the special value C(none).",
			]

			type: "str"
		}
		connection_limit: {
			description: [
				"Node connection limit. Setting this to 0 disables the limit.",
			]
			type:          "int"
			version_added: 2.7
		}
		rate_limit: {
			description: [
				"Node rate limit (connections-per-second). Setting this to 0 disables the limit.",
			]
			type:          "int"
			version_added: 2.7
		}
		ratio: {
			description: [
				"Node ratio weight. Valid values range from 1 through 100.",
				"When creating a new node, if this parameter is not specified, the default of C(1) will be used.",
			]

			type:          "int"
			version_added: 2.7
		}
		dynamic_ratio: {
			description: [
				"The dynamic ratio number for the node. Used for dynamic ratio load balancing.",
				"When creating a new node, if this parameter is not specified, the default of C(1) will be used.",
			]

			type:          "int"
			version_added: 2.7
		}
		availability_requirements: {
			description: [
				"Specifies, if you activate more than one health monitor, the number of health monitors that must receive successful responses in order for the link to be considered available.",
			]

			suboptions: {
				type: {
					description: [
						"Monitor rule type when C(monitors) is specified.",
						"When creating a new pool, if this value is not specified, the default of 'all' will be used.",
					]

					type: "str"
					choices: [
						"all",
						"at_least",
					]
				}
				at_least: {
					description: [
						"Specifies the minimum number of active health monitors that must be successful before the link is considered up.",
						"This parameter is only relevant when a C(type) of C(at_least) is used.",
						"This parameter will be ignored if a type of C(all) is used.",
					]
					type: "int"
				}
			}
			type:          "dict"
			version_added: 2.8
		}
		partition: {
			description: [
				"Device partition to manage resources on.",
			]
			type:          "str"
			default:       "Common"
			version_added: 2.5
		}
	}
	extends_documentation_fragment: "f5"
	author: [
		"Tim Rupp (@caphrim007)",
		"Wojciech Wypior (@wojtek0806)",
	]
}
