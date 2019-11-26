package openstack

os_subnet :: {

	// Indicate desired state of the resource

	state?: string

	// The CIDR representation of the subnet that should be assigned to the subnet. Required when I(state) is 'present' and a subnetpool is not specified.

	cidr?: string

	// List of DNS nameservers for this subnet.

	dns_nameservers?: string

	// The name of the subnet that should be created. Although Neutron allows for non-unique subnet names, this module enforces subnet name uniqueness.

	name: string

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// A list of host route dictionaries for the subnet.

	host_routes?: string

	// Dictionary with extra key/value pairs passed to the API

	extra_specs?: string

	// The IP version of the subnet 4 or 6

	ip_version?: string

	// The gateway IP would not be assigned for this subnet

	no_gateway_ip?: bool

	// From the subnet pool the last IP that should be assigned to the virtual machines.

	allocation_pool_end?: string

	// From the subnet pool the starting address from which the IP should be allocated.

	allocation_pool_start?: string

	// Whether DHCP should be enabled for this subnet.

	enable_dhcp?: bool

	// Name of the network to which the subnet should be attached
	// Required when I(state) is 'present'

	network_name?: string

	// Project name or ID containing the subnet (name admin-only)

	project?: string

	// Use the default subnetpool for I(ip_version) to obtain a CIDR.

	use_default_subnetpool?: bool

	// The ip that would be assigned to the gateway for this subnet

	gateway_ip?: string

	// IPv6 address mode

	ipv6_address_mode?: string

	// IPv6 router advertisement mode

	ipv6_ra_mode?: string
}

os_nova_host_aggregate :: {

	// Availability zone to create aggregate into.

	availability_zone?: string

	// List of hosts to set for an aggregate.

	hosts?: string

	// Metadata dict.

	metadata?: string

	// Name of the aggregate.

	name: string

	// Should the resource be present or absent.

	state?: string
}

os_object :: {

	// desired container access level.

	container_access?: string

	// Path to local file to be uploaded.

	filename?: string

	// Name to be give to the object. If omitted, operations will be on the entire container

	name?: string

	// Should the resource be present or absent.

	state?: string

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// The name of the container in which to create the object

	container: string
}

os_server :: {

	// Should the resource be present or absent.

	state?: string

	// Volume name or id to use as the volume to boot from. Implies boot_from_volume. Mutually exclusive with image and boot_from_volume.

	boot_volume?: string

	// The name or id of the base image to boot.

	image: string

	// Ensure instance has public ip however the cloud wants to do that

	auto_ip?: bool

	// The amount of time the module should wait for the instance to get into active state.

	timeout?: string

	// A list of preexisting volumes names or ids to attach to the instance

	volumes?: string

	// If the module should wait for the instance to be created.

	wait?: bool

	// The name or id of the flavor in which the new instance has to be created. Mutually exclusive with flavor_ram

	flavor?: string

	// A list of key value pairs that should be provided as a metadata to the new instance or a string containing a list of key-value pairs. Eg:  meta: "key1=value1,key2=value2"

	meta?: string

	// If C(yes), delete volume when deleting instance (if booted from volume)

	terminate_volume?: bool

	// Whether to boot the server with config drive enabled

	config_drive?: bool

	// Name or ID of a network to attach this instance to. A simpler version of the nics parameter, only one of network or nics should be supplied.

	network?: string

	// Names of the security groups to which the instance should be added. This may be a YAML list or a comma separated string.

	security_groups?: string

	// Opaque blob of data which is made available to the instance

	userdata?: string

	// Arbitrary key/value pairs to the scheduler for custom use

	scheduler_hints?: string

	// The minimum amount of ram in MB that the flavor in which the new instance has to be created must have. Mutually exclusive with flavor.

	flavor_ram?: string

	// list of valid floating IPs that pre-exist to assign to this node

	floating_ips?: string

	// Availability zone in which to create the server.

	availability_zone?: string

	// Text to use to filter flavor names, for the case, such as Rackspace, where there are multiple flavors that have the same ram count. flavor_include is a positive match filter - it must exist in the flavor name.

	flavor_include?: string

	// Text to use to filter image names, for the case, such as HP, where there are multiple image names matching the common identifying portions. image_exclude is a negative match filter - it is text that may not exist in the image name. Defaults to "(deprecated)"

	image_exclude?: string

	// The key pair name to be used when creating a instance

	key_name?: string

	// Name of floating IP pool from which to choose a floating IP

	floating_ip_pools?: string

	// A list of networks to which the instance's interface should be attached. Networks may be referenced by net-id/net-name/port-id or port-name.
	// Also this accepts a string containing a list of (net/port)-(id/name) Eg: nics: "net-id=uuid-1,port-name=myport" Only one of network or nics should be supplied.

	nics?: string

	// When I(auto_ip) is true and this option is true, the I(auto_ip) code will attempt to re-use unassigned floating ips in the project before creating a new one. It is important to note that it is impossible to safely do this concurrently, so if your use case involves concurrent server creation, it is highly recommended to set this to false and to delete the floating ip associated with a server when the server is deleted using I(delete_fip).

	reuse_ips?: bool

	// Should the instance boot from a persistent volume created based on the image given. Mutually exclusive with boot_volume.

	boot_from_volume?: bool

	// When I(state) is absent and this option is true, any floating IP associated with the instance will be deleted along with the instance.

	delete_fip?: bool

	// Name that has to be given to the instance. It is also possible to specify the ID of the instance instead of its name if I(state) is I(absent).

	name: string

	// The size of the volume to create in GB if booting from volume based on an image.

	volume_size?: string
}

