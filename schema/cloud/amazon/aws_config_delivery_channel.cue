package ansible

module: aws_config_delivery_channel: {
	module:            "aws_config_delivery_channel"
	short_description: "Manage AWS Config delivery channels"
	description: [
		"This module manages AWS Config delivery locations for rule checks and configuration info.",
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
		s3_bucket: {
			description: [
				"The name of the Amazon S3 bucket to which AWS Config delivers configuration snapshots and configuration history files.",
			]
			type: "str"
		}
		s3_prefix: {
			description: [
				"The prefix for the specified Amazon S3 bucket.",
			]
			type: "str"
		}
		sns_topic_arn: {
			description: [
				"The Amazon Resource Name (ARN) of the Amazon SNS topic to which AWS Config sends notifications about configuration changes.",
			]
			type: "str"
		}
		delivery_frequency: {
			description: [
				"The frequency with which AWS Config delivers configuration snapshots.",
			]
			choices: ["One_Hour", "Three_Hours", "Six_Hours", "Twelve_Hours", "TwentyFour_Hours"]
			type: "str"
		}
	}
	extends_documentation_fragment: [
		"aws",
		"ec2",
	]
}
