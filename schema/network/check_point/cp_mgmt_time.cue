package ansible

module: cp_mgmt_time: {
	module:            "cp_mgmt_time"
	short_description: "Manages time objects on Check Point over Web Services API"
	description: [
		"Manages time objects on Check Point devices including creating, updating and removing objects.",
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
		end: {
			description: [
				"End time. Note, Each gateway may interpret this time differently according to its time zone.",
			]
			type: "dict"
			suboptions: {
				date: {
					description: [
						"Date in format dd-MMM-yyyy.",
					]
					type: "str"
				}
				iso_8601: {
					description: [
						"Date and time represented in international ISO 8601 format. Time zone information is ignored.",
					]
					type: "str"
				}
				posix: {
					description: [
						"Number of milliseconds that have elapsed since 00,00,00, 1 January 1970.",
					]
					type: "int"
				}
				time: {
					description: [
						"Time in format HH,mm.",
					]
					type: "str"
				}
			}
		}
		end_never: {
			description: [
				"End never.",
			]
			type: "bool"
		}
		hours_ranges: {
			description: [
				"Hours recurrence. Note, Each gateway may interpret this time differently according to its time zone.",
			]
			type: "list"
			suboptions: {
				enabled: {
					description: [
						"Is hour range enabled.",
					]
					type: "bool"
				}
				from: {
					description: [
						"Time in format HH,MM.",
					]
					type: "str"
				}
				index: {
					description: [
						"Hour range index.",
					]
					type: "int"
				}
				to: {
					description: [
						"Time in format HH,MM.",
					]
					type: "str"
				}
			}
		}
		start: {
			description: [
				"Starting time. Note, Each gateway may interpret this time differently according to its time zone.",
			]
			type: "dict"
			suboptions: {
				date: {
					description: [
						"Date in format dd-MMM-yyyy.",
					]
					type: "str"
				}
				iso_8601: {
					description: [
						"Date and time represented in international ISO 8601 format. Time zone information is ignored.",
					]
					type: "str"
				}
				posix: {
					description: [
						"Number of milliseconds that have elapsed since 00,00,00, 1 January 1970.",
					]
					type: "int"
				}
				time: {
					description: [
						"Time in format HH,mm.",
					]
					type: "str"
				}
			}
		}
		start_now: {
			description: [
				"Start immediately.",
			]
			type: "bool"
		}
		tags: {
			description: [
				"Collection of tag identifiers.",
			]
			type: "list"
		}
		recurrence: {
			description: [
				"Days recurrence.",
			]
			type: "dict"
			suboptions: {
				days: {
					description: [
						"Valid on specific days. Multiple options, support range of days in months. Example,[\"1\",\"3\",\"9-20\"].",
					]
					type: "list"
				}
				month: {
					description: [
						"Valid on month. Example, \"1\", \"2\",\"12\",\"Any\".",
					]
					type: "str"
				}
				pattern: {
					description: [
						"Valid on \"Daily\", \"Weekly\", \"Monthly\" base.",
					]
					type: "str"
				}
				weekdays: {
					description: [
						"Valid on weekdays. Example, \"Sun\", \"Mon\"...\"Sat\".",
					]
					type: "list"
				}
			}
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
