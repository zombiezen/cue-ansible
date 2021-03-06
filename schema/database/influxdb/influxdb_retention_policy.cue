package ansible

module: influxdb_retention_policy: {
	module:            "influxdb_retention_policy"
	short_description: "Manage InfluxDB retention policies"
	description: [
		"Manage InfluxDB retention policies",
	]
	version_added: 2.1
	author:        "Kamil Szczygiel (@kamsz)"
	requirements: [
		"python >= 2.6",
		"influxdb >= 0.9",
		"requests",
	]
	options: {
		database_name: {
			description: [
				"Name of the database.",
			]
			required: true
		}
		policy_name: {
			description: [
				"Name of the retention policy",
			]
			required: true
		}
		duration: {
			description: [
				"Determines how long InfluxDB should keep the data",
			]
			required: true
		}
		replication: {
			description: [
				"Determines how many independent copies of each point are stored in the cluster",
			]
			required: true
		}
		default: {
			description: [
				"Sets the retention policy as default retention policy",
			]
			required: true
		}
	}
	extends_documentation_fragment: "influxdb"
}
