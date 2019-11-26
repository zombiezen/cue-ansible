package ansible

module: cp_mgmt_application_site: {
	module:            "cp_mgmt_application_site"
	short_description: "Manages application-site objects on Check Point over Web Services API"
	description: [
		"Manages application-site objects on Check Point devices including creating, updating and removing objects.",
		"All operations are performed over Web Services API.",
	]
	version_added: "2.9"
	author:        "Or Soffer (@chkp-orso)"
	options: {
		name: {
			description: [
				"Object name.",
			]
			type:     "str"
			required: true
		}
		primary_category: {
			description: [
				"Each application is assigned to one primary category based on its most defining aspect.",
			]
			type: "str"
		}
		url_list: {
			description: [
				"URLs that determine this particular application.",
			]
			type: "list"
		}
		application_signature: {
			description: [
				"Application signature generated by <a href=\"https,//supportcenter.checkpoint.com/supportcenter/portal?eventSubmit_doGoviewsolutiondetails=&solutionid=sk103051\">Signature Tool</a>.",
			]

			type: "str"
		}
		additional_categories: {
			description: [
				"Used to configure or edit the additional categories of a custom application / site used in the Application and URL Filtering or Threat Prevention.",
			]
			type: "list"
		}
		description: {
			description: [
				"A description for the application.",
			]
			type: "str"
		}
		tags: {
			description: [
				"Collection of tag identifiers.",
			]
			type: "list"
		}
		urls_defined_as_regular_expression: {
			description: [
				"States whether the URL is defined as a Regular Expression or not.",
			]
			type: "bool"
		}
		color: {
			description: [
				"Color of the object. Should be one of existing colors.",
			]
			type: "str"
			choices: [
				"aquamarine",
				"black",
				"blue",
				"crete blue",
				"burlywood",
				"cyan",
				"dark green",
				"khaki",
				"orchid",
				"dark orange",
				"dark sea green",
				"pink",
				"turquoise",
				"dark blue",
				"firebrick",
				"brown",
				"forest green",
				"gold",
				"dark gold",
				"gray",
				"dark gray",
				"light green",
				"lemon chiffon",
				"coral",
				"sea green",
				"sky blue",
				"magenta",
				"purple",
				"slate blue",
				"violet red",
				"navy blue",
				"olive",
				"orange",
				"red",
				"sienna",
				"yellow",
			]
		}
		comments: {
			description: [
				"Comments string.",
			]
			type: "str"
		}
		details_level: {
			description: [
				"The level of detail for some of the fields in the response can vary from showing only the UID value of the object to a fully detailed representation of the object.",
			]

			type: "str"
			choices: ["uid", "standard", "full"]
		}
		groups: {
			description: [
				"Collection of group identifiers.",
			]
			type: "list"
		}
		ignore_warnings: {
			description: [
				"Apply changes ignoring warnings.",
			]
			type: "bool"
		}
		ignore_errors: {
			description: [
				"Apply changes ignoring errors. You won't be able to publish such a changes. If ignore-warnings flag was omitted - warnings will also be ignored.",
			]
			type: "bool"
		}
	}
	extends_documentation_fragment: "checkpoint_objects"
}
