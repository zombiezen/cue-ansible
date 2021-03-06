package ansible

module: route53_zone: {
	module:            "route53_zone"
	short_description: "add or delete Route53 zones"
	description: [
		"Creates and deletes Route53 private and public zones.",
	]
	version_added: "2.0"
	requirements: ["boto3"]
	options: {
		zone: {
			description: [
				"The DNS zone record (eg: foo.com.)",
			]
			required: true
			type:     "str"
		}
		state: {
			description: [
				"Whether or not the zone should exist or not.",
			]
			default: "present"
			choices: ["present", "absent"]
			type: "str"
		}
		vpc_id: {
			description: [
				"The VPC ID the zone should be a part of (if this is going to be a private zone).",
			]
			type: "str"
		}
		vpc_region: {
			description: [
				"The VPC Region the zone should be a part of (if this is going to be a private zone).",
			]
			type: "str"
		}
		comment: {
			description: [
				"Comment associated with the zone.",
			]
			default: ""
			type:    "str"
		}
		hosted_zone_id: {
			description: [
				"The unique zone identifier you want to delete or \"all\" if there are many zones with the same domain name.",
				"Required if there are multiple zones identified with the above options.",
			]
			version_added: 2.4
			type:          "str"
		}
		delegation_set_id: {
			description: [
				"The reusable delegation set ID to be associated with the zone.",
				"Note that you can't associate a reusable delegation set with a private hosted zone.",
			]
			version_added: 2.6
			type:          "str"
		}
	}
	extends_documentation_fragment: [
		"aws",
		"ec2",
	]
	author: "Christopher Troup (@minichate)"
}
