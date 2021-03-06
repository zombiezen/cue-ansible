package ansible

module: mongodb_replicaset: {
	module:            "mongodb_replicaset"
	short_description: "Initialises a MongoDB replicaset."
	description: [
		"Initialises a MongoDB replicaset in a new deployment.",
		"Validates the replicaset name for existing deployments.",
	]
	author:        "Rhys Campbell (@rhysmeister)"
	version_added: "2.8"
	options: {
		login_user: {
			description: [
				"The username to authenticate with.",
			]
			type: "str"
		}
		login_password: {
			description: [
				"The password to authenticate with.",
			]
			type: "str"
		}
		login_database: {
			description: [
				"The database where login credentials are stored.",
			]
			type:    "str"
			default: "admin"
		}
		login_host: {
			description: [
				"The MongoDB hostname.",
			]
			type:    "str"
			default: "localhost"
		}
		login_port: {
			description: [
				"The MongoDB port to login to.",
			]
			type:    "int"
			default: 27017
		}
		replica_set: {
			description: [
				"Replicaset name.",
			]
			type:    "str"
			default: "rs0"
		}
		members: {
			description: [
				"A comma-separated string or a yaml list consisting of the replicaset members.",
				"Supply as a simple csv string, i.e. mongodb1:27017,mongodb2:27017,mongodb3:27017.",
				"If a port number is not provided then 27017 is assumed.",
			]
			type: "list"
		}
		validate: {
			description: [
				"Performs some basic validation on the provided replicaset config.",
			]
			type:    "bool"
			default: true
		}
		ssl: {
			description: [
				"Whether to use an SSL connection when connecting to the database",
			]
			type:    "bool"
			default: false
		}
		ssl_cert_reqs: {
			description: [
				"Specifies whether a certificate is required from the other side of the connection, and whether it will be validated if provided.",
			]
			type:    "str"
			default: "CERT_REQUIRED"
			choices: ["CERT_NONE", "CERT_OPTIONAL", "CERT_REQUIRED"]
		}
		arbiter_at_index: {
			description: [
				"Identifies the position of the member in the array that is an arbiter.",
			]
			type: "int"
		}
		chaining_allowed: {
			description: [
				"When I(settings.chaining_allowed=true), the replicaset allows secondary members to replicate from other secondary members.",
				"When I(settings.chaining_allowed=false), secondaries can replicate only from the primary.",
			]
			type:    "bool"
			default: true
		}
		heartbeat_timeout_secs: {
			description: [
				"Number of seconds that the replicaset members wait for a successful heartbeat from each other.",
				"If a member does not respond in time, other members mark the delinquent member as inaccessible.",
				"The setting only applies when using I(protocol_version=0). When using I(protocol_version=1) the relevant setting is I(settings.election_timeout_millis).",
			]

			type:    "int"
			default: 10
		}
		election_timeout_millis: {
			description: [
				"The time limit in milliseconds for detecting when a replicaset's primary is unreachable.",
			]
			type:    "int"
			default: 10000
		}
		protocol_version: {
			description: "Version of the replicaset election protocol."
			type:        "int"
			choices: [0, 1]
			default: 1
		}
	}
	notes: [
		"Requires the pymongo Python package on the remote host, version 2.4.2+. This can be installed using pip or the OS package manager. @see U(http://api.mongodb.org/python/current/installation.html)",
	]

	requirements: ["pymongo"]
}