os_server_action :: {

	// Perform the given action. The lock and unlock actions always return changed as the servers API does not provide lock status.

	action?: string

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// Image the server should be rebuilt with

	image?: string

	// Name or ID of the instance

	server: string

	// The amount of time the module should wait for the instance to perform the requested action.

	timeout?: string

	// If the module should wait for the instance action to be performed.

	wait?: bool
}

os_nova_flavor :: {

	// Ephemeral space size, in GB.

	ephemeral?: string

	// Metadata dictionary

	extra_specs?: string

	// RX/TX factor.

	rxtx_factor?: string

	// Indicate desired state of the resource. When I(state) is 'present', then I(ram), I(vcpus), and I(disk) are all required. There are no default values for those parameters.

	state?: string

	// Swap space size, in MB.

	swap?: string

	// Number of virtual CPUs.

	vcpus?: string

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// Size of local disk, in GB.

	disk?: int

	// ID for the flavor. This is optional as a unique UUID will be assigned if a value is not specified.

	flavorid?: string

	// Make flavor accessible to the public.

	is_public?: bool

	// Flavor name.

	name: string

	// Amount of memory, in MB.

	ram?: string
}

os_port_info :: {

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// A dictionary of meta data to use for further filtering. Elements of this dictionary will be matched against the returned port dictionaries. Matching is currently limited to strings within the port dictionary, or strings within nested dictionaries.

	filters?: string

	// Unique name or ID of a port.

	port?: string
}

os_member :: {

	// Name that has to be given to the member

	name: string

	// The name or id of the pool that this member belongs to.

	pool: string

	// Should the resource be present or absent.

	state?: string

	// The subnet ID the member service is accessible from.

	subnet_id?: string

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// The protocol port number for the member.

	protocol_port?: string

	// The amount of time the module should wait for the load balancer to get into ACTIVE state.

	timeout?: string

	// If the module should wait for the load balancer to be ACTIVE.

	wait?: bool

	// The IP address of the member.

	address?: string
}

os_networks_info :: {

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// A dictionary of meta data to use for further filtering.  Elements of this dictionary may be additional dictionaries.

	filters?: string

	// Name or ID of the Network

	name?: string
}

os_project :: {

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// Description for the project

	description?: string

	// Domain id to create the project in if the cloud supports domains.

	domain_id?: string

	// Is the project enabled

	enabled?: bool

	// Name for the project

	name: string

	// Should the resource be present or absent.

	state?: string
}

os_user_group :: {

	// Name or id for the group.

	group: string

	// Should the user be present or absent in the group

	state?: string

	// Name or id for the user

	user: string

	// Ignored. Present for backwards compatibility

	availability_zone?: string
}

