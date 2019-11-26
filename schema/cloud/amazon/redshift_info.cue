package ansible

module: redshift_info: {
	module:            "redshift_info"
	author:            "Jens Carl (@j-carl)"
	short_description: "Gather information about Redshift cluster(s)"
	description: [
		"Gather information about Redshift cluster(s).",
		"This module was called C(redshift_facts) before Ansible 2.9. The usage did not change.",
	]
	version_added: "2.4"
	requirements: ["boto3"]
	options: {
		cluster_identifier: {
			description: [
				"The prefix of cluster identifier of the Redshift cluster you are searching for.",
				"This is a regular expression match with implicit '^'. Append '$' for a complete match.",
			]
			required: false
			aliases: ["name", "identifier"]
			type: "str"
		}
		tags: {
			description: [
				"A dictionary/hash of tags in the format { tag1_name: 'tag1_value', tag2_name: 'tag2_value' } to match against the security group(s) you are searching for.",
			]

			required: false
			type:     "dict"
		}
	}
	extends_documentation_fragment: [
		"ec2",
		"aws",
	]
}
