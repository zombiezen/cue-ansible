package ansible

module: nios_host_record: {
	module:            "nios_host_record"
	version_added:     "2.5"
	author:            "Peter Sprygada (@privateip)"
	short_description: "Configure Infoblox NIOS host records"
	description: [
		"Adds and/or removes instances of host record objects from Infoblox NIOS servers.  This module manages NIOS C(record:host) objects using the Infoblox WAPI interface over REST.",
		"Updates instances of host record object from Infoblox NIOS servers.",
	]
	requirements: [
		"infoblox-client",
	]
	extends_documentation_fragment: "nios"
	options: {
		name: {
			description: [
				"Specifies the fully qualified hostname to add or remove from the system. User can also update the hostname as it is possible to pass a dict containing I(new_name), I(old_name). See examples.",
			]

			required: true
		}
		view: {
			description: [
				"Sets the DNS view to associate this host record with.  The DNS view must already be configured on the system",
			]

			required: true
			default:  "default"
			aliases: [
				"dns_view",
			]
		}
		configure_for_dns: {
			version_added: "2.7"
			description: [
				"Sets the DNS to particular parent. If user needs to bypass DNS user can make the value to false.",
			]

			type:     "bool"
			required: false
			default:  true
			aliases: [
				"dns",
			]
		}
		ipv4addrs: {
			description: [
				"Configures the IPv4 addresses for this host record.  This argument accepts a list of values (see suboptions)",
			]

			aliases: [
				"ipv4",
			]
			suboptions: {
				ipv4addr: {
					description: [
						"Configures the IPv4 address for the host record. Users can dynamically allocate ipv4 address to host record by passing dictionary containing, I(nios_next_ip) and I(CIDR network range). If user wants to add or remove the ipv4 address from existing record, I(add/remove) params need to be used. See examples",
					]

					required: true
					aliases: [
						"address",
					]
				}
				configure_for_dhcp: {
					description: [
						"Configure the host_record over DHCP instead of DNS, if user changes it to true, user need to mention MAC address to configure",
					]

					required: false
					aliases: [
						"dhcp",
					]
				}
				mac: {
					description: [
						"Configures the hardware MAC address for the host record. If user makes DHCP to true, user need to mention MAC address.",
					]

					required: false
					aliases: [
						"mac",
					]
				}
				add: {
					version_added: "2.10"
					description: [
						"If user wants to add the ipv4 address to an existing host record. Note that with I(add) user will have to keep the I(state) as I(present), as new IP address is allocated to existing host record. See examples.",
					]

					type:     "bool"
					required: false
					aliases: [
						"add",
					]
				}
				remove: {
					version_added: "2.10"
					description: [
						"If user wants to remove the ipv4 address from an existing host record. Note that with I(remove) user will have to change the I(state) to I(absent), as IP address is de-allocated from an existing host record. See examples.",
					]

					type:     "bool"
					required: false
					aliases: [
						"remove",
					]
				}
			}
		}
		ipv6addrs: {
			description: [
				"Configures the IPv6 addresses for the host record.  This argument accepts a list of values (see options)",
			]

			aliases: [
				"ipv6",
			]
			suboptions: {
				ipv6addr: {
					description: [
						"Configures the IPv6 address for the host record",
					]
					required: true
					aliases: [
						"address",
					]
				}
				configure_for_dhcp: {
					description: [
						"Configure the host_record over DHCP instead of DNS, if user changes it to true, user need to mention MAC address to configure",
					]

					required: false
					aliases: [
						"dhcp",
					]
				}
			}
		}
		aliases: {
			version_added: "2.6"
			description: [
				"Configures an optional list of additional aliases to add to the host record. These are equivalent to CNAMEs but held within a host record. Must be in list format.",
			]
		}

		ttl: description: [
			"Configures the TTL to be associated with this host record",
		]
		extattrs: description: [
			"Allows for the configuration of Extensible Attributes on the instance of the object.  This argument accepts a set of key / value pairs for configuration.",
		]

		comment: description: [
			"Configures a text string comment to be associated with the instance of this object.  The provided text string will be configured on the object instance.",
		]

		state: {
			description: [
				"Configures the intended state of the instance of the object on the NIOS server.  When this value is set to C(present), the object is configured on the device and when this value is set to C(absent) the value is removed (if necessary) from the device.",
			]

			default: "present"
			choices: [
				"present",
				"absent",
			]
		}
	}
}
