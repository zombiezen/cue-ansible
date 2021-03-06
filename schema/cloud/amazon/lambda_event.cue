package ansible

module: lambda_event: {
	module:            "lambda_event"
	short_description: "Creates, updates or deletes AWS Lambda function event mappings."
	description: [
		"This module allows the management of AWS Lambda function event source mappings such as DynamoDB and Kinesis stream events via the Ansible framework. These event source mappings are relevant only in the AWS Lambda pull model, where AWS Lambda invokes the function. It is idempotent and supports \"Check\" mode.  Use module M(lambda) to manage the lambda function itself and M(lambda_alias) to manage function aliases.",
	]

	version_added: "2.2"

	author: "Pierre Jodouin (@pjodouin), Ryan Brown (@ryansb)"
	options: {
		lambda_function_arn: {
			description: [
				"The name or ARN of the lambda function.",
			]
			required: true
			aliases: ["function_name", "function_arn"]
			type: "str"
		}
		state: {
			description: [
				"Describes the desired state.",
			]
			required: true
			default:  "present"
			choices: ["present", "absent"]
			type: "str"
		}
		alias: {
			description: [
				"Name of the function alias. Mutually exclusive with I(version).",
			]
			required: true
			type:     "str"
		}
		version: {
			description: [
				"Version of the Lambda function. Mutually exclusive with I(alias).",
			]
			required: false
			type:     "int"
		}
		event_source: {
			description: [
				"Source of the event that triggers the lambda function.",
				"For DynamoDB and Kinesis events, select C(stream)",
				"For SQS queues, select C(sqs)",
			]
			required: false
			default:  "stream"
			choices: ["stream", "sqs"]
			type: "str"
		}
		source_params: {
			description: [
				"Sub-parameters required for event source.",
			]
			suboptions: {
				source_arn: {
					description: [
						"The Amazon Resource Name (ARN) of the SQS queue, Kinesis stream or DynamoDB stream that is the event source.",
					]
					type:     "str"
					required: true
				}
				enabled: {
					description: [
						"Indicates whether AWS Lambda should begin polling or readin from the event source.",
					]
					default: "true."
					type:    "bool"
				}
				batch_size: {
					description: [
						"The largest number of records that AWS Lambda will retrieve from your event source at the time of invoking your function.",
					]
					default: 100
					type:    "int"
				}
				starting_position: {
					description: [
						"The position in the stream where AWS Lambda should start reading.",
						"Required when I(event_source=stream).",
					]
					choices: ["TRIM_HORIZON", "LATEST"]
					type: "str"
				}
			}
			required: true
			type:     "dict"
		}
	}
	requirements: [
		"boto3",
	]
	extends_documentation_fragment: [
		"aws",
		"ec2",
	]
}