os_ironic_node :: {

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// A setting to allow the direct control if a node is in maintenance mode.

	maintenance?: bool

	// globally unique identifier (UUID) to be given to the resource.

	uuid?: string

	// A boolean value instructing the module to wait for node activation or deactivation to complete before returning.

	wait?: bool

	// Indicates desired state of the resource

	state?: string

	// An integer value representing the number of seconds to wait for the node activation or deactivation to complete.

	timeout?: string

	// A configdrive file or HTTP(S) URL that will be passed along to the node.

	config_drive?: string

	// Indicates if the resource should be deployed. Allows for deployment logic to be disengaged and control of the node power or maintenance state to be changed.

	deploy?: bool

	// Definition of the instance information which is used to deploy the node.  This information is only required when an instance is set to present.

	instance_info?: string

	// If noauth mode is utilized, this is required to be set to the endpoint URL for the Ironic API.  Use with "auth" and "auth_type" settings set to None.

	ironic_url?: string

	// A string expression regarding the reason a node is in a maintenance mode.

	maintenance_reason?: string

	// A setting to allow power state to be asserted allowing nodes that are not yet deployed to be powered on, and nodes that are deployed to be powered off.

	power?: string
}

os_flavor_info :: {

	// A string used for filtering flavors based on the amount of RAM (in MB) desired. This string accepts the following special values: 'MIN' (return flavors with the minimum amount of RAM), and 'MAX' (return flavors with the maximum amount of RAM).
	// A specific amount of RAM may also be specified. Any flavors with this exact amount of RAM will be returned.
	// A range of acceptable RAM may be given using a special syntax. Simply prefix the amount of RAM with one of these acceptable range values: '<', '>', '<=', '>='. These values represent less than, greater than, less than or equal to, and greater than or equal to, respectively.

	ram?: bool

	// A string used for filtering flavors based on the number of virtual CPUs desired. Format is the same as the I(ram) parameter.

	vcpus?: bool

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// A string used for filtering flavors based on the amount of ephemeral storage. Format is the same as the I(ram) parameter

	ephemeral?: bool

	// Limits the number of flavors returned. All matching flavors are returned by default.

	limit?: string

	// A flavor name. Cannot be used with I(ram) or I(vcpus) or I(ephemeral).

	name?: string
}

os_keystone_domain_info :: {

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// A dictionary of meta data to use for further filtering.  Elements of this dictionary may be additional dictionaries.

	filters?: string

	// Name or ID of the domain

	name?: string
}

os_port :: {

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// The ID of the entity that uses this port.

	device_owner?: string

	// MAC address of this port.

	mac_address?: string

	// Name that has to be given to the port.

	name?: string

	// Should the resource be present or absent.

	state?: string

	// The type of the port that should be created

	vnic_type?: string

	// Sets admin state.

	admin_state_up?: bool

	// Allowed address pairs list.  Allowed address pairs are supported with dictionary structure. e.g.  allowed_address_pairs: - ip_address: 10.1.0.12 mac_address: ab:cd:ef:12:34:56 - ip_address: ...

	allowed_address_pairs?: string

	// Security group(s) ID(s) or name(s) associated with the port (comma separated string or YAML list)

	security_groups?: string

	// Device ID of device using this port.

	device_id?: string

	// Network ID or name this port belongs to.

	network: string

	// Do not associate a security group with this port.

	no_security_groups?: bool

	// Extra dhcp options to be assigned to this port. Extra options are supported with dictionary structure. Note that options cannot be removed only updated. e.g.  extra_dhcp_opts: - opt_name: opt name1 opt_value: value1 ip_version: 4 - opt_name: ...

	extra_dhcp_opts?: string

	// Desired IP and/or subnet for this port.  Subnet is referenced by subnet_id and IP is referenced by ip_address.

	fixed_ips?: string

	// Whether to enable or disable the port security on the network.

	port_security_enabled?: bool
}

os_server_metadata :: {

	// Availability zone in which to create the snapshot.

	availability_zone?: string

	// A list of key value pairs that should be provided as a metadata to the instance or a string containing a list of key-value pairs. Eg:  meta: "key1=value1,key2=value2"

	meta: string

	// Name of the instance to update the metadata

	server: string

	// Should the resource be present or absent.

	state?: string
}

os_user_info :: {

	// Name or ID of the domain containing the user if the cloud supports domains

	domain?: string

	// A dictionary of meta data to use for further filtering.  Elements of this dictionary may be additional dictionaries.

	filters?: string

	// Name or ID of the user

	name: string

	// Ignored. Present for backwards compatibility

	availability_zone?: string
}

os_auth :: {

	// Ignored. Present for backwards compatibility

	availability_zone?: string
}

os_project_info :: {

	// Name or ID of the project

	name: string

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// Name or ID of the domain containing the project if the cloud supports domains

	domain?: string

	// A dictionary of meta data to use for further filtering.  Elements of this dictionary may be additional dictionaries.

	filters?: string
}

