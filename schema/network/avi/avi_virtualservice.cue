package ansible

module: avi_virtualservice: {
	module: "avi_virtualservice"
	author: "Gaurav Rastogi (@grastogi23) <grastogi@avinetworks.com>"

	short_description: "Module for setup of VirtualService Avi RESTful Object"
	description: [
		"This module is used to configure VirtualService object",
		"more examples at U(https://github.com/avinetworks/devops)",
	]
	requirements: ["avisdk"]
	version_added: "2.3"
	options: {
		state: {
			description: [
				"The state that should be applied on the entity.",
			]
			default: "present"
			choices: ["absent", "present"]
		}
		avi_api_update_method: {
			description: [
				"Default method for object update is HTTP PUT.",
				"Setting to patch will override that behavior to use HTTP PATCH.",
			]
			version_added: "2.5"
			default:       "put"
			choices: ["put", "patch"]
		}
		avi_api_patch_op: {
			description: [
				"Patch operation to use when using avi_api_update_method as patch.",
			]
			version_added: "2.5"
			choices: ["add", "replace", "delete"]
		}
		active_standby_se_tag: description: [
			"This configuration only applies if the virtualservice is in legacy active standby ha mode and load distribution among active standby is enabled.",
			"This field is used to tag the virtualservice so that virtualservices with the same tag will share the same active serviceengine.",
			"Virtualservices with different tags will have different active serviceengines.",
			"If one of the serviceengine's in the serviceenginegroup fails, all virtualservices will end up using the same active serviceengine.",
			"Redistribution of the virtualservices can be either manual or automated when the failed serviceengine recovers.",
			"Redistribution is based on the auto redistribute property of the serviceenginegroup.",
			"Enum options - ACTIVE_STANDBY_SE_1, ACTIVE_STANDBY_SE_2.",
			"Default value when not specified in API or module is interpreted by Avi Controller as ACTIVE_STANDBY_SE_1.",
		]
		allow_invalid_client_cert: {
			description: [
				"Process request even if invalid client certificate is presented.",
				"Datascript apis need to be used for processing of such requests.",
				"Field introduced in 18.2.3.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			version_added: "2.9"
			type:          "bool"
		}
		analytics_policy: description: [
			"Determines analytics settings for the application.",
		]
		analytics_profile_ref: description: [
			"Specifies settings related to analytics.",
			"It is a reference to an object of type analyticsprofile.",
		]
		apic_contract_graph: {
			description: [
				"The name of the contract/graph associated with the virtual service.",
				"Should be in the <contract name> <graph name> format.",
				"This is applicable only for service integration mode with cisco apic controller.",
				"Field introduced in 17.2.12,18.1.2.",
			]
			version_added: "2.9"
		}
		application_profile_ref: description: [
			"Enable application layer specific features for the virtual service.",
			"It is a reference to an object of type applicationprofile.",
		]
		auto_allocate_floating_ip: {
			description: [
				"Auto-allocate floating/elastic ip from the cloud infrastructure.",
				"Field deprecated in 17.1.1.",
			]
			type: "bool"
		}
		auto_allocate_ip: {
			description: [
				"Auto-allocate vip from the provided subnet.",
				"Field deprecated in 17.1.1.",
			]
			type: "bool"
		}
		availability_zone: description: [
			"Availability-zone to place the virtual service.",
			"Field deprecated in 17.1.1.",
		]
		avi_allocated_fip: {
			description: [
				"(internal-use) fip allocated by avi in the cloud infrastructure.",
				"Field deprecated in 17.1.1.",
			]
			type: "bool"
		}
		avi_allocated_vip: {
			description: [
				"(internal-use) vip allocated by avi in the cloud infrastructure.",
				"Field deprecated in 17.1.1.",
			]
			type: "bool"
		}
		azure_availability_set: {
			description: [
				"(internal-use)applicable for azure only.",
				"Azure availability set to which this vs is associated.",
				"Internally set by the cloud connector.",
				"Field introduced in 17.2.12, 18.1.2.",
			]
			version_added: "2.9"
		}
		bulk_sync_kvcache: {
			description: [
				"(this is a beta feature).",
				"Sync key-value cache to the new ses when vs is scaled out.",
				"For ex  ssl sessions are stored using vs's key-value cache.",
				"When the vs is scaled out, the ssl session information is synced to the new se, allowing existing ssl sessions to be reused on the new se.",
				"Field introduced in 17.2.7, 18.1.1.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			version_added: "2.6"
			type:          "bool"
		}
		client_auth: description: [
			"Http authentication configuration for protected resources.",
		]
		close_client_conn_on_config_update: {
			description: [
				"Close client connection on vs config update.",
				"Field introduced in 17.2.4.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			version_added: "2.5"
			type:          "bool"
		}
		cloud_config_cksum: description: [
			"Checksum of cloud configuration for vs.",
			"Internally set by cloud connector.",
		]
		cloud_ref: description: [
			"It is a reference to an object of type cloud.",
		]
		cloud_type: description: [
			"Enum options - cloud_none, cloud_vcenter, cloud_openstack, cloud_aws, cloud_vca, cloud_apic, cloud_mesos, cloud_linuxserver, cloud_docker_ucp,",
			"cloud_rancher, cloud_oshift_k8s, cloud_azure, cloud_gcp.",
			"Default value when not specified in API or module is interpreted by Avi Controller as CLOUD_NONE.",
		]
		connections_rate_limit: description: [
			"Rate limit the incoming connections to this virtual service.",
		]
		content_rewrite: description: [
			"Profile used to match and rewrite strings in request and/or response body.",
		]
		created_by: description: [
			"Creator name.",
		]
		delay_fairness: {
			description: [
				"Select the algorithm for qos fairness.",
				"This determines how multiple virtual services sharing the same service engines will prioritize traffic over a congested network.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			type: "bool"
		}
		description: description: [
			"User defined description for the object.",
		]
		discovered_network_ref: description: [
			"(internal-use) discovered networks providing reachability for client facing virtual service ip.",
			"This field is deprecated.",
			"It is a reference to an object of type network.",
			"Field deprecated in 17.1.1.",
		]
		discovered_networks: description: [
			"(internal-use) discovered networks providing reachability for client facing virtual service ip.",
			"This field is used internally by avi, not editable by the user.",
			"Field deprecated in 17.1.1.",
		]
		discovered_subnet: description: [
			"(internal-use) discovered subnets providing reachability for client facing virtual service ip.",
			"This field is deprecated.",
			"Field deprecated in 17.1.1.",
		]
		dns_info: description: [
			"Service discovery specific data including fully qualified domain name, type and time-to-live of the dns record.",
			"Note that only one of fqdn and dns_info setting is allowed.",
		]
		dns_policies: {
			description: [
				"Dns policies applied on the dns traffic of the virtual service.",
				"Field introduced in 17.1.1.",
			]
			version_added: "2.4"
		}
		east_west_placement: {
			description: [
				"Force placement on all se's in service group (mesos mode only).",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			type: "bool"
		}
		enable_autogw: {
			description: [
				"Response traffic to clients will be sent back to the source mac address of the connection, rather than statically sent to a default gateway.",
				"Default value when not specified in API or module is interpreted by Avi Controller as True.",
			]
			type: "bool"
		}
		enable_rhi: {
			description: [
				"Enable route health injection using the bgp config in the vrf context.",
			]
			type: "bool"
		}
		enable_rhi_snat: {
			description: [
				"Enable route health injection for source nat'ted floating ip address using the bgp config in the vrf context.",
			]
			type: "bool"
		}
		enabled: {
			description: [
				"Enable or disable the virtual service.",
				"Default value when not specified in API or module is interpreted by Avi Controller as True.",
			]
			type: "bool"
		}
		error_page_profile_ref: {
			description: [
				"Error page profile to be used for this virtualservice.this profile is used to send the custom error page to the client generated by the proxy.",
				"It is a reference to an object of type errorpageprofile.",
				"Field introduced in 17.2.4.",
			]
			version_added: "2.5"
		}
		floating_ip: description: [
			"Floating ip to associate with this virtual service.",
			"Field deprecated in 17.1.1.",
		]
		floating_subnet_uuid: description: [
			"If auto_allocate_floating_ip is true and more than one floating-ip subnets exist, then the subnet for the floating ip address allocation.",
			"This field is applicable only if the virtualservice belongs to an openstack or aws cloud.",
			"In openstack or aws cloud it is required when auto_allocate_floating_ip is selected.",
			"Field deprecated in 17.1.1.",
		]
		flow_dist: description: [
			"Criteria for flow distribution among ses.",
			"Enum options - LOAD_AWARE, CONSISTENT_HASH_SOURCE_IP_ADDRESS, CONSISTENT_HASH_SOURCE_IP_ADDRESS_AND_PORT.",
			"Default value when not specified in API or module is interpreted by Avi Controller as LOAD_AWARE.",
		]
		flow_label_type: description: [
			"Criteria for flow labelling.",
			"Enum options - NO_LABEL, APPLICATION_LABEL, SERVICE_LABEL.",
			"Default value when not specified in API or module is interpreted by Avi Controller as NO_LABEL.",
		]
		fqdn: description: [
			"Dns resolvable, fully qualified domain name of the virtualservice.",
			"Only one of 'fqdn' and 'dns_info' configuration is allowed.",
		]
		host_name_xlate: description: [
			"Translate the host name sent to the servers to this value.",
			"Translate the host name sent from servers back to the value used by the client.",
		]
		http_policies: description: [
			"Http policies applied on the data traffic of the virtual service.",
		]
		ign_pool_net_reach: {
			description: [
				"Ignore pool servers network reachability constraints for virtual service placement.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			type: "bool"
		}
		ip_address: description: [
			"Ip address of the virtual service.",
			"Field deprecated in 17.1.1.",
		]
		ipam_network_subnet: description: [
			"Subnet and/or network for allocating virtualservice ip by ipam provider module.",
			"Field deprecated in 17.1.1.",
		]
		l4_policies: {
			description: [
				"L4 policies applied to the data traffic of the virtual service.",
				"Field introduced in 17.2.7.",
			]
			version_added: "2.6"
		}
		limit_doser: {
			description: [
				"Limit potential dos attackers who exceed max_cps_per_client significantly to a fraction of max_cps_per_client for a while.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			type: "bool"
		}
		max_cps_per_client: description: [
			"Maximum connections per second per client ip.",
			"Allowed values are 10-1000.",
			"Special values are 0- 'unlimited'.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 0.",
		]
		microservice_ref: description: [
			"Microservice representing the virtual service.",
			"It is a reference to an object of type microservice.",
		]
		min_pools_up: {
			description: [
				"Minimum number of up pools to mark vs up.",
				"Field introduced in 18.2.1, 17.2.12.",
			]
			version_added: "2.9"
		}
		name: {
			description: [
				"Name for the virtual service.",
			]
			required: true
		}
		network_profile_ref: description: [
			"Determines network settings such as protocol, tcp or udp, and related options for the protocol.",
			"It is a reference to an object of type networkprofile.",
		]
		network_ref: description: [
			"Manually override the network on which the virtual service is placed.",
			"It is a reference to an object of type network.",
			"Field deprecated in 17.1.1.",
		]
		network_security_policy_ref: description: [
			"Network security policies for the virtual service.",
			"It is a reference to an object of type networksecuritypolicy.",
		]
		nsx_securitygroup: {
			description: [
				"A list of nsx service groups representing the clients which can access the virtual ip of the virtual service.",
				"Field introduced in 17.1.1.",
			]
			version_added: "2.4"
		}
		performance_limits: description: [
			"Optional settings that determine performance limits like max connections or bandwidth etc.",
		]
		pool_group_ref: description: [
			"The pool group is an object that contains pools.",
			"It is a reference to an object of type poolgroup.",
		]
		pool_ref: description: [
			"The pool is an object that contains destination servers and related attributes such as load-balancing and persistence.",
			"It is a reference to an object of type pool.",
		]
		port_uuid: description: [
			"(internal-use) network port assigned to the virtual service ip address.",
			"Field deprecated in 17.1.1.",
		]
		remove_listening_port_on_vs_down: {
			description: [
				"Remove listening port if virtualservice is down.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			type: "bool"
		}
		requests_rate_limit: description: [
			"Rate limit the incoming requests to this virtual service.",
		]
		saml_sp_config: {
			description: [
				"Application-specific saml config.",
				"Field introduced in 18.2.3.",
			]
			version_added: "2.9"
		}
		scaleout_ecmp: {
			description: [
				"Disable re-distribution of flows across service engines for a virtual service.",
				"Enable if the network itself performs flow hashing with ecmp in environments such as gcp.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			type: "bool"
		}
		se_group_ref: description: [
			"The service engine group to use for this virtual service.",
			"Moving to a new se group is disruptive to existing connections for this vs.",
			"It is a reference to an object of type serviceenginegroup.",
		]
		security_policy_ref: {
			description: [
				"Security policy applied on the traffic of the virtual service.",
				"This policy is used to perform security actions such as distributed denial of service (ddos) attack mitigation, etc.",
				"It is a reference to an object of type securitypolicy.",
				"Field introduced in 18.2.1.",
			]
			version_added: "2.9"
		}
		server_network_profile_ref: description: [
			"Determines the network settings profile for the server side of tcp proxied connections.",
			"Leave blank to use the same settings as the client to vs side of the connection.",
			"It is a reference to an object of type networkprofile.",
		]
		service_metadata: {
			description: [
				"Metadata pertaining to the service provided by this virtual service.",
				"In openshift/kubernetes environments, egress pod info is stored.",
				"Any user input to this field will be overwritten by avi vantage.",
			]
			version_added: "2.4"
		}
		service_pool_select: description: [
			"Select pool based on destination port.",
		]
		services: description: [
			"List of services defined for this virtual service.",
		]
		sideband_profile: {
			description: [
				"Sideband configuration to be used for this virtualservice.it can be used for sending traffic to sideband vips for external inspection etc.",
			]
			version_added: "2.4"
		}
		snat_ip: description: [
			"Nat'ted floating source ip address(es) for upstream connection to servers.",
		]
		sp_pool_refs: {
			description: [
				"Gslb pools used to manage site-persistence functionality.",
				"Each site-persistence pool contains the virtualservices in all the other sites, that is auto-generated by the gslb manager.",
				"This is a read-only field for the user.",
				"It is a reference to an object of type pool.",
				"Field introduced in 17.2.2.",
			]
			version_added: "2.5"
		}
		ssl_key_and_certificate_refs: description: [
			"Select or create one or two certificates, ec and/or rsa, that will be presented to ssl/tls terminated connections.",
			"It is a reference to an object of type sslkeyandcertificate.",
		]
		ssl_profile_ref: description: [
			"Determines the set of ssl versions and ciphers to accept for ssl/tls terminated connections.",
			"It is a reference to an object of type sslprofile.",
		]
		ssl_profile_selectors: {
			description: [
				"Select ssl profile based on client ip address match.",
				"Field introduced in 18.2.3.",
			]
			version_added: "2.9"
		}
		ssl_sess_cache_avg_size: description: [
			"Expected number of ssl session cache entries (may be exceeded).",
			"Allowed values are 1024-16383.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 1024.",
		]
		sso_policy: {
			description: [
				"Client authentication and authorization policy for the virtualservice.",
				"Field deprecated in 18.2.3.",
				"Field introduced in 18.2.1.",
			]
			version_added: "2.9"
		}
		sso_policy_ref: {
			description: [
				"The sso policy attached to the virtualservice.",
				"It is a reference to an object of type ssopolicy.",
				"Field introduced in 18.2.3.",
			]
			version_added: "2.9"
		}
		static_dns_records: description: [
			"List of static dns records applied to this virtual service.",
			"These are static entries and no health monitoring is performed against the ip addresses.",
		]
		subnet: description: [
			"Subnet providing reachability for client facing virtual service ip.",
			"Field deprecated in 17.1.1.",
		]
		subnet_uuid: description: [
			"It represents subnet for the virtual service ip address allocation when auto_allocate_ip is true.it is only applicable in openstack or aws cloud.",
			"This field is required if auto_allocate_ip is true.",
			"Field deprecated in 17.1.1.",
		]
		tenant_ref: description: [
			"It is a reference to an object of type tenant.",
		]
		topology_policies: {
			description: [
				"Topology policies applied on the dns traffic of the virtual service based ongslb topology algorithm.",
				"Field introduced in 18.2.3.",
			]
			version_added: "2.9"
		}
		traffic_clone_profile_ref: {
			description: [
				"Server network or list of servers for cloning traffic.",
				"It is a reference to an object of type trafficcloneprofile.",
				"Field introduced in 17.1.1.",
			]
			version_added: "2.4"
		}
		traffic_enabled: {
			description: [
				"Knob to enable the virtual service traffic on its assigned service engines.",
				"This setting is effective only when the enabled flag is set to true.",
				"Field introduced in 17.2.8.",
				"Default value when not specified in API or module is interpreted by Avi Controller as True.",
			]
			version_added: "2.6"
			type:          "bool"
		}
		type: description: [
			"Specify if this is a normal virtual service, or if it is the parent or child of an sni-enabled virtual hosted virtual service.",
			"Enum options - VS_TYPE_NORMAL, VS_TYPE_VH_PARENT, VS_TYPE_VH_CHILD.",
			"Default value when not specified in API or module is interpreted by Avi Controller as VS_TYPE_NORMAL.",
		]
		url: description: [
			"Avi controller URL of the object.",
		]
		use_bridge_ip_as_vip: {
			description: [
				"Use bridge ip as vip on each host in mesos deployments.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			type: "bool"
		}
		use_vip_as_snat: {
			description: [
				"Use the virtual ip as the snat ip for health monitoring and sending traffic to the backend servers instead of the service engine interface ip.",
				"The caveat of enabling this option is that the virtualservice cannot be configued in an active-active ha mode.",
				"Dns based multi vip solution has to be used for ha & non-disruptive upgrade purposes.",
				"Field introduced in 17.1.9,17.2.3.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			version_added: "2.5"
			type:          "bool"
		}
		uuid: description: [
			"Uuid of the virtualservice.",
		]
		vh_domain_name: description: [
			"The exact name requested from the client's sni-enabled tls hello domain name field.",
			"If this is a match, the parent vs will forward the connection to this child vs.",
		]
		vh_parent_vs_uuid: description: [
			"Specifies the virtual service acting as virtual hosting (sni) parent.",
		]
		vip: {
			description: [
				"List of virtual service ips.",
				"While creating a 'shared vs',please use vsvip_ref to point to the shared entities.",
				"Field introduced in 17.1.1.",
			]
			version_added: "2.4"
		}
		vrf_context_ref: description: [
			"Virtual routing context that the virtual service is bound to.",
			"This is used to provide the isolation of the set of networks the application is attached to.",
			"It is a reference to an object of type vrfcontext.",
		]
		vs_datascripts: description: [
			"Datascripts applied on the data traffic of the virtual service.",
		]
		vsvip_cloud_config_cksum: {
			description: [
				"Checksum of cloud configuration for vsvip.",
				"Internally set by cloud connector.",
				"Field introduced in 17.2.9, 18.1.2.",
			]
			version_added: "2.9"
		}
		vsvip_ref: {
			description: [
				"Mostly used during the creation of shared vs, this field refers to entities that can be shared across virtual services.",
				"It is a reference to an object of type vsvip.",
				"Field introduced in 17.1.1.",
			]
			version_added: "2.4"
		}
		waf_policy_ref: {
			description: [
				"Waf policy for the virtual service.",
				"It is a reference to an object of type wafpolicy.",
				"Field introduced in 17.2.1.",
			]
			version_added: "2.5"
		}
		weight: description: [
			"The quality of service weight to assign to traffic transmitted from this virtual service.",
			"A higher weight will prioritize traffic versus other virtual services sharing the same service engines.",
			"Allowed values are 1-128.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 1.",
		]
	}
	extends_documentation_fragment: ["avi"]
}
