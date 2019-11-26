package ansible

module: aws_kms_info: {
	module:            "aws_kms_info"
	short_description: "Gather information about AWS KMS keys"
	description: [
		"Gather information about AWS KMS keys including tags and grants",
		"This module was called C(aws_kms_facts) before Ansible 2.9. The usage did not change.",
	]
	version_added: "2.5"
	author:        "Will Thames (@willthames)"
	options: {
		filters: {
			description: [
				"A dict of filters to apply. Each dict item consists of a filter key and a filter value. The filters aren't natively supported by boto3, but are supported to provide similar functionality to other modules. Standard tag filters (C(tag-key), C(tag-value) and C(tag:tagName)) are available, as are C(key-id) and C(alias)",
			]

			type: "dict"
		}
		pending_deletion: {
			description: "Whether to get full details (tags, grants etc.) of keys pending deletion"
			default:     false
			type:        "bool"
		}
	}
	extends_documentation_fragment: [
		"aws",
		"ec2",
	]
}
