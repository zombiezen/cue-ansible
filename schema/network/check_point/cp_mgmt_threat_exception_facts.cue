package ansible

module: cp_mgmt_threat_exception_facts: {
	module:            "cp_mgmt_threat_exception_facts"
	short_description: "Get threat-exception objects facts on Check Point over Web Services API"
	description: [
		"Get threat-exception objects facts on Check Point devices.",
		"All operations are performed over Web Services API.",
		"This module handles both operations, get a specific object and get several objects, For getting a specific object use the parameter 'name'.",
	]

	version_added: "2.9"
	author:        "Or Soffer (@chkp-orso)"
	options: {
		name: {
			description: [
				"The name of the layer containing the parent threat rule. This parameter is relevant only for getting few objects.",
			]

			type: "str"
		}
		exception_group_uid: {
			description: [
				"The UID of the exception-group.",
			]
			type: "str"
		}
		exception_group_name: {
			description: [
				"The name of the exception-group.",
			]
			type: "str"
		}
		layer: {
			description: [
				"Layer that the rule belongs to identified by the name or UID.",
			]
			type: "str"
		}
		rule_name: {
			description: [
				"The name of the parent rule.",
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
		filter: {
			description: [
				"Search expression to filter the rulebase. The provided text should be exactly the same as it would be given in Smart Console. The logical operators in the expression ('AND', 'OR') should be provided in capital letters. If an operator is not used, the default OR operator applies.",
			]

			type: "str"
		}
		filter_settings: {
			description: [
				"Sets filter preferences.",
			]
			type: "dict"
			suboptions: {
				search_mode: {
					description: [
						"When set to 'general', both the Full Text Search and Packet Search are enabled. In this mode, Packet Search will not match on 'Any' object, a negated cell or a group-with-exclusion. When the search-mode is set to 'packet', by default, the match on 'Any' object, a negated cell or a group-with-exclusion are enabled. packet-search-settings may be provided to change the default behavior.",
					]

					type: "str"
					choices: ["general", "packet"]
				}
				packet_search_settings: {
					description: [
						"When 'search-mode' is set to 'packet', this object allows to set the packet search preferences.",
					]
					type: "dict"
					suboptions: {
						expand_group_members: {
							description: [
								"When true, if the search expression contains a UID or a name of a group object, results will include rules that match on at least one member of the group.",
							]

							type: "bool"
						}
						expand_group_with_exclusion_members: {
							description: [
								"When true, if the search expression contains a UID or a name of a group-with-exclusion object, results will include rules that match at least one member of the \"include\" part and is not a member of the \"except\" part.",
							]

							type: "bool"
						}
						match_on_any: {
							description: [
								"Whether to match on 'Any' object.",
							]
							type: "bool"
						}
						match_on_group_with_exclusion: {
							description: [
								"Whether to match on a group-with-exclusion.",
							]
							type: "bool"
						}
						match_on_negate: {
							description: [
								"Whether to match on a negated cell.",
							]
							type: "bool"
						}
					}
				}
			}
		}
		limit: {
			description: [
				"No more than that many results will be returned. This parameter is relevant only for getting few objects.",
			]

			type: "int"
		}
		offset: {
			description: [
				"Skip that many results before beginning to return them. This parameter is relevant only for getting few objects.",
			]

			type: "int"
		}
		order: {
			description: [
				"Sorts results by the given field. By default the results are sorted in the ascending order by name. This parameter is relevant only for getting few objects.",
			]

			type: "list"
			suboptions: {
				ASC: {
					description: [
						"Sorts results by the given field in ascending order.",
					]
					type: "str"
					choices: ["name"]
				}
				DESC: {
					description: [
						"Sorts results by the given field in descending order.",
					]
					type: "str"
					choices: ["name"]
				}
			}
		}
		package: {
			description: [
				"Name of the package.",
			]
			type: "str"
		}
		use_object_dictionary: {
			description: [
				"N/A",
			]
			type: "bool"
		}
		dereference_group_members: {
			description: [
				"Indicates whether to dereference \"members\" field by details level for every object in reply.",
			]
			type: "bool"
		}
		show_membership: {
			description: [
				"Indicates whether to calculate and show \"groups\" field for every object in reply.",
			]
			type: "bool"
		}
	}
	extends_documentation_fragment: "checkpoint_facts"
}
