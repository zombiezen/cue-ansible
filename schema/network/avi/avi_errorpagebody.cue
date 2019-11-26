package ansible

module: avi_errorpagebody: {
	module: "avi_errorpagebody"
	author: "Gaurav Rastogi (@grastogi23) <grastogi@avinetworks.com>"

	short_description: "Module for setup of ErrorPageBody Avi RESTful Object"
	description: [
		"This module is used to configure ErrorPageBody object",
		"more examples at U(https://github.com/avinetworks/devops)",
	]
	requirements: ["avisdk"]
	version_added: "2.5"
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
		error_page_body: description: [
			"Error page body sent to client when match.",
			"Field introduced in 17.2.4.",
		]
		format: {
			description: [
				"Format of an error page body html or json.",
				"Enum options - ERROR_PAGE_FORMAT_HTML, ERROR_PAGE_FORMAT_JSON.",
				"Field introduced in 18.2.3.",
				"Default value when not specified in API or module is interpreted by Avi Controller as ERROR_PAGE_FORMAT_HTML.",
			]
			version_added: "2.9"
		}
		name: {
			description: [
				"Field introduced in 17.2.4.",
			]
			required: true
		}
		tenant_ref: description: [
			"It is a reference to an object of type tenant.",
			"Field introduced in 17.2.4.",
		]
		url: description: [
			"Avi controller URL of the object.",
		]
		uuid: description: [
			"Field introduced in 17.2.4.",
		]
	}
	extends_documentation_fragment: ["avi"]
}
