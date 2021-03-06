package ansible

module: aws_config_recorder: {
	module:            "aws_config_recorder"
	short_description: "Manage AWS Config Recorders"
	description: [
		"Module manages AWS Config configuration recorder settings.",
	]
	version_added: "2.6"
	requirements: ["botocore", "boto3"]
	author: [
		"Aaron Smith (@slapula)",
	]
	options: {
		name: {
			description: [
				"The name of the AWS Config resource.",
			]
			required: true
			type:     "str"
		}
		state: {
			description: [
				"Whether the Config rule should be present or absent.",
			]
			default: "present"
			choices: ["present", "absent"]
			type: "str"
		}
		role_arn: {
			description: [
				"Amazon Resource Name (ARN) of the IAM role used to describe the AWS resources associated with the account.",
				"Required when I(state=present).",
			]
			type: "str"
		}
		recording_group: {
			description: [
				"Specifies the types of AWS resources for which AWS Config records configuration changes.",
				"Required when I(state=present)",
			]
			suboptions: {
				all_supported: description: [
					"Specifies whether AWS Config records configuration changes for every supported type of regional resource.",
					"If I(all_supported=true), when AWS Config adds support for a new type of regional resource, it starts recording resources of that type automatically.",
					"If I(all_supported=true), you cannot enumerate a list of I(resource_types).",
				]
				include_global_types: description: [
					"Specifies whether AWS Config includes all supported types of global resources (for example, IAM resources) with the resources that it records.",
					"The configuration details for any global resource are the same in all regions. To prevent duplicate configuration items, you should consider customizing AWS Config in only one region to record global resources.",
					"If you set I(include_global_types=true), you must also set I(all_supported=true).",
					"If you set I(include_global_types=true), when AWS Config adds support for a new type of global resource, it starts recording resources of that type automatically.",
				]

				resource_types: description: [
					"A list that specifies the types of AWS resources for which AWS Config records configuration changes (for example, C(AWS::EC2::Instance) or C(AWS::CloudTrail::Trail)).",
					"Before you can set this option, you must set I(all_supported=false).",
				]
			}
			type: "dict"
		}
	}
	extends_documentation_fragment: [
		"aws",
		"ec2",
	]
}
