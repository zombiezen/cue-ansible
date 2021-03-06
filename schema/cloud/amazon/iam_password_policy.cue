package ansible

module: iam_password_policy: {
	module:            "iam_password_policy"
	short_description: "Update an IAM Password Policy"
	description: [
		"Module updates an IAM Password Policy on a given AWS account",
	]
	version_added: "2.8"
	requirements: ["botocore", "boto3"]
	author: [
		"Aaron Smith (@slapula)",
	]
	options: {
		state: {
			description: [
				"Specifies the overall state of the password policy.",
			]
			required: true
			choices: ["present", "absent"]
			type: "str"
		}
		min_pw_length: {
			description: [
				"Minimum password length.",
			]
			default: 6
			aliases: ["minimum_password_length"]
			type: "int"
		}
		require_symbols: {
			description: [
				"Require symbols in password.",
			]
			default: false
			type:    "bool"
		}
		require_numbers: {
			description: [
				"Require numbers in password.",
			]
			default: false
			type:    "bool"
		}
		require_uppercase: {
			description: [
				"Require uppercase letters in password.",
			]
			default: false
			type:    "bool"
		}
		require_lowercase: {
			description: [
				"Require lowercase letters in password.",
			]
			default: false
			type:    "bool"
		}
		allow_pw_change: {
			description: [
				"Allow users to change their password.",
			]
			default: false
			type:    "bool"
			aliases: ["allow_password_change"]
		}
		pw_max_age: {
			description: [
				"Maximum age for a password in days. When this option is 0 then passwords do not expire automatically.",
			]

			default: 0
			aliases: ["password_max_age"]
			type: "int"
		}
		pw_reuse_prevent: {
			description: [
				"Prevent re-use of passwords.",
			]
			default: 0
			aliases: ["password_reuse_prevent", "prevent_reuse"]
			type: "int"
		}
		pw_expire: {
			description: [
				"Prevents users from change an expired password.",
			]
			default: false
			type:    "bool"
			aliases: ["password_expire", "expire"]
		}
	}
	extends_documentation_fragment: [
		"aws",
		"ec2",
	]
}
