package alicloud

ali_instance :: {

	// Instance host name.

	host_name?: string

	// A hash/dictionaries of instance tags, to add to the new instance or for starting/stopping instance by tag. C({"key":"value"})

	instance_tags?: string

	// A list of security group IDs.

	security_groups?: string

	// User-defined data to customize the startup behaviors of an ECS instance and to pass data into an ECS instance. It only will take effect when launching the new ECS instances.

	user_data?: string

	// The subnet ID in which to launch the instances (VPC).

	vswitch_id?: string

	// Whether the current operation needs to be execute forcibly.

	force?: bool

	// The name of ECS instance, which is a string of 2 to 128 Chinese or English characters. It must begin with an uppercase/lowercase letter or a Chinese character and can contain numerals, ".", "_" or "-". It cannot begin with http:// or https://.

	instance_name?: string

	// The charge duration of the instance, in month. Required when C(instance_charge_type=PrePaid).
	// The valid value are [1-9, 12, 24, 36].

	period?: string

	// The description of ECS instance, which is a string of 2 to 256 characters. It cannot begin with http:// or https://.

	description?: string

	// Image ID used to launch instances. Required when C(state=present) and creating new ECS instances.

	image_id?: string

	// The charge type of the instance.

	instance_charge_type?: string

	// Instance type used to launch instances. Required when C(state=present) and creating new ECS instances.

	instance_type?: string

	// Description of the system disk.

	system_disk_description?: string

	// Size of the system disk, in GB. The valid values are 40~500.

	system_disk_size?: string

	// A list of instance ids. It is required when need to operate existing instances. If it is specified, I(count) will lose efficacy.

	instance_ids?: string

	// The name of key pair which is used to access ECS instance in SSH.

	key_name?: string

	// Category of the system disk.

	system_disk_category?: string

	// I(count) determines how many instances based on a specific tag criteria should be present. This can be expressed in multiple ways and is shown in the EXAMPLES section. The specified count_tag must already exist or be passed in as the I(instance_tags) option. If it is not specified, it will be replaced by I(instance_name).

	count_tag?: string

	// The password to login instance. After rebooting instances, modified password will take effect.

	password?: string

	// Name of the system disk.

	system_disk_name?: string

	// Whether allocate a public ip for the new instance.

	allocate_public_ip?: bool

	// Aliyun availability zone ID in which to launch the instance. If it is not specified, it will be allocated by system automatically.

	availability_zone?: string

	// The number of the new instance. An integer value which indicates how many instances that match I(count_tag) should be running. Instances are either created or terminated based on this value.

	count?: string

	// Whether automate renew the charge of the instance.

	auto_renew?: bool

	// Maximum incoming bandwidth from the public network, measured in Mbps (Megabits per second).

	max_bandwidth_in?: string

	// Maximum outgoing bandwidth to the public network, measured in Mbps (Megabits per second).

	max_bandwidth_out?: string

	// The duration of the automatic renew the charge of the instance. Required when C(auto_renew=True).

	auto_renew_period?: string

	// Internet charge type of ECS instance.

	internet_charge_type?: string

	// The state of the instance after operating.

	state?: string
}

ali_instance_info :: {

	// Aliyun availability zone ID in which to launch the instance

	availability_zone?: string

	// A list of ECS instance ids.

	instance_ids?: string

	// A list of ECS instance names.

	instance_names?: string

	// A hash/dictionaries of instance tags. C({"key":"value"})

	instance_tags?: string
}