os_coe_cluster :: {

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// The template ID of cluster template.

	cluster_template_id: string

	// The number of master nodes for this cluster

	master_count?: string

	// The flavor of the master node for this ClusterTemplate

	master_flavor_id?: string

	// Name that has to be given to the cluster template

	name: string

	// The number of nodes for this cluster

	node_count?: string

	// Timeout for creating the cluster in minutes. Default to 60 mins if not set

	timeout?: string

	// Url used for cluster node discovery

	discovery_url?: string

	// The size in GB of the docker volume

	docker_volume_size?: string

	// The flavor of the minion node for this ClusterTemplate

	flavor_id?: string

	// Name of the keypair to use.

	keypair?: string

	// One or more key/value pairs

	labels?: string

	// Indicate desired state of the resource.

	state?: string
}

os_keystone_endpoint :: {

	// URL of the service.

	url: string

	// Is the service enabled.

	enabled?: bool

	// Interface of the service.

	endpoint_interface: string

	// Region that the service belongs to. Note that I(region_name) is used for authentication.

	region?: string

	// Name or id of the service.

	service: string

	// Should the resource be C(present) or C(absent).

	state?: string
}

os_server_group :: {

	// Indicate desired state of the resource. When I(state) is 'present', then I(policies) is required.

	state?: string

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// Server group name.

	name: string

	// A list of one or more policy names to associate with the server group. The list must contain at least one policy name. The current valid policy names are anti-affinity, affinity, soft-anti-affinity and soft-affinity.

	policies?: string
}

os_image :: {

	// The name of an existing kernel image that will be associated with this image

	kernel?: string

	// Should the resource be present or absent.

	state?: string

	// The checksum of the image

	checksum?: string

	// The path to the file which has to be uploaded

	filename?: string

	// The minimum disk space (in GB) required to boot this image

	min_disk?: string

	// The name of the image when uploading - or the name/ID of the image if deleting

	name: string

	// The name of an existing ramdisk image that will be associated with this image

	ramdisk?: string

	// ID of a volume to create an image from.
	// The volume must be in AVAILABLE state.

	volume?: string

	// The format of the container

	container_format?: string

	// The format of the disk that is getting uploaded

	disk_format?: string

	// Additional properties to be associated with this image

	properties?: string

	// Prevent image from being deleted

	protected?: bool

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// The ID of the image when uploading an image

	id?: string

	// Whether the image can be accessed publicly. Note that publicizing an image requires admin role by default.

	is_public?: bool

	// The minimum ram (in MB) required to boot this image

	min_ram?: string

	// The owner of the image

	owner?: string
}

os_keystone_role :: {

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// Role Name

	name: string

	// Should the resource be present or absent.

	state?: string
}

os_security_group :: {

	// Unique name or ID of the project.

	project?: string

	// Should the resource be present or absent.

	state?: string

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// Long description of the purpose of the security group

	description?: string

	// Name that has to be given to the security group. This module requires that security group names be unique.

	name: string
}

os_group_info :: {

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// Name or ID of the domain containing the group if the cloud supports domains

	domain?: string

	// A dictionary of meta data to use for further filtering.  Elements of this dictionary may be additional dictionaries.

	filters?: {...}

	// Name or ID of the group.

	name: string
}

os_router :: {

	// Indicate desired state of the resource

	state?: string

	// Desired admin state of the created or existing router.

	admin_state_up?: bool

	// The IP address parameters for the external gateway network. Each is a dictionary with the subnet name or ID (subnet) and the IP address to assign on the subnet (ip). If no IP is specified, one is automatically assigned from that subnet.

	external_fixed_ips?: string

	// List of subnets to attach to the router internal interface. Default gateway associated with the subnet will be automatically attached with the router's internal interface. In order to provide an ip address different from the default gateway,parameters are passed as dictionary with keys as network name or ID(net), subnet name or ID (subnet) and the IP of port (portip) from the network. User defined portip is often required when a multiple router need to be connected to a single subnet for which the default gateway has been already used.

	interfaces?: string

	// Name to be give to the router

	name: string

	// Unique name or ID of the external gateway network.
	// required I(interfaces) or I(enable_snat) are provided.

	network?: string

	// Unique name or ID of the project.

	project?: string

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// Enable Source NAT (SNAT) attribute.

	enable_snat?: bool
}

