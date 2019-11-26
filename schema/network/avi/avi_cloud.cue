package ansible

module: avi_cloud: {
	module: "avi_cloud"
	author: "Gaurav Rastogi (@grastogi23) <grastogi@avinetworks.com>"

	short_description: "Module for setup of Cloud Avi RESTful Object"
	description: [
		"This module is used to configure Cloud object",
		"more examples at U(https://github.com/avinetworks/devops)",
	]
	requirements: ["avisdk"]
	version_added: "2.4"
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
		apic_configuration: description: [
			"Apicconfiguration settings for cloud.",
		]
		apic_mode: {
			description: [
				"Boolean flag to set apic_mode.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			type: "bool"
		}
		autoscale_polling_interval: {
			description: [
				"Cloudconnector polling interval for external autoscale groups.",
				"Field introduced in 18.2.2.",
				"Default value when not specified in API or module is interpreted by Avi Controller as 60.",
			]
			version_added: "2.9"
		}
		aws_configuration: description: [
			"Awsconfiguration settings for cloud.",
		]
		azure_configuration: {
			description: [
				"Field introduced in 17.2.1.",
			]
			version_added: "2.5"
		}
		cloudstack_configuration: description: [
			"Cloudstackconfiguration settings for cloud.",
		]
		custom_tags: {
			description: [
				"Custom tags for all avi created resources in the cloud infrastructure.",
				"Field introduced in 17.1.5.",
			]
			version_added: "2.5"
		}
		dhcp_enabled: {
			description: [
				"Select the ip address management scheme.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			type: "bool"
		}
		dns_provider_ref: description: [
			"Dns profile for the cloud.",
			"It is a reference to an object of type ipamdnsproviderprofile.",
		]
		docker_configuration: description: [
			"Dockerconfiguration settings for cloud.",
		]
		east_west_dns_provider_ref: description: [
			"Dns profile for east-west services.",
			"It is a reference to an object of type ipamdnsproviderprofile.",
		]
		east_west_ipam_provider_ref: description: [
			"Ipam profile for east-west services.",
			"Warning - please use virtual subnets in this ipam profile that do not conflict with the underlay networks or any overlay networks in the cluster.",
			"For example in aws and gcp, 169.254.0.0/16 is used for storing instance metadata.",
			"Hence, it should not be used in this profile.",
			"It is a reference to an object of type ipamdnsproviderprofile.",
		]
		enable_vip_static_routes: {
			description: [
				"Use static routes for vip side network resolution during virtualservice placement.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			type: "bool"
		}
		gcp_configuration: {
			description: [
				"Google cloud platform configuration.",
				"Field introduced in 18.2.1.",
			]
			version_added: "2.9"
		}
		ip6_autocfg_enabled: {
			description: [
				"Enable ipv6 auto configuration.",
				"Field introduced in 18.1.1.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			version_added: "2.9"
			type:          "bool"
		}
		ipam_provider_ref: description: [
			"Ipam profile for the cloud.",
			"It is a reference to an object of type ipamdnsproviderprofile.",
		]
		license_tier: {
			description: [
				"Specifies the default license tier which would be used by new se groups.",
				"This field by default inherits the value from system configuration.",
				"Enum options - ENTERPRISE_16, ENTERPRISE_18.",
				"Field introduced in 17.2.5.",
			]
			version_added: "2.5"
		}
		license_type: description: [
			"If no license type is specified then default license enforcement for the cloud type is chosen.",
			"The default mappings are container cloud is max ses, openstack and vmware is cores and linux it is sockets.",
			"Enum options - LIC_BACKEND_SERVERS, LIC_SOCKETS, LIC_CORES, LIC_HOSTS, LIC_SE_BANDWIDTH, LIC_METERED_SE_BANDWIDTH.",
		]
		linuxserver_configuration: description: [
			"Linuxserverconfiguration settings for cloud.",
		]
		mesos_configuration: description: [
			"Field deprecated in 18.2.2.",
		]
		mtu: description: [
			"Mtu setting for the cloud.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 1500.",
		]
		name: {
			description: [
				"Name of the object.",
			]
			required: true
		}
		nsx_configuration: description: [
			"Configuration parameters for nsx manager.",
			"Field introduced in 17.1.1.",
		]
		obj_name_prefix: description: [
			"Default prefix for all automatically created objects in this cloud.",
			"This prefix can be overridden by the se-group template.",
		]
		openstack_configuration: description: [
			"Openstackconfiguration settings for cloud.",
		]
		oshiftk8s_configuration: description: [
			"Oshiftk8sconfiguration settings for cloud.",
		]
		prefer_static_routes: {
			description: [
				"Prefer static routes over interface routes during virtualservice placement.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			type: "bool"
		}
		proxy_configuration: description: [
			"Proxyconfiguration settings for cloud.",
		]
		rancher_configuration: description: [
			"Rancherconfiguration settings for cloud.",
		]
		state_based_dns_registration: {
			description: [
				"Dns records for vips are added/deleted based on the operational state of the vips.",
				"Field introduced in 17.1.12.",
				"Default value when not specified in API or module is interpreted by Avi Controller as True.",
			]
			version_added: "2.5"
			type:          "bool"
		}
		tenant_ref: description: [
			"It is a reference to an object of type tenant.",
		]
		url: description: [
			"Avi controller URL of the object.",
		]
		uuid: description: [
			"Unique object identifier of the object.",
		]
		vca_configuration: description: [
			"Vcloudairconfiguration settings for cloud.",
		]
		vcenter_configuration: description: [
			"Vcenterconfiguration settings for cloud.",
		]
		vtype: {
			description: [
				"Cloud type.",
				"Enum options - CLOUD_NONE, CLOUD_VCENTER, CLOUD_OPENSTACK, CLOUD_AWS, CLOUD_VCA, CLOUD_APIC, CLOUD_MESOS, CLOUD_LINUXSERVER, CLOUD_DOCKER_UCP,",
				"CLOUD_RANCHER, CLOUD_OSHIFT_K8S, CLOUD_AZURE, CLOUD_GCP.",
				"Default value when not specified in API or module is interpreted by Avi Controller as CLOUD_NONE.",
			]
			required: true
		}
	}
	extends_documentation_fragment: ["avi"]
}
