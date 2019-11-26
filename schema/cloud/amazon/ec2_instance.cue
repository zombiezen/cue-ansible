package ansible

module: ec2_instance: {
	module:            "ec2_instance"
	short_description: "Create & manage EC2 instances"
	description: [
		"Create and manage AWS EC2 instances.",
		"""
		Note: This module does not support creating L(EC2 Spot instances,https://aws.amazon.com/ec2/spot/). The M(ec2) module can create and manage spot instances.

		""",
	]

	version_added: "2.5"
	author: [
		"Ryan Scott Brown (@ryansb)",
	]
	requirements: ["boto3", "botocore"]
	options: {
		instance_ids: {
			description: [
				"If you specify one or more instance IDs, only instances that have the specified IDs are returned.",
			]
			type: "list"
		}
		state: {
			description: [
				"Goal state for the instances.",
			]
			choices: ["present", "terminated", "running", "started", "stopped", "restarted", "rebooted", "absent"]
			default: "present"
			type:    "str"
		}
		wait: {
			description: [
				"Whether or not to wait for the desired state (use wait_timeout to customize this).",
			]
			default: true
			type:    "bool"
		}
		wait_timeout: {
			description: [
				"How long to wait (in seconds) for the instance to finish booting/terminating.",
			]
			default: 600
			type:    "int"
		}
		instance_type: {
			description: [
				"Instance type to use for the instance, see U(https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html) Only required when instance is not already present.",
			]

			default: "t2.micro"
			type:    "str"
		}
		user_data: {
			description: [
				"Opaque blob of data which is made available to the ec2 instance",
			]
			type: "str"
		}
		tower_callback: {
			description: [
				"Preconfigured user-data to enable an instance to perform a Tower callback (Linux only).",
				"Mutually exclusive with I(user_data).",
				"For Windows instances, to enable remote access via Ansible set I(tower_callback.windows) to true, and optionally set an admin password.",
				"If using 'windows' and 'set_password', callback to Tower will not be performed but the instance will be ready to receive winrm connections from Ansible.",
			]
			type: "dict"
			suboptions: {
				tower_address: {
					description: [
						"IP address or DNS name of Tower server. Must be accessible via this address from the VPC that this instance will be launched in.",
					]
					type: "str"
				}
				job_template_id: {
					description: [
						"Either the integer ID of the Tower Job Template, or the name (name supported only for Tower 3.2+).",
					]
					type: "str"
				}
				host_config_key: {
					description: [
						"Host configuration secret key generated by the Tower job template.",
					]
					type: "str"
				}
			}
		}
		tags: {
			description: [
				"A hash/dictionary of tags to add to the new instance or to add/remove from an existing one.",
			]
			type: "dict"
		}
		purge_tags: {
			description: [
				"Delete any tags not specified in the task that are on the instance. This means you have to specify all the desired tags on each task affecting an instance.",
			]

			default: false
			type:    "bool"
		}
		image: {
			description: [
				"An image to use for the instance. The M(ec2_ami_info) module may be used to retrieve images. One of I(image) or I(image_id) are required when instance is not already present.",
			]

			type: "dict"
			suboptions: {
				id: {
					description: [
						"The AMI ID.",
					]
					type: "str"
				}
				ramdisk: {
					description: [
						"Overrides the AMI's default ramdisk ID.",
					]
					type: "str"
				}
				kernel: description: [
					"a string AKI to override the AMI kernel.",
				]
			}
		}
		image_id: {
			description: [
				"I(ami) ID to use for the instance. One of I(image) or I(image_id) are required when instance is not already present.",
				"This is an alias for I(image.id).",
			]
			type: "str"
		}
		security_groups: {
			description: [
				"A list of security group IDs or names (strings). Mutually exclusive with I(security_group).",
			]
			type: "list"
		}
		security_group: {
			description: [
				"A security group ID or name. Mutually exclusive with I(security_groups).",
			]
			type: "str"
		}
		name: {
			description: [
				"The Name tag for the instance.",
			]
			type: "str"
		}
		vpc_subnet_id: {
			description: [
				"The subnet ID in which to launch the instance (VPC) If none is provided, ec2_instance will chose the default zone of the default VPC.",
			]

			aliases: ["subnet_id"]
			type: "str"
		}
		network: {
			description: [
				"Either a dictionary containing the key 'interfaces' corresponding to a list of network interface IDs or containing specifications for a single network interface.",
				"Use the ec2_eni module to create ENIs with special settings.",
			]
			type: "dict"
			suboptions: {
				interfaces: {
					description: [
						"a list of ENI IDs (strings) or a list of objects containing the key I(id).",
					]
					type: "list"
				}
				assign_public_ip: {
					description: [
						"when true assigns a public IP address to the interface",
					]
					type: "bool"
				}
				private_ip_address: {
					description: [
						"an IPv4 address to assign to the interface",
					]
					type: "str"
				}
				ipv6_addresses: {
					description: [
						"a list of IPv6 addresses to assign to the network interface",
					]
					type: "list"
				}
				source_dest_check: {
					description: [
						"controls whether source/destination checking is enabled on the interface",
					]
					type: "bool"
				}
				description: {
					description: [
						"a description for the network interface",
					]
					type: "str"
				}
				private_ip_addresses: {
					description: [
						"a list of IPv4 addresses to assign to the network interface",
					]
					type: "list"
				}
				subnet_id: {
					description: [
						"the subnet to connect the network interface to",
					]
					type: "str"
				}
				delete_on_termination: {
					description: [
						"Delete the interface when the instance it is attached to is terminated.",
					]

					type: "bool"
				}
				device_index: {
					description: [
						"The index of the interface to modify",
					]
					type: "int"
				}
				groups: {
					description: [
						"a list of security group IDs to attach to the interface",
					]
					type: "list"
				}
			}
		}
		volumes: {
			description: [
				"A list of block device mappings, by default this will always use the AMI root device so the volumes option is primarily for adding more storage.",
				"A mapping contains the (optional) keys device_name, virtual_name, ebs.volume_type, ebs.volume_size, ebs.kms_key_id, ebs.iops, and ebs.delete_on_termination.",
				"For more information about each parameter, see U(https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_BlockDeviceMapping.html).",
			]
			type: "list"
		}
		launch_template: {
			description: [
				"The EC2 launch template to base instance configuration on.",
			]
			type: "dict"
			suboptions: {
				id: {
					description: [
						"the ID of the launch template (optional if name is specified).",
					]
					type: "str"
				}
				name: {
					description: [
						"the pretty name of the launch template (optional if id is specified).",
					]
					type: "str"
				}
				version: description: [
					"the specific version of the launch template to use. If unspecified, the template default is chosen.",
				]
			}
		}
		key_name: {
			description: [
				"Name of the SSH access key to assign to the instance - must exist in the region the instance is created.",
			]
			type: "str"
		}
		availability_zone: {
			description: [
				"Specify an availability zone to use the default subnet it. Useful if not specifying the I(vpc_subnet_id) parameter.",
				"If no subnet, ENI, or availability zone is provided, the default subnet in the default VPC will be used in the first AZ (alphabetically sorted).",
			]
			type: "str"
		}
		instance_initiated_shutdown_behavior: {
			description: [
				"Whether to stop or terminate an instance upon shutdown.",
			]
			choices: ["stop", "terminate"]
			type: "str"
		}
		tenancy: {
			description: [
				"What type of tenancy to allow an instance to use. Default is shared tenancy. Dedicated tenancy will incur additional charges.",
			]
			choices: ["dedicated", "default"]
			type: "str"
		}
		termination_protection: {
			description: [
				"Whether to enable termination protection. This module will not terminate an instance with termination protection active, it must be turned off first.",
			]

			type: "bool"
		}
		cpu_credit_specification: {
			description: [
				"For T series instances, choose whether to allow increased charges to buy CPU credits if the default pool is depleted.",
				"Choose I(unlimited) to enable buying additional CPU credits.",
			]
			choices: ["unlimited", "standard"]
			type: "str"
		}
		cpu_options: {
			description: [
				"Reduce the number of vCPU exposed to the instance.",
				"Those parameters can only be set at instance launch. The two suboptions threads_per_core and core_count are mandatory.",
				"See U(https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-optimize-cpu.html) for combinations available.",
				"Requires botocore >= 1.10.16",
			]
			version_added: 2.7
			type:          "dict"
			suboptions: {
				threads_per_core: {
					description: [
						"Select the number of threads per core to enable. Disable or Enable Intel HT.",
					]
					choices: [1, 2]
					required: true
					type:     "int"
				}
				core_count: {
					description: [
						"Set the number of core to enable.",
					]
					required: true
					type:     "int"
				}
			}
		}
		detailed_monitoring: {
			description: [
				"Whether to allow detailed cloudwatch metrics to be collected, enabling more detailed alerting.",
			]
			type: "bool"
		}
		ebs_optimized: {
			description: [
				"Whether instance is should use optimized EBS volumes, see U(https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSOptimized.html).",
			]
			type: "bool"
		}
		filters: {
			description: [
				"A dict of filters to apply when deciding whether existing instances match and should be altered. Each dict item consists of a filter key and a filter value. See U(https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeInstances.html). for possible filters. Filter names and values are case sensitive.",
				"By default, instances are filtered for counting by their \"Name\" tag, base AMI, state (running, by default), and subnet ID. Any queryable filter can be used. Good candidates are specific tags, SSH keys, or security groups.",
			]

			type: "dict"
		}
		instance_role: {
			description: [
				"The ARN or name of an EC2-enabled instance role to be used. If a name is not provided in arn format then the ListInstanceProfiles permission must also be granted. U(https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListInstanceProfiles.html) If no full ARN is provided, the role with a matching name will be used from the active AWS account.",
			]

			type: "str"
		}
		placement_group: {
			description: [
				"The placement group that needs to be assigned to the instance",
			]
			version_added: 2.8
			type:          "str"
		}
	}

	extends_documentation_fragment: [
		"aws",
		"ec2",
	]
}