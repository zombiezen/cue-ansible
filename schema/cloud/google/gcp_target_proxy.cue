package ansible

module: gcp_target_proxy: {
	module:            "gcp_target_proxy"
	version_added:     "2.4"
	short_description: "Create, Update or Destroy a Target_Proxy."
	description: [
		"Create, Update or Destroy a Target_Proxy. See U(https://cloud.google.com/compute/docs/load-balancing/http/target-proxies) for an overview. More details on the Target_Proxy API can be found at U(https://cloud.google.com/compute/docs/reference/latest/targetHttpProxies#resource-representations).",
	]

	requirements: [
		"python >= 2.6",
		"google-api-python-client >= 1.6.2",
		"google-auth >= 0.9.0",
		"google-auth-httplib2 >= 0.0.2",
	]
	deprecated: {
		removed_in:  "2.12"
		why:         "Updated modules released with increased functionality"
		alternative: "Use M(gcp_compute_target_http_proxy) instead."
	}
	notes: [
		"Currently only supports global HTTP proxy.",
	]
	author: [
		"Tom Melendez (@supertom) <tom@supertom.com>",
	]
	options: {
		target_proxy_name: {
			description: [
				"Name of the Target_Proxy.",
			]
			required: true
		}
		target_proxy_type: {
			description: [
				"Type of Target_Proxy. HTTP, HTTPS or SSL. Only HTTP is currently supported.",
			]
			required: true
		}
		url_map_name: {
			description: [
				"Name of the Url Map.  Required if type is HTTP or HTTPS proxy.",
			]
			required: false
		}
	}
}
