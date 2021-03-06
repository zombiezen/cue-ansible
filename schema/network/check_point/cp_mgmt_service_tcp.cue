package ansible

module: cp_mgmt_service_tcp: {
	module:            "cp_mgmt_service_tcp"
	short_description: "Manages service-tcp objects on Check Point over Web Services API"
	description: [
		"Manages service-tcp objects on Check Point devices including creating, updating and removing objects.",
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
		aggressive_aging: {
			description: [
				"Sets short (aggressive) timeouts for idle connections.",
			]
			type: "dict"
			suboptions: {
				default_timeout: {
					description: [
						"Default aggressive aging timeout in seconds.",
					]
					type: "int"
				}
				enable: {
					description: [
						"N/A",
					]
					type: "bool"
				}
				timeout: {
					description: [
						"Aggressive aging timeout in seconds.",
					]
					type: "int"
				}
				use_default_timeout: {
					description: [
						"N/A",
					]
					type: "bool"
				}
			}
		}
		keep_connections_open_after_policy_installation: {
			description: [
				"Keep connections open after policy has been installed even if they are not allowed under the new policy. This overrides the settings in the Connection Persistence page. If you change this property, the change will not affect open connections, but only future connections.",
			]

			type: "bool"
		}
		match_by_protocol_signature: {
			description: [
				"A value of true enables matching by the selected protocol's signature - the signature identifies the protocol as genuine. Select this option to limit the port to the specified protocol. If the selected protocol does not support matching by signature, this field cannot be set to true.",
			]

			type: "bool"
		}
		match_for_any: {
			description: [
				"Indicates whether this service is used when 'Any' is set as the rule's service and there are several service objects with the same source port and protocol.",
			]

			type: "bool"
		}
		override_default_settings: {
			description: [
				"Indicates whether this service is a Data Domain service which has been overridden.",
			]
			type: "bool"
		}
		port: {
			description: [
				"The number of the port used to provide this service. To specify a port range, place a hyphen between the lowest and highest port numbers, for example 44-55.",
			]

			type: "str"
		}
		protocol: {
			description: [
				"Select the protocol type associated with the service, and by implication, the management server (if any) that enforces Content Security and Authentication for the service. Selecting a Protocol Type invokes the specific protocol handlers for each protocol type, thus enabling higher level of security by parsing the protocol, and higher level of connectivity by tracking dynamic actions (such as opening of ports).",
			]

			type: "str"
		}
		session_timeout: {
			description: [
				"Time (in seconds) before the session times out.",
			]
			type: "int"
		}
		source_port: {
			description: [
				"Port number for the client side service. If specified, only those Source port Numbers will be Accepted, Dropped, or Rejected during packet inspection. Otherwise, the source port is not inspected.",
			]

			type: "str"
		}
		sync_connections_on_cluster: {
			description: [
				"Enables state-synchronized High Availability or Load Sharing on a ClusterXL or OPSEC-certified cluster.",
			]
			type: "bool"
		}
		tags: {
			description: [
				"Collection of tag identifiers.",
			]
			type: "list"
		}
		use_default_session_timeout: {
			description: [
				"Use default virtual session timeout.",
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
