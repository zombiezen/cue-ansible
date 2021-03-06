package ansible

module: ecs_attribute: {
	module:            "ecs_attribute"
	short_description: "manage ecs attributes"
	description: [
		"Create, update or delete ECS container instance attributes.",
	]
	version_added: "2.4"
	author:        "Andrej Svenke (@anryko)"
	requirements: ["botocore", "boto3"]
	options: {
		cluster: {
			description: [
				"The short name or full Amazon Resource Name (ARN) of the cluster that contains the resource to apply attributes.",
			]

			required: true
			type:     "str"
		}
		state: {
			description: [
				"The desired state of the attributes.",
			]
			required: false
			default:  "present"
			choices: ["present", "absent"]
			type: "str"
		}
		attributes: {
			description: [
				"List of attributes.",
			]
			required: true
			type:     "list"
			elements: "dict"
			suboptions: {
				name: {
					description: [
						"The name of the attribute. Up to 128 letters (uppercase and lowercase), numbers, hyphens, underscores, and periods are allowed.",
					]

					required: true
					type:     "str"
				}
				value: {
					description: [
						"The value of the attribute. Up to 128 letters (uppercase and lowercase), numbers, hyphens, underscores, periods, at signs (@), forward slashes, colons, and spaces are allowed.",
					]

					required: false
					type:     "str"
				}
			}
		}
		ec2_instance_id: {
			description: [
				"EC2 instance ID of ECS cluster container instance.",
			]
			required: true
			type:     "str"
		}
	}
	extends_documentation_fragment: [
		"aws",
		"ec2",
	]
}
