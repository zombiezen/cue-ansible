package ansible

module: aws_config_aggregation_authorization: {
	module:            "aws_config_aggregation_authorization"
	short_description: "Manage cross-account AWS Config authorizations"
	description: [
		"Module manages AWS Config resources.",
	]
	version_added: "2.6"
	requirements: ["botocore", "boto3"]
	author: [
		"Aaron Smith (@slapula)",
	]
	options: {
		state: {
			description: [
				"Whether the Config rule should be present or absent.",
			]
			default: "present"
			choices: ["present", "absent"]
			type: "str"
		}
		authorized_account_id: {
			description: [
				"The 12-digit account ID of the account authorized to aggregate data.",
			]
			type: "str"
		}
		authorized_aws_region: {
			description: [
				"The region authorized to collect aggregated data.",
			]
			type: "str"
		}
	}
	extends_documentation_fragment: [
		"aws",
		"ec2",
	]
}