os_quota :: {

	// Number of floating IP's to allow in Network.

	floatingip?: string

	// Maximum size in GB's of individual lvm volumes.

	gigabytes_lvm?: string

	// Number of key pairs to allow.

	key_pairs?: string

	// Number of load balancers to allow.

	loadbalancer?: string

	// Maximum size of backups in GB's.

	backup_gigabytes?: string

	// Number of security groups to allow.

	security_group?: string

	// Number of LVM snapshots to allow.

	snapshots_lvm?: string

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// Maximum number of CPU's per project.

	cores?: string

	// Maximum file size in bytes.

	injected_file_size?: string

	// Number of load balancer pools to allow.

	pool?: string

	// Maximum amount of ram in MB to allow.

	ram?: string

	// Number of subnet pools to allow.

	subnetpool?: string

	// Maximum volume storage allowed for project.

	gigabytes?: string

	// Maximum path size.

	injected_path_size?: string

	// Name of the OpenStack Project to manage.

	name: string

	// Number of properties to allow.

	properties?: string

	// Number of snapshots to allow.

	snapshots?: string

	// Number of injected files to allow.

	injected_files?: string

	// Maximum number of instances allowed.

	instances?: string

	// Number of Network ports to allow, this needs to be greater than the instances limit.

	port?: string

	// Number of policies to allow.

	rbac_policy?: string

	// Number of rules per security group to allow.

	security_group_rule?: string

	// Number of fixed IP's to allow.

	fixed_ips?: string

	// Number of server group members to allow.

	server_group_members?: string

	// Number of server groups to allow.

	server_groups?: string

	// Maximum number of backups allowed.

	backups?: string

	// Number of volumes to allow.

	volumes?: string

	// Number of subnets to allow.

	subnet?: string

	// Number of LVM volumes to allow.

	volumes_lvm?: string

	// Number of floating IP's to allow in Compute.

	floating_ips?: string

	// Number of networks to allow.

	network?: string

	// Maximum size in GB's of individual volumes.

	per_volume_gigabytes?: string

	// Number of routers to allow.

	router?: string

	// A value of present sets the quota and a value of absent resets the quota to system defaults.

	state?: string
}

os_volume :: {

	// Metadata for the volume

	metadata?: string

	// Scheduler hints passed to volume API in form of dict

	scheduler_hints?: string

	// Size of volume in GB. This parameter is required when the I(state) parameter is 'present'.

	size?: string

	// Should the resource be present or absent.

	state?: string

	// Volume name or id to create from

	volume?: string

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// String describing the volume

	display_description?: string

	// Image name or id for boot from volume

	image?: string

	// Volume type for volume

	volume_type?: string

	// Name of volume

	display_name: string

	// Volume snapshot id to create from

	snapshot_id?: string
}

os_network :: {

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// Whether this network is externally accessible.

	external?: bool

	// The maximum transmission unit (MTU) value to address fragmentation. Network will use OpenStack defaults if this option is not provided.

	mtu?: int

	// The type of physical network that maps to this network resource.

	provider_network_type?: string

	// The physical network where this network object is implemented.

	provider_physical_network?: string

	// Whether this network is shared or not.

	shared?: bool

	// Indicate desired state of the resource.

	state?: string

	// Whether the state should be marked as up or down.

	admin_state_up?: bool

	// The DNS domain value to set. Network will use Openstack defaults if this option is not provided.

	dns_domain?: string

	// Name to be assigned to the network.

	name: string

	// Whether port security is enabled on the network or not. Network will use OpenStack defaults if this option is not utilised.

	port_security_enabled?: bool

	// Project name or ID containing the network (name admin-only)

	project?: string

	// An isolated segment on the physical network. The I(network_type) attribute defines the segmentation model. For example, if the I(network_type) value is vlan, this ID is a vlan identifier. If the I(network_type) value is gre, this ID is a gre key.

	provider_segmentation_id?: string
}

os_keypair :: {

	// Path to local file containing ssh public key. Mutually exclusive with public_key.

	public_key_file?: string

	// Should the resource be present or absent.

	state?: string

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// Name that has to be given to the key pair

	name: string

	// The public key that would be uploaded to nova and injected into VMs upon creation.

	public_key?: string
}

