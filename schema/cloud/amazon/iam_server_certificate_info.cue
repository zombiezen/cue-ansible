package ansible

module: iam_server_certificate_info: {
	module:            "iam_server_certificate_info"
	short_description: "Retrieve the information of a server certificate"
	description: [
		"Retrieve the attributes of a server certificate",
		"This module was called C(iam_server_certificate_facts) before Ansible 2.9. The usage did not change.",
	]
	version_added: "2.2"
	author:        "Allen Sanabria (@linuxdynasty)"
	requirements: ["boto3", "botocore"]
	options: name: {
		description: [
			"The name of the server certificate you are retrieving attributes for.",
		]
		required: true
		type:     "str"
	}
	extends_documentation_fragment: [
		"aws",
		"ec2",
	]
}
