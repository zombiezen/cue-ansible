package ansible

module: ipa_dnsrecord: {
	module:            "ipa_dnsrecord"
	author:            "Abhijeet Kasurde (@Akasurde)"
	short_description: "Manage FreeIPA DNS records"
	description: [
		"Add, modify and delete an IPA DNS Record using IPA API.",
	]
	options: {
		zone_name: {
			description: [
				"The DNS zone name to which DNS record needs to be managed.",
			]
			required: true
		}
		record_name: {
			description: [
				"The DNS record name to manage.",
			]
			required: true
			aliases: ["name"]
		}
		record_type: {
			description: [
				"The type of DNS record name.",
				"Currently, 'A', 'AAAA', 'A6', 'CNAME', 'DNAME', 'PTR', 'TXT', 'SRV' and 'MX' are supported.",
				"'A6', 'CNAME', 'DNAME' and 'TXT' are added in version 2.5.",
				"'SRV' and 'MX' are added in version 2.8.",
			]
			required: false
			default:  "A"
			choices: ["A", "AAAA", "A6", "CNAME", "DNAME", "PTR", "TXT", "SRV", "MX"]
		}
		record_value: {
			description: [
				"Manage DNS record name with this value.",
				"In the case of 'A' or 'AAAA' record types, this will be the IP address.",
				"In the case of 'A6' record type, this will be the A6 Record data.",
				"In the case of 'CNAME' record type, this will be the hostname.",
				"In the case of 'DNAME' record type, this will be the DNAME target.",
				"In the case of 'PTR' record type, this will be the hostname.",
				"In the case of 'TXT' record type, this will be a text.",
				"In the case of 'SRV' record type, this will be a service record.",
				"In the case of 'MX' record type, this will be a mail exchanger record.",
			]
			required: true
		}
		record_ttl: {
			description: [
				"Set the TTL for the record.",
				"Applies only when adding a new or changing the value of record_value.",
			]
			version_added: "2.7"
			required:      false
		}
		state: {
			description: "State to ensure"
			required:    false
			default:     "present"
			choices: ["present", "absent"]
		}
	}
	extends_documentation_fragment: "ipa.documentation"
	version_added:                  "2.4"
}
