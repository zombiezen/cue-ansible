package ansible

module: intersight_rest_api: {
	module:            "intersight_rest_api"
	short_description: "REST API configuration for Cisco Intersight"
	description: [
		"Direct REST API configuration for Cisco Intersight.",
		"All REST API resources and properties must be specified.",
		"For more information see L(Cisco Intersight,https://intersight.com/apidocs).",
	]
	extends_documentation_fragment: "intersight"
	options: {
		resource_path: {
			description: [
				"Resource URI being configured related to api_uri.",
			]
			type:     "str"
			required: true
		}
		query_params: {
			description: [
				"Query parameters for the Intersight API query language.",
			]
			type: "dict"
		}
		update_method: {
			description: [
				"The HTTP method used for update operations.",
				"Some Intersight resources require POST operations for modifications.",
			]
			type: "str"
			choices: ["patch", "post"]
			default: "patch"
		}
		api_body: {
			description: [
				"The payload for API requests used to modify resources.",
			]
			type: "dict"
		}
		state: {
			description: [
				"If C(present), will verify the resource is present and will create if needed.",
				"If C(absent), will verify the resource is absent and will delete if needed.",
			]
			choices: ["present", "absent"]
			default: "present"
		}
	}
	author: [
		"David Soper (@dsoper2)",
		"CiscoUcs (@CiscoUcs)",
	]
	version_added: "2.8"
}
