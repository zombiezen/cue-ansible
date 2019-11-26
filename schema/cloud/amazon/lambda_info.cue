package ansible

module: lambda_info: {
	module:            "lambda_info"
	short_description: "Gathers AWS Lambda function details"
	description: [
		"Gathers various details related to Lambda functions, including aliases, versions and event source mappings.",
		"Use module M(lambda) to manage the lambda function itself, M(lambda_alias) to manage function aliases and M(lambda_event) to manage lambda event source mappings.",
	]

	version_added: "2.9"

	options: {
		query: {
			description: [
				"Specifies the resource type for which to gather information.  Leave blank to retrieve all information.",
			]
			required: true
			choices: ["aliases", "all", "config", "mappings", "policy", "versions"]
			default: "all"
			type:    "str"
		}
		function_name: {
			description: [
				"The name of the lambda function for which information is requested.",
			]
			aliases: ["function", "name"]
			type: "str"
		}
		event_source_arn: {
			description: [
				"When I(query=mappings), this is the Amazon Resource Name (ARN) of the Amazon Kinesis or DynamoDB stream.",
			]
			type: "str"
		}
	}
	author: "Pierre Jodouin (@pjodouin)"
	requirements: [
		"boto3",
	]
	extends_documentation_fragment: [
		"aws",
		"ec2",
	]
}
