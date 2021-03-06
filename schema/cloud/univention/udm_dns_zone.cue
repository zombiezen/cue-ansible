package ansible

module: udm_dns_zone: {
	module:        "udm_dns_zone"
	version_added: "2.2"
	author: ["Tobias Rüetschi (@keachi)"]
	short_description: "Manage dns zones on a univention corporate server"
	description: [
		"This module allows to manage dns zones on a univention corporate server (UCS). It uses the python API of the UCS to create a new object or edit it.",
	]

	requirements: ["Python >= 2.6"]
	options: {
		state: {
			required: false
			default:  "present"
			choices: ["present", "absent"]
			description: ["Whether the dns zone is present or not."]
		}
		type: {
			required: true
			choices: ["forward_zone", "reverse_zone"]
			description: ["Define if the zone is a forward or reverse DNS zone."]
		}
		zone: {
			required: true
			description: ["DNS zone name, e.g. C(example.com)."]
		}
		nameserver: {
			required: false
			description: ["List of appropriate name servers. Required if C(state=present)."]
		}
		interfaces: {
			required: false
			description: [
				"List of interface IP addresses, on which the server should response this zone. Required if C(state=present).",
			]
		}

		refresh: {
			required: false
			default:  3600
			description: ["Interval before the zone should be refreshed."]
		}
		retry: {
			required: false
			default:  1800
			description: ["Interval that should elapse before a failed refresh should be retried."]
		}
		expire: {
			required: false
			default:  604800
			description: ["Specifies the upper limit on the time interval that can elapse before the zone is no longer authoritative."]
		}
		ttl: {
			required: false
			default:  600
			description: ["Minimum TTL field that should be exported with any RR from this zone."]
		}

		contact: {
			required: false
			default:  ""
			description: ["Contact person in the SOA record."]
		}
		mx: {
			required: false
			default: []
			description: ["List of MX servers. (Must declared as A or AAAA records)."]
		}
	}
}
