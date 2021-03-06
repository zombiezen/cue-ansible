package ansible

module: route53: {
	module:            "route53"
	version_added:     "1.3"
	short_description: "add or delete entries in Amazons Route53 DNS service"
	description: [
		"Creates and deletes DNS records in Amazons Route53 service",
	]
	options: {
		state: {
			description: [
				"Specifies the state of the resource record. As of Ansible 2.4, the I(command) option has been changed to I(state) as default and the choices 'present' and 'absent' have been added, but I(command) still works as well.",
			]

			required: true
			aliases: ["command"]
			choices: ["present", "absent", "get", "create", "delete"]
			type: "str"
		}
		zone: {
			description: [
				"The DNS zone to modify.",
				"This is a required parameter, if parameter I(hosted_zone_id) is not supplied.",
			]
			type: "str"
		}
		hosted_zone_id: {
			description: [
				"The Hosted Zone ID of the DNS zone to modify.",
				"This is a required parameter, if parameter I(zone) is not supplied.",
			]
			version_added: "2.0"
			type:          "str"
		}
		record: {
			description: [
				"The full DNS record to create or delete.",
			]
			required: true
			type:     "str"
		}
		ttl: {
			description: [
				"The TTL, in second, to give the new record.",
			]
			default: 3600
			type:    "int"
		}
		type: {
			description: [
				"The type of DNS record to create.",
			]
			required: true
			choices: ["A", "CNAME", "MX", "AAAA", "TXT", "PTR", "SRV", "SPF", "CAA", "NS", "SOA"]
			type: "str"
		}
		alias: {
			description: [
				"Indicates if this is an alias record.",
			]
			version_added: "1.9"
			type:          "bool"
			default:       false
		}
		alias_hosted_zone_id: {
			description: [
				"The hosted zone identifier.",
			]
			version_added: "1.9"
			type:          "str"
		}
		alias_evaluate_target_health: {
			description: [
				"Whether or not to evaluate an alias target health. Useful for aliases to Elastic Load Balancers.",
			]
			type:          "bool"
			default:       false
			version_added: "2.1"
		}
		value: {
			description: [
				"The new value when creating a DNS record.  YAML lists or multiple comma-spaced values are allowed for non-alias records.",
				"When deleting a record all values for the record must be specified or Route53 will not delete it.",
			]
			type: "list"
		}
		overwrite: {
			description: [
				"Whether an existing record should be overwritten on create if values do not match.",
			]
			type: "bool"
		}
		retry_interval: {
			description: [
				"In the case that route53 is still servicing a prior request, this module will wait and try again after this many seconds. If you have many domain names, the default of 500 seconds may be too long.",
			]

			default: 500
			type:    "int"
		}
		private_zone: {
			description: [
				"If set to C(yes), the private zone matching the requested name within the domain will be used if there are both public and private zones. The default is to use the public zone.",
			]

			type:          "bool"
			default:       false
			version_added: "1.9"
		}
		identifier: {
			description: [
				"Have to be specified for Weighted, latency-based and failover resource record sets only. An identifier that differentiates among multiple resource record sets that have the same combination of DNS name and type.",
			]

			version_added: "2.0"
			type:          "str"
		}
		weight: {
			description: [
				"Weighted resource record sets only. Among resource record sets that have the same combination of DNS name and type, a value that determines what portion of traffic for the current resource record set is routed to the associated location.",
			]

			version_added: "2.0"
			type:          "int"
		}
		region: {
			description: [
				"Latency-based resource record sets only Among resource record sets that have the same combination of DNS name and type, a value that determines which region this should be associated with for the latency-based routing",
			]

			version_added: "2.0"
			type:          "str"
		}
		health_check: {
			description: [
				"Health check to associate with this record",
			]
			version_added: "2.0"
			type:          "str"
		}
		failover: {
			description: [
				"Failover resource record sets only. Whether this is the primary or secondary resource record set. Allowed values are PRIMARY and SECONDARY",
			]

			version_added: "2.0"
			type:          "str"
			choices: ["SECONDARY", "PRIMARY"]
		}
		vpc_id: {
			description: [
				"When used in conjunction with private_zone: true, this will only modify records in the private hosted zone attached to this VPC.",
				"This allows you to have multiple private hosted zones, all with the same name, attached to different VPCs.",
			]
			version_added: "2.0"
			type:          "str"
		}
		wait: {
			description: [
				"Wait until the changes have been replicated to all Amazon Route 53 DNS servers.",
			]
			type:          "bool"
			default:       false
			version_added: "2.1"
		}
		wait_timeout: {
			description: [
				"How long to wait for the changes to be replicated, in seconds.",
			]
			default:       300
			version_added: "2.1"
			type:          "int"
		}
	}
	author: [
		"Bruce Pennypacker (@bpennypacker)",
		"Mike Buzzetti (@jimbydamonk)",
	]
	extends_documentation_fragment: "aws"
}
