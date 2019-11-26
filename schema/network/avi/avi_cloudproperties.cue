package ansible

module: avi_cloudproperties: {
	module: "avi_cloudproperties"
	author: "Gaurav Rastogi (@grastogi23) <grastogi@avinetworks.com>"

	short_description: "Module for setup of CloudProperties Avi RESTful Object"
	description: [
		"This module is used to configure CloudProperties object",
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
		cc_props: description: [
			"Cloudconnector properties.",
		]
		cc_vtypes: description: [
			"Cloud types supported by cloudconnector.",
			"Enum options - CLOUD_NONE, CLOUD_VCENTER, CLOUD_OPENSTACK, CLOUD_AWS, CLOUD_VCA, CLOUD_APIC, CLOUD_MESOS, CLOUD_LINUXSERVER, CLOUD_DOCKER_UCP,",
			"CLOUD_RANCHER, CLOUD_OSHIFT_K8S, CLOUD_AZURE, CLOUD_GCP.",
		]
		hyp_props: description: [
			"Hypervisor properties.",
		]
		info: description: [
			"Properties specific to a cloud type.",
		]
		url: description: [
			"Avi controller URL of the object.",
		]
		uuid: description: [
			"Unique object identifier of the object.",
		]
	}
	extends_documentation_fragment: ["avi"]
}
