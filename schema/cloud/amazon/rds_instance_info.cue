package ansible

module: rds_instance_info: {
	module:            "rds_instance_info"
	version_added:     "2.6"
	short_description: "obtain information about one or more RDS instances"
	description: [
		"Obtain information about one or more RDS instances.",
		"This module was called C(rds_instance_facts) before Ansible 2.9. The usage did not change.",
	]
	options: {
		db_instance_identifier: {
			description: [
				"The RDS instance's unique identifier.",
			]
			required: false
			aliases: [
				"id",
			]
			type: "str"
		}
		filters: {
			description: [
				"A filter that specifies one or more DB instances to describe. See U(https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_DescribeDBInstances.html)",
			]

			type: "dict"
		}
	}
	requirements: [
		"python >= 2.7",
		"boto3",
	]
	author: [
		"Will Thames (@willthames)",
		"Michael De La Rue (@mikedlr)",
	]
	extends_documentation_fragment: [
		"aws",
		"ec2",
	]
}
