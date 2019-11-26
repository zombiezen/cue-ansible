package ansible

module: ec2_ami_info: {
	module:            "ec2_ami_info"
	version_added:     "2.5"
	short_description: "Gather information about ec2 AMIs"
	description: [
		"Gather information about ec2 AMIs",
		"This module was called C(ec2_ami_facts) before Ansible 2.9. The usage did not change.",
	]
	author: [
		"Prasad Katti (@prasadkatti)",
	]
	requirements: ["boto3"]
	options: {
		image_ids: {
			description: "One or more image IDs."
			aliases: ["image_id"]
			type:     "list"
			elements: "str"
		}
		filters: {
			description: [
				"A dict of filters to apply. Each dict item consists of a filter key and a filter value.",
				"See U(https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeImages.html) for possible filters.",
				"Filter names and values are case sensitive.",
			]
			type: "dict"
		}
		owners: {
			description: [
				"Filter the images by the owner. Valid options are an AWS account ID, self, or an AWS owner alias ( amazon | aws-marketplace | microsoft ).",
			]

			aliases: ["owner"]
			type:     "list"
			elements: "str"
		}
		executable_users: {
			description: [
				"Filter images by users with explicit launch permissions. Valid options are an AWS account ID, self, or all (public AMIs).",
			]
			aliases: ["executable_user"]
			type:     "list"
			elements: "str"
		}
		describe_image_attributes: {
			description: [
				"Describe attributes (like launchPermission) of the images found.",
			]
			default: false
			type:    "bool"
		}
	}

	extends_documentation_fragment: [
		"aws",
		"ec2",
	]
}
