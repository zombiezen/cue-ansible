package ansible

module: avi_webhook: {
	module: "avi_webhook"
	author: "Gaurav Rastogi (@grastogi23) <grastogi@avinetworks.com>"

	short_description: "Module for setup of Webhook Avi RESTful Object"
	description: [
		"This module is used to configure Webhook object",
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
		callback_url: description: [
			"Callback url for the webhook.",
			"Field introduced in 17.1.1.",
		]
		description: description: [
			"Field introduced in 17.1.1.",
		]
		name: {
			description: [
				"The name of the webhook profile.",
				"Field introduced in 17.1.1.",
			]
			required: true
		}
		tenant_ref: description: [
			"It is a reference to an object of type tenant.",
			"Field introduced in 17.1.1.",
		]
		url: description: [
			"Avi controller URL of the object.",
		]
		uuid: description: [
			"Uuid of the webhook profile.",
			"Field introduced in 17.1.1.",
		]
		verification_token: description: [
			"Verification token sent back with the callback asquery parameters.",
			"Field introduced in 17.1.1.",
		]
	}
	extends_documentation_fragment: ["avi"]
}