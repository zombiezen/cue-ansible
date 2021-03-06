package ansible

module: lambda: {
	module:            "lambda"
	short_description: "Manage AWS Lambda functions"
	description: [
		"Allows for the management of Lambda functions.",
	]
	version_added: "2.2"
	requirements: ["boto3"]
	options: {
		name: {
			description: [
				"The name you want to assign to the function you are uploading. Cannot be changed.",
			]
			required: true
			type:     "str"
		}
		state: {
			description: [
				"Create or delete Lambda function.",
			]
			default: "present"
			choices: ["present", "absent"]
			type: "str"
		}
		runtime: {
			description: [
				"The runtime environment for the Lambda function you are uploading.",
				"Required when creating a function. Uses parameters as described in boto3 docs.",
				"Required when I(state=present).",
				"For supported list of runtimes, see U(https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html).",
			]
			type: "str"
		}
		role: {
			description: [
				"The Amazon Resource Name (ARN) of the IAM role that Lambda assumes when it executes your function to access any other Amazon Web Services (AWS) resources. You may use the bare ARN if the role belongs to the same AWS account.",
				"Required when I(state=present).",
			]
			type: "str"
		}
		handler: {
			description: [
				"The function within your code that Lambda calls to begin execution.",
			]
			type: "str"
		}
		zip_file: {
			description: [
				"A .zip file containing your deployment package",
				"If I(state=present) then either I(zip_file) or I(s3_bucket) must be present.",
			]
			aliases: ["src"]
			type: "str"
		}
		s3_bucket: {
			description: [
				"Amazon S3 bucket name where the .zip file containing your deployment package is stored.",
				"If I(state=present) then either I(zip_file) or I(s3_bucket) must be present.",
				"I(s3_bucket) and I(s3_key) are required together.",
			]
			type: "str"
		}
		s3_key: {
			description: [
				"The Amazon S3 object (the deployment package) key name you want to upload.",
				"I(s3_bucket) and I(s3_key) are required together.",
			]
			type: "str"
		}
		s3_object_version: {
			description: [
				"The Amazon S3 object (the deployment package) version you want to upload.",
			]
			type: "str"
		}
		description: {
			description: [
				"A short, user-defined function description. Lambda does not use this value. Assign a meaningful description as you see fit.",
			]
			type: "str"
		}
		timeout: {
			description: [
				"The function maximum execution time in seconds after which Lambda should terminate the function.",
			]
			default: 3
			type:    "int"
		}
		memory_size: {
			description: [
				"The amount of memory, in MB, your Lambda function is given.",
			]
			default: 128
			type:    "int"
		}
		vpc_subnet_ids: {
			description: [
				"List of subnet IDs to run Lambda function in.",
				"Use this option if you need to access resources in your VPC. Leave empty if you don't want to run the function in a VPC.",
				"If set, I(vpc_security_group_ids) must also be set.",
			]
			type:     "list"
			elements: "str"
		}
		vpc_security_group_ids: {
			description: [
				"List of VPC security group IDs to associate with the Lambda function.",
				"Required when I(vpc_subnet_ids) is used.",
			]
			type:     "list"
			elements: "str"
		}
		environment_variables: {
			description: [
				"A dictionary of environment variables the Lambda function is given.",
			]
			version_added: "2.3"
			type:          "dict"
		}
		dead_letter_arn: {
			description: [
				"The parent object that contains the target Amazon Resource Name (ARN) of an Amazon SQS queue or Amazon SNS topic.",
			]
			version_added: "2.3"
			type:          "str"
		}
		tracing_mode: {
			description: [
				"Set mode to 'Active' to sample and trace incoming requests with AWS X-Ray. Turned off (set to 'PassThrough') by default.",
			]
			choices: ["Active", "PassThrough"]
			version_added: "2.10"
			type:          "str"
		}
		tags: {
			description: [
				"tag dict to apply to the function (requires botocore 1.5.40 or above).",
			]
			version_added: "2.5"
			type:          "dict"
		}
	}
	author: [
		"Steyn Huizinga (@steynovich)",
	]
	extends_documentation_fragment: [
		"aws",
		"ec2",
	]
}
