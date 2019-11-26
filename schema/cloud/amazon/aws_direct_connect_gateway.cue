package ansible

module: aws_direct_connect_gateway: {
	module:            "aws_direct_connect_gateway"
	author:            "Gobin Sougrakpam (@gobins)"
	version_added:     "2.5"
	short_description: "Manage AWS Direct Connect Gateway."
	description: [
		"Creates AWS Direct Connect Gateway",
		"Deletes AWS Direct Connect Gateway",
		"Attaches Virtual Gateways to Direct Connect Gateway",
		"Detaches Virtual Gateways to Direct Connect Gateway",
	]
	extends_documentation_fragment: [
		"aws",
		"ec2",
	]
	requirements: ["boto3"]
	options: {
		state: {
			description: [
				"present to ensure resource is created.",
				"absent to remove resource",
			]
			required: false
			default:  "present"
			choices: ["present", "absent"]
			type: "str"
		}
		name: {
			description: [
				"name of the dxgw to be created or deleted",
			]
			required: false
			type:     "str"
		}
		amazon_asn: {
			description: [
				"amazon side asn",
			]
			required: true
			type:     "str"
		}
		direct_connect_gateway_id: {
			description: [
				"id of an existing direct connect gateway",
			]
			required: false
			type:     "str"
		}
		virtual_gateway_id: {
			description: [
				"vpn gateway id of an existing virtual gateway",
			]
			required: false
			type:     "str"
		}
		wait_timeout: {
			description: [
				"How long to wait for the association to be deleted",
			]
			type:    "int"
			default: 320
		}
	}
}
