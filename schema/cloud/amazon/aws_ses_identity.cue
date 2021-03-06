package ansible

module: aws_ses_identity: {
	module:            "aws_ses_identity"
	short_description: "Manages SES email and domain identity"
	description: [
		"This module allows the user to manage verified email and domain identity for SES.",
		"This covers verifying and removing identities as well as setting up complaint, bounce and delivery notification settings.",
	]

	version_added: "2.5"
	author:        "Ed Costello    (@orthanc)"

	options: {
		identity: {
			description: [
				"This is the email address or domain to verify / delete.",
				"If this contains an '@' then it will be considered an email. Otherwise it will be considered a domain.",
			]
			required: true
			type:     "str"
		}
		state: {
			description: "Whether to create(or update) or delete the identity."
			default:     "present"
			choices: ["present", "absent"]
			type: "str"
		}
		bounce_notifications: {
			description: [
				"Setup the SNS topic used to report bounce notifications.",
				"If omitted, bounce notifications will not be delivered to a SNS topic.",
				"If bounce notifications are not delivered to a SNS topic, I(feedback_forwarding) must be enabled.",
			]
			suboptions: {
				topic: description: [
					"The ARN of the topic to send notifications to.",
					"If omitted, notifications will not be delivered to a SNS topic.",
				]
				include_headers: {
					description: [
						"Whether or not to include headers when delivering to the SNS topic.",
						"If I(topic) is not specified this will have no impact, but the SES setting is updated even if there is no topic.",
					]
					type:    "bool"
					default: false
				}
			}
			type: "dict"
		}
		complaint_notifications: {
			description: [
				"Setup the SNS topic used to report complaint notifications.",
				"If omitted, complaint notifications will not be delivered to a SNS topic.",
				"If complaint notifications are not delivered to a SNS topic, I(feedback_forwarding) must be enabled.",
			]
			suboptions: {
				topic: description: [
					"The ARN of the topic to send notifications to.",
					"If omitted, notifications will not be delivered to a SNS topic.",
				]
				include_headers: {
					description: [
						"Whether or not to include headers when delivering to the SNS topic.",
						"If I(topic) is not specified this will have no impact, but the SES setting is updated even if there is no topic.",
					]
					type:    "bool"
					default: false
				}
			}
			type: "dict"
		}
		delivery_notifications: {
			description: [
				"Setup the SNS topic used to report delivery notifications.",
				"If omitted, delivery notifications will not be delivered to a SNS topic.",
			]
			suboptions: {
				topic: description: [
					"The ARN of the topic to send notifications to.",
					"If omitted, notifications will not be delivered to a SNS topic.",
				]
				include_headers: {
					description: [
						"Whether or not to include headers when delivering to the SNS topic.",
						"If I(topic) is not specified this will have no impact, but the SES setting is updated even if there is no topic.",
					]
					type:    "bool"
					default: false
				}
			}
			type: "dict"
		}
		feedback_forwarding: {
			description: [
				"Whether or not to enable feedback forwarding.",
				"This can only be false if both I(bounce_notifications) and I(complaint_notifications) specify SNS topics.",
			]
			type:    "bool"
			default: true
		}
	}
	requirements: ["botocore", "boto3"]
	extends_documentation_fragment: [
		"aws",
		"ec2",
	]
}