os_pool :: {

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// The name or id of the load balancer that this pool belongs to. Either loadbalancer or listener must be specified for pool creation.

	loadbalancer?: string

	// If the module should wait for the pool to be ACTIVE.

	wait?: bool

	// The amount of time the module should wait for the pool to get into ACTIVE state.

	timeout?: string

	// The load balancing algorithm for the pool.

	lb_algorithm?: string

	// The name or id of the listener that this pool belongs to. Either loadbalancer or listener must be specified for pool creation.

	listener?: string

	// Name that has to be given to the pool

	name: string

	// The protocol for the pool.

	protocol?: string

	// Should the resource be present or absent.

	state?: string
}

os_security_group_rule :: {

	// The direction in which the security group rule is applied. Not all providers support egress.

	direction?: string

	// Ending port

	port_range_max?: string

	// Unique name or ID of the project.

	project?: string

	// Name or ID of the Security group to link (exclusive with remote_ip_prefix)

	remote_group?: string

	// Source IP address(es) in CIDR notation (exclusive with remote_group)

	remote_ip_prefix?: string

	// Name or ID of the security group

	security_group: string

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// Starting port

	port_range_min?: string

	// IP protocols TCP UDP ICMP 112 (VRRP) 132 (SCTP)

	protocol?: string

	// Should the resource be present or absent.

	state?: string

	// Must be IPv4 or IPv6, and addresses represented in CIDR must match the ingress or egress rules. Not all providers support IPv6.

	ethertype?: string
}

os_image_info :: {

	// Dict of properties of the images used for query

	properties?: {...}

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// Name or ID of the image

	image?: string
}

os_subnets_info :: {

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// A dictionary of meta data to use for further filtering.  Elements of this dictionary may be additional dictionaries.

	filters?: string

	// Name or ID of the subnet.
	// Alias 'subnet' added in version 2.8.

	name?: string
}

os_ironic :: {

	// Associate the node with a pre-defined chassis.

	chassis_uuid?: string

	// Information for this server's driver. Will vary based on which driver is in use. Any sub-field which is populated will be validated during creation.

	driver_info?: string

	// unique name identifier to be given to the resource.

	name?: string

	// A list of network interface cards, eg, " - mac: aa:bb:cc:aa:bb:cc"

	nics: string

	// Definition of the physical characteristics of this server, used for scheduling purposes

	properties?: string

	// Indicates desired state of the resource

	state?: string

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// If noauth mode is utilized, this is required to be set to the endpoint URL for the Ironic API.  Use with "auth" and "auth_type" settings set to None.

	ironic_url?: string

	// Allows the code that would assert changes to nodes to skip the update if the change is a single line consisting of the password field.  As of Kilo, by default, passwords are always masked to API requests, which means the logic as a result always attempts to re-assert the password field.

	skip_update_of_driver_password?: bool

	// globally unique identifier (UUID) to be given to the resource. Will be auto-generated if not specified, and name is specified.
	// Definition of a UUID will always take precedence to a name value.

	uuid?: string

	// The name of the Ironic Driver to use with this node.

	driver: string
}

os_keystone_domain :: {

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// Description of the domain

	description?: string

	// Is the domain enabled

	enabled?: bool

	// Name that has to be given to the instance

	name: string

	// Should the resource be present or absent.

	state?: string
}

os_listener :: {

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// The name or id of the load balancer that this listener belongs to.

	loadbalancer: string

	// Name that has to be given to the listener

	name: string

	// The protocol for the listener.

	protocol?: string

	// The protocol port number for the listener.

	protocol_port?: string

	// Should the resource be present or absent.

	state?: string

	// The amount of time the module should wait for the load balancer to get into ACTIVE state.

	timeout?: string

	// If the module should wait for the load balancer to be ACTIVE.

	wait?: bool
}

os_loadbalancer :: {

	// Allocate a public IP address and associate with the VIP automatically.

	auto_public_ip?: bool

	// When C(state=absent) and this option is true, any public IP address associated with the VIP will be deleted along with the load balancer.

	delete_public_ip?: bool

	// The amount of time the module should wait.

	timeout?: string

	// IP address of the load balancer virtual IP.

	vip_address?: string

	// The name or id of the network for the virtual IP of the load balancer. One of I(vip_network), I(vip_subnet), or I(vip_port) must be specified for creation.

	vip_network?: string

	// The name or id of the subnet for the virtual IP of the load balancer. One of I(vip_network), I(vip_subnet), or I(vip_port) must be specified for creation.

	vip_subnet?: string

	// If the module should wait for the load balancer to be created or deleted.

	wait?: bool

	// Public IP address associated with the VIP.

	public_ip_address?: string

	// A list of listeners that attached to the load balancer.

	listeners?: string

	// Name that has to be given to the load balancer

	name: string

	// Should the resource be present or absent.

	state?: string

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// The name or ID of a Neutron external network.

	public_network?: string

	// The name or id of the load balancer virtual IP port. One of I(vip_network), I(vip_subnet), or I(vip_port) must be specified for creation.

	vip_port?: string
}

