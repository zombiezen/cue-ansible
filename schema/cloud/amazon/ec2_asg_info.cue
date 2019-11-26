package ansible

module: ec2_asg_info: {
	module:            "ec2_asg_info"
	short_description: "Gather information about ec2 Auto Scaling Groups (ASGs) in AWS"
	description: [
		"Gather information about ec2 Auto Scaling Groups (ASGs) in AWS",
		"This module was called C(ec2_asg_facts) before Ansible 2.9. The usage did not change.",
	]
	version_added: "2.2"
	requirements: ["boto3"]
	author: "Rob White (@wimnat)"
	options: {
		name: {
			description: [
				"The prefix or name of the auto scaling group(s) you are searching for.",
				"Note: This is a regular expression match with implicit '^' (beginning of string). Append '$' for a complete name match.",
			]
			type:     "str"
			required: false
		}
		tags: {
			description: [
				"""
		A dictionary/hash of tags in the format { tag1_name: 'tag1_value', tag2_name: 'tag2_value' } to match against the auto scaling group(s) you are searching for.

		""",
			]

			required: false
			type:     "dict"
		}
	}
	extends_documentation_fragment: [
		"aws",
		"ec2",
	]
}
