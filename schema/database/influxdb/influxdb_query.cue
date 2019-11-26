package ansible

module: influxdb_query: {
	module:            "influxdb_query"
	short_description: "Query data points from InfluxDB."
	description: [
		"Query data points from InfluxDB.",
	]
	version_added: 2.5
	author:        "René Moser (@resmo)"
	requirements: [
		"python >= 2.6",
		"influxdb >= 0.9",
	]
	options: {
		query: {
			description: ["Query to be executed."]
			required: true
		}
		database_name: {
			description: ["Name of the database."]
			required: true
		}
	}
	extends_documentation_fragment: "influxdb"
}