os_recordset :: {

	// Recordset type

	recordset_type: string

	// Should the resource be present or absent.

	state?: string

	// TTL (Time To Live) value in seconds

	ttl?: string

	// Zone managing the recordset

	zone: string

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// Description of the recordset

	description?: string

	// Name of the recordset

	name: string

	// List of recordset definitions

	records: string
}

os_server_info :: {

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// when true, return additional detail about servers at the expense of additional API calls.

	detailed?: bool

	// restrict results to servers matching a dictionary of filters

	filters?: string

	// restrict results to servers with names or UUID matching this glob expression (e.g., <web*>).

	server?: string

	// Whether to list servers from all projects or just the current auth scoped project.

	all_projects?: bool
}

os_client_config :: {

	// List of clouds to limit the return list to. No value means return information on all configured clouds

	clouds?: string
}

os_group :: {

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// Group description

	description?: string

	// Domain id to create the group in if the cloud supports domains.

	domain_id?: string

	// Group name

	name: string

	// Should the resource be present or absent.

	state?: string
}

os_user :: {

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// Description about the user

	description?: string

	// Email address for the user

	email?: string

	// Is the user enabled

	enabled?: bool

	// Username for the user

	name: string

	// Password for the user

	password?: string

	// Should the resource be present or absent.

	state?: string

	// C(always) will attempt to update password.  C(on_create) will only set the password for newly created users.

	update_password?: string

	// Project name or ID that the user should be associated with by default

	default_project?: string

	// Domain to create the user in if the cloud supports domains

	domain?: string
}

os_user_role :: {

	// Name or ID of the domain to scope the role association to. Valid only with keystone version 3, and required if I(project) is not specified.

	domain?: string

	// Name or ID for the group. Valid only with keystone version 3. If I(group) is not specified, then I(user) is required. Both may not be specified.

	group?: string

	// Name or ID of the project to scope the role association to. If you are using keystone version 2, then this value is required.

	project?: string

	// Name or ID for the role.

	role: string

	// Should the roles be present or absent on the user.

	state?: string

	// Name or ID for the user. If I(user) is not specified, then I(group) is required. Both may not be specified.

	user?: string

	// Ignored. Present for backwards compatibility

	availability_zone?: string
}

os_zone :: {

	// Master nameservers (only applies if zone_type is secondary)

	masters?: string

	// Zone name

	name: string

	// Should the resource be present or absent.

	state?: string

	// TTL (Time To Live) value in seconds

	ttl?: string

	// Zone type

	zone_type?: string

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// Zone description

	description?: string

	// Email of the zone owner (only applies if zone_type is primary)

	email?: string
}

os_server_volume :: {

	// Device you want to attach. Defaults to auto finding a device name.

	device?: string

	// Name or ID of server you want to attach a volume to

	server: string

	// Should the resource be present or absent.

	state?: string

	// Name or id of volume you want to attach to a server

	volume: string

	// Ignored. Present for backwards compatibility

	availability_zone?: string
}

os_stack :: {

	// Indicate desired state of the resource

	state?: string

	// Tag for the stack that should be created, name could be char and digit, no space

	tag?: string

	// Path of the template file to use for the stack creation

	template?: string

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// List of environment files that should be used for the stack creation

	environment?: string

	// Name of the stack that should be created, name could be char and digit, no space

	name: string

	// Dictionary of parameters for the stack creation

	parameters?: string

	// Rollback stack creation

	rollback?: bool

	// Maximum number of seconds to wait for the stack creation

	timeout?: string
}

os_ironic_inspect :: {

	// If noauth mode is utilized, this is required to be set to the endpoint URL for the Ironic API. Use with "auth" and "auth_type" settings set to None.

	ironic_url?: string

	// unique mac address that is used to attempt to identify the host.

	mac?: string

	// unique name identifier to identify the host in Ironic.

	name?: string

	// A timeout in seconds to tell the role to wait for the node to complete introspection if wait is set to True.

	timeout?: string

	// globally unique identifier (UUID) to identify the host.

	uuid?: string

	// Ignored. Present for backwards compatibility

	availability_zone?: string
}

