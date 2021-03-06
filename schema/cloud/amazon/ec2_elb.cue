package ansible

module: ec2_elb: {
	module:            "ec2_elb"
	short_description: "De-registers or registers instances from EC2 ELBs"
	description: [
		"This module de-registers or registers an AWS EC2 instance from the ELBs that it belongs to.",
		"Returns fact \"ec2_elbs\" which is a list of elbs attached to the instance if state=absent is passed as an argument.",
		"Will be marked changed when called only if there are ELBs found to operate on.",
	]
	version_added: "1.2"
	author:        "John Jarvis (@jarv)"
	options: {
		state: {
			description: [
				"register or deregister the instance",
			]
			required: true
			choices: ["present", "absent"]
			type: "str"
		}
		instance_id: {
			description: [
				"EC2 Instance ID",
			]
			required: true
			type:     "str"
		}
		ec2_elbs: {
			description: [
				"List of ELB names, required for registration. The ec2_elbs fact should be used if there was a previous de-register.",
			]
			type: "list"
		}
		enable_availability_zone: {
			description: [
				"Whether to enable the availability zone of the instance on the target ELB if the availability zone has not already been enabled. If set to no, the task will fail if the availability zone is not enabled on the ELB.",
			]

			type:    "bool"
			default: "yes"
		}
		wait: {
			description: [
				"Wait for instance registration or deregistration to complete successfully before returning.",
			]
			type:    "bool"
			default: "yes"
		}
		wait_timeout: {
			description: [
				"Number of seconds to wait for an instance to change state. If 0 then this module may return an error if a transient error occurs. If non-zero then any transient errors are ignored until the timeout is reached. Ignored when wait=no.",
			]

			default:       0
			version_added: "1.6"
			type:          "int"
		}
	}
	extends_documentation_fragment: [
		"aws",
		"ec2",
	]
}
