package ansible

module: spotinst_aws_elastigroup: {
	module:            "spotinst_aws_elastigroup"
	version_added:     2.5
	short_description: "Create, update or delete Spotinst AWS Elastigroups"
	author:            "Spotinst (@talzur)"
	description: [
		"Can create, update, or delete Spotinst AWS Elastigroups Launch configuration is part of the elastigroup configuration, so no additional modules are necessary for handling the launch configuration. You will have to have a credentials file in this location - <home>/.spotinst/credentials The credentials file must contain a row that looks like this token = <YOUR TOKEN> Full documentation available at https://help.spotinst.com/hc/en-us/articles/115003530285-Ansible-",
	]

	requirements: [
		"python >= 2.7",
		"spotinst_sdk >= 1.0.38",
	]
	options: {

		credentials_path: description: [
			"(String) Optional parameter that allows to set a non-default credentials path. Default is ~/.spotinst/credentials",
		]

		account_id: description: [
			"(String) Optional parameter that allows to set an account-id inside the module configuration By default this is retrieved from the credentials path",
		]

		availability_vs_cost: {
			choices: [
				"availabilityOriented",
				"costOriented",
				"balanced",
			]
			description: [
				"(String) The strategy orientation.",
			]
			required: true
		}

		availability_zones: {
			description: [
				"(List of Objects) a list of hash/dictionaries of Availability Zones that are configured in the elastigroup; '[{\"key\":\"value\", \"key\":\"value\"}]'; keys allowed are name (String), subnet_id (String), placement_group_name (String),",
			]

			required: true
		}

		block_device_mappings: description: [
			"(List of Objects) a list of hash/dictionaries of Block Device Mappings for elastigroup instances; You can specify virtual devices and EBS volumes.; '[{\"key\":\"value\", \"key\":\"value\"}]'; keys allowed are device_name (List of Strings), virtual_name (String), no_device (String), ebs (Object, expects the following keys- delete_on_termination(Boolean), encrypted(Boolean), iops (Integer), snapshot_id(Integer), volume_type(String), volume_size(Integer))",
		]

		chef: description: [
			"(Object) The Chef integration configuration.; Expects the following keys - chef_server (String), organization (String), user (String), pem_key (String), chef_version (String)",
		]

		draining_timeout: description: [
			"(Integer) Time for instance to be drained from incoming requests and deregistered from ELB before termination.",
		]

		ebs_optimized: {
			description: [
				"(Boolean) Enable EBS optimization for supported instances which are not enabled by default.; Note - additional charges will be applied.",
			]

			type: "bool"
		}

		ebs_volume_pool: description: [
			"(List of Objects) a list of hash/dictionaries of EBS devices to reattach to the elastigroup when available; '[{\"key\":\"value\", \"key\":\"value\"}]'; keys allowed are - volume_ids (List of Strings), device_name (String)",
		]

		ecs: description: [
			"(Object) The ECS integration configuration.; Expects the following key - cluster_name (String)",
		]

		elastic_ips: description: [
			"(List of Strings) List of ElasticIps Allocation Ids (Example C(eipalloc-9d4e16f8)) to associate to the group instances",
		]

		fallback_to_od: {
			description: [
				"(Boolean) In case of no spots available, Elastigroup will launch an On-demand instance instead",
			]
			type: "bool"
		}
		health_check_grace_period: {
			description: [
				"(Integer) The amount of time, in seconds, after the instance has launched to start and check its health.",
			]
			default: 300
		}

		health_check_unhealthy_duration_before_replacement: description: [
			"(Integer) Minimal mount of time instance should be unhealthy for us to consider it unhealthy.",
		]

		health_check_type: {
			choices: [
				"ELB",
				"HCS",
				"TARGET_GROUP",
				"MLB",
				"EC2",
			]
			description: [
				"(String) The service to use for the health check.",
			]
		}

		iam_role_name: description: [
			"(String) The instance profile iamRole name",
			"Only use iam_role_arn, or iam_role_name",
		]

		iam_role_arn: description: [
			"(String) The instance profile iamRole arn",
			"Only use iam_role_arn, or iam_role_name",
		]

		id: description: [
			"(String) The group id if it already exists and you want to update, or delete it. This will not work unless the uniqueness_by field is set to id. When this is set, and the uniqueness_by field is set, the group will either be updated or deleted, but not created.",
		]

		ignore_changes: {
			choices: [
				"image_id",
				"target",
			]
			description: [
				"(List of Strings) list of fields on which changes should be ignored when updating",
			]
		}

		image_id: {
			description: [
				"(String) The image Id used to launch the instance.; In case of conflict between Instance type and image type, an error will be returned",
			]

			required: true
		}

		key_pair: {
			description: [
				"(String) Specify a Key Pair to attach to the instances",
			]
			required: true
		}

		kubernetes: description: [
			"(Object) The Kubernetes integration configuration. Expects the following keys - api_server (String), token (String)",
		]

		lifetime_period: description: [
			"(String) lifetime period",
		]

		load_balancers: description: [
			"(List of Strings) List of classic ELB names",
		]

		max_size: {
			description: [
				"(Integer) The upper limit number of instances that you can scale up to",
			]
			required: true
		}

		mesosphere: description: [
			"(Object) The Mesosphere integration configuration. Expects the following key - api_server (String)",
		]

		min_size: {
			description: [
				"(Integer) The lower limit number of instances that you can scale down to",
			]
			required: true
		}

		monitoring: {
			description: [
				"(Boolean) Describes whether instance Enhanced Monitoring is enabled",
			]
			required: true
		}

		name: {
			description: [
				"(String) Unique name for elastigroup to be created, updated or deleted",
			]
			required: true
		}

		network_interfaces: description: [
			"(List of Objects) a list of hash/dictionaries of network interfaces to add to the elastigroup; '[{\"key\":\"value\", \"key\":\"value\"}]'; keys allowed are - description (String), device_index (Integer), secondary_private_ip_address_count (Integer), associate_public_ip_address (Boolean), delete_on_termination (Boolean), groups (List of Strings), network_interface_id (String), private_ip_address (String), subnet_id (String), associate_ipv6_address (Boolean), private_ip_addresses (List of Objects, Keys are privateIpAddress (String, required) and primary (Boolean))",
		]

		on_demand_count: description: [
			"(Integer) Required if risk is not set",
			"Number of on demand instances to launch. All other instances will be spot instances.; Either set this parameter or the risk parameter",
		]

		on_demand_instance_type: {
			description: [
				"(String) On-demand instance type that will be provisioned",
			]
			required: true
		}

		opsworks: description: [
			"(Object) The elastigroup OpsWorks integration configration.; Expects the following key - layer_id (String)",
		]

		persistence: description: [
			"(Object) The Stateful elastigroup configration.; Accepts the following keys - should_persist_root_device (Boolean), should_persist_block_devices (Boolean), should_persist_private_ip (Boolean)",
		]

		product: {
			choices: [
				"Linux/UNIX",
				"SUSE Linux",
				"Windows",
				"Linux/UNIX (Amazon VPC)",
				"SUSE Linux (Amazon VPC)",
				"Windows",
			]
			description: [
				"(String) Operation system type._",
			]
			required: true
		}

		rancher: description: [
			"(Object) The Rancher integration configuration.; Expects the following keys - version (String), access_key (String), secret_key (String), master_host (String)",
		]

		right_scale: description: [
			"(Object) The Rightscale integration configuration.; Expects the following keys - account_id (String), refresh_token (String)",
		]

		risk: description: [
			"(Integer) required if on demand is not set. The percentage of Spot instances to launch (0 - 100).",
		]

		roll_config: description: [
			"(Object) Roll configuration.; If you would like the group to roll after updating, please use this feature. Accepts the following keys - batch_size_percentage(Integer, Required), grace_period - (Integer, Required), health_check_type(String, Optional)",
		]

		scheduled_tasks: description: [
			"(List of Objects) a list of hash/dictionaries of scheduled tasks to configure in the elastigroup; '[{\"key\":\"value\", \"key\":\"value\"}]'; keys allowed are - adjustment (Integer), scale_target_capacity (Integer), scale_min_capacity (Integer), scale_max_capacity (Integer), adjustment_percentage (Integer), batch_size_percentage (Integer), cron_expression (String), frequency (String), grace_period (Integer), task_type (String, required), is_enabled (Boolean)",
		]

		security_group_ids: {
			description: [
				"(List of Strings) One or more security group IDs. ; In case of update it will override the existing Security Group with the new given array",
			]

			required: true
		}

		shutdown_script: description: [
			"(String) The Base64-encoded shutdown script that executes prior to instance termination. Encode before setting.",
		]

		signals: description: [
			"(List of Objects) a list of hash/dictionaries of signals to configure in the elastigroup; keys allowed are - name (String, required), timeout (Integer)",
		]

		spin_up_time: description: [
			"(Integer) spin up time, in seconds, for the instance",
		]

		spot_instance_types: {
			description: [
				"(List of Strings) Spot instance type that will be provisioned.",
			]
			required: true
		}

		state: {
			choices: [
				"present",
				"absent",
			]
			description: [
				"(String) create or delete the elastigroup",
			]
		}

		tags: description: [
			"(List of tagKey:tagValue paris) a list of tags to configure in the elastigroup. Please specify list of keys and values (key colon value);",
		]

		target: {
			description: [
				"(Integer) The number of instances to launch",
			]
			required: true
		}

		target_group_arns: description: [
			"(List of Strings) List of target group arns instances should be registered to",
		]

		tenancy: {
			choices: [
				"default",
				"dedicated",
			]
			description: [
				"(String) dedicated vs shared tenancy",
			]
		}

		terminate_at_end_of_billing_hour: {
			description: [
				"(Boolean) terminate at the end of billing hour",
			]
			type: "bool"
		}
		unit: {
			choices: [
				"instance",
				"weight",
			]
			description: [
				"(String) The capacity unit to launch instances by.",
			]
			required: true
		}

		up_scaling_policies: description: [
			"(List of Objects) a list of hash/dictionaries of scaling policies to configure in the elastigroup; '[{\"key\":\"value\", \"key\":\"value\"}]'; keys allowed are - policy_name (String, required), namespace (String, required), metric_name (String, required), dimensions (List of Objects, Keys allowed are name (String, required) and value (String)), statistic (String, required) evaluation_periods (String, required), period (String, required), threshold (String, required), cooldown (String, required), unit (String, required), operator (String, required), action_type (String, required), adjustment (String), min_target_capacity (String), target (String), maximum (String), minimum (String)",
		]

		down_scaling_policies: description: [
			"(List of Objects) a list of hash/dictionaries of scaling policies to configure in the elastigroup; '[{\"key\":\"value\", \"key\":\"value\"}]'; keys allowed are - policy_name (String, required), namespace (String, required), metric_name (String, required), dimensions ((List of Objects), Keys allowed are name (String, required) and value (String)), statistic (String, required), evaluation_periods (String, required), period (String, required), threshold (String, required), cooldown (String, required), unit (String, required), operator (String, required), action_type (String, required), adjustment (String), max_target_capacity (String), target (String), maximum (String), minimum (String)",
		]

		target_tracking_policies: description: [
			"(List of Objects) a list of hash/dictionaries of target tracking policies to configure in the elastigroup; '[{\"key\":\"value\", \"key\":\"value\"}]'; keys allowed are - policy_name (String, required), namespace (String, required), source (String, required), metric_name (String, required), statistic (String, required), unit (String, required), cooldown (String, required), target (String, required)",
		]

		uniqueness_by: {
			choices: [
				"id",
				"name",
			]
			description: [
				"(String) If your group names are not unique, you may use this feature to update or delete a specific group. Whenever this property is set, you must set a group_id in order to update or delete a group, otherwise a group will be created.",
			]
		}

		user_data: description: [
			"(String) Base64-encoded MIME user data. Encode before setting the value.",
		]

		utilize_reserved_instances: {
			description: [
				"(Boolean) In case of any available Reserved Instances, Elastigroup will utilize your reservations before purchasing Spot instances.",
			]

			type: "bool"
		}

		wait_for_instances: {
			description: [
				"(Boolean) Whether or not the elastigroup creation / update actions should wait for the instances to spin",
			]
			type: "bool"
		}

		wait_timeout: description: [
			"(Integer) How long the module should wait for instances before failing the action.; Only works if wait_for_instances is True.",
		]
	}
}