os_keystone_service :: {

	// Description of the service

	description?: string

	// Is the service enabled

	enabled?: bool

	// Name of the service

	name: string

	// The type of service

	service_type: string

	// Should the resource be present or absent.

	state?: string

	// Ignored. Present for backwards compatibility

	availability_zone?: string
}

os_project_access :: {

	// The availability zone of the resource.

	availability_zone?: string

	// The resource name (eg. tiny).

	resource_name?: string

	// The resource type (eg. nova_flavor, cinder_volume_type).

	resource_type?: string

	// Indicate desired state of the resource.

	state?: string

	// Project id.

	target_project_id: string
}

os_floating_ip :: {

	// A floating IP address to attach or to detach. Required only if I(state) is absent. When I(state) is present can be used to specify a IP address to attach.

	floating_ip_address?: string

	// The name or id of a neutron private network that the fixed IP to attach floating IP is on

	nat_destination?: string

	// When I(state) is absent, indicates whether or not to delete the floating IP completely, or only detach it from the server. Default is to detach only.

	purge?: bool

	// When I(state) is present, and I(floating_ip_address) is not present, this parameter can be used to specify whether we should try to reuse a floating IP address already allocated to the project.

	reuse?: bool

	// The name or ID of the instance to which the IP address should be assigned.

	server: string

	// Time to wait for an IP address to appear as attached. See wait.

	timeout?: string

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// The name or ID of a neutron external network or a nova pool name.

	network?: string

	// Should the resource be present or absent.

	state?: string

	// When attaching a floating IP address, specify whether to wait for it to appear as attached.
	// Must be set to C(yes) for the module to return the value of the floating IP.

	wait?: bool

	// To which fixed IP of server the floating IP address should be attached to.

	fixed_address?: string
}

os_coe_cluster_template :: {

	// The flavor of the master node for this ClusterTemplate

	master_flavor_id?: string

	// Indicates whether the docker registry is enabled

	registry_enabled?: bool

	// The name of the driver used for instantiating container volumes

	volume_driver?: string

	// Indicates whether created clusters should have a load balancer for master nodes or not

	master_lb_enabled?: bool

	// The name of the driver used for instantiating container networks

	network_driver?: string

	// Indicates whether the ClusterTemplate is public or not

	public?: bool

	// Ignored. Present for backwards compatibility

	availability_zone?: string

	// The Container Orchestration Engine for this clustertemplate

	coe?: string

	// The size in GB of the docker volume

	docker_volume_size?: string

	// Address of a proxy that will receive all HTTP requests and relay them The format is a URL including a port number

	http_proxy?: string

	// Name or ID of the keypair to use.

	keypair_id?: string

	// Server type for this ClusterTemplate

	server_type?: string

	// Image id the cluster will be based on

	image_id?: string

	// One or more key/value pairs

	labels?: string

	// Name that has to be given to the cluster template

	name: string

	// The DNS nameserver address

	dns_nameserver?: string

	// The fixed subnet name to attach to the Cluster

	fixed_subnet?: string

	// The flavor of the minion node for this ClusterTemplate

	flavor_id?: string

	// Indicates whether created clusters should have a floating ip or not

	floating_ip_enabled?: bool

	// Address of a proxy that will receive all HTTPS requests and relay them. The format is a URL including a port number

	https_proxy?: string

	// Indicates whether the TLS should be disabled

	tls_disabled?: bool

	// Docker storage driver

	docker_storage_driver?: string

	// The external network to attach to the Cluster

	external_network_id?: string

	// The fixed network name to attach to the Cluster

	fixed_network?: string

	// A comma separated list of IPs for which proxies should not be used in the cluster

	no_proxy?: string

	// Indicate desired state of the resource.

	state?: string
}

os_volume_snapshot :: {

	// The volume name or id to create/delete the snapshot

	volume: string

	// Availability zone in which to create the snapshot.

	availability_zone?: string

	// String describing the snapshot

	display_description?: string

	// Name of the snapshot

	display_name: string

	// Allows or disallows snapshot of a volume to be created when the volume is attached to an instance.

	force?: bool

	// Should the resource be present or absent.

	state?: string
}
