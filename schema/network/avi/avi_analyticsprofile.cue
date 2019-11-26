package ansible

module: avi_analyticsprofile: {
	module: "avi_analyticsprofile"
	author: "Gaurav Rastogi (@grastogi23) <grastogi@avinetworks.com>"

	short_description: "Module for setup of AnalyticsProfile Avi RESTful Object"
	description: [
		"This module is used to configure AnalyticsProfile object",
		"more examples at U(https://github.com/avinetworks/devops)",
	]
	requirements: ["avisdk"]
	version_added: "2.3"
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
		apdex_response_threshold: description: [
			"If a client receives an http response in less than the satisfactory latency threshold, the request is considered satisfied.",
			"It is considered tolerated if it is not satisfied and less than tolerated latency factor multiplied by the satisfactory latency threshold.",
			"Greater than this number and the client's request is considered frustrated.",
			"Allowed values are 1-30000.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 500.",
		]
		apdex_response_tolerated_factor: description: [
			"Client tolerated response latency factor.",
			"Client must receive a response within this factor times the satisfactory threshold (apdex_response_threshold) to be considered tolerated.",
			"Allowed values are 1-1000.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 4.0.",
		]
		apdex_rtt_threshold: description: [
			"Satisfactory client to avi round trip time(rtt).",
			"Allowed values are 1-2000.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 250.",
		]
		apdex_rtt_tolerated_factor: description: [
			"Tolerated client to avi round trip time(rtt) factor.",
			"It is a multiple of apdex_rtt_tolerated_factor.",
			"Allowed values are 1-1000.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 4.0.",
		]
		apdex_rum_threshold: description: [
			"If a client is able to load a page in less than the satisfactory latency threshold, the pageload is considered satisfied.",
			"It is considered tolerated if it is greater than satisfied but less than the tolerated latency multiplied by satisfied latency.",
			"Greater than this number and the client's request is considered frustrated.",
			"A pageload includes the time for dns lookup, download of all http objects, and page render time.",
			"Allowed values are 1-30000.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 5000.",
		]
		apdex_rum_tolerated_factor: description: [
			"Virtual service threshold factor for tolerated page load time (plt) as multiple of apdex_rum_threshold.",
			"Allowed values are 1-1000.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 4.0.",
		]
		apdex_server_response_threshold: description: [
			"A server http response is considered satisfied if latency is less than the satisfactory latency threshold.",
			"The response is considered tolerated when it is greater than satisfied but less than the tolerated latency factor * s_latency.",
			"Greater than this number and the server response is considered frustrated.",
			"Allowed values are 1-30000.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 400.",
		]
		apdex_server_response_tolerated_factor: description: [
			"Server tolerated response latency factor.",
			"Servermust response within this factor times the satisfactory threshold (apdex_server_response_threshold) to be considered tolerated.",
			"Allowed values are 1-1000.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 4.0.",
		]
		apdex_server_rtt_threshold: description: [
			"Satisfactory client to avi round trip time(rtt).",
			"Allowed values are 1-2000.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 125.",
		]
		apdex_server_rtt_tolerated_factor: description: [
			"Tolerated client to avi round trip time(rtt) factor.",
			"It is a multiple of apdex_rtt_tolerated_factor.",
			"Allowed values are 1-1000.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 4.0.",
		]
		client_log_config: description: [
			"Configure which logs are sent to the avi controller from ses and how they are processed.",
		]
		client_log_streaming_config: {
			description: [
				"Configure to stream logs to an external server.",
				"Field introduced in 17.1.1.",
			]
			version_added: "2.4"
		}
		conn_lossy_ooo_threshold: description: [
			"A connection between client and avi is considered lossy when more than this percentage of out of order packets are received.",
			"Allowed values are 1-100.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 50.",
		]
		conn_lossy_timeo_rexmt_threshold: description: [
			"A connection between client and avi is considered lossy when more than this percentage of packets are retransmitted due to timeout.",
			"Allowed values are 1-100.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 20.",
		]
		conn_lossy_total_rexmt_threshold: description: [
			"A connection between client and avi is considered lossy when more than this percentage of packets are retransmitted.",
			"Allowed values are 1-100.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 50.",
		]
		conn_lossy_zero_win_size_event_threshold: description: [
			"A client connection is considered lossy when percentage of times a packet could not be transmitted due to tcp zero window is above this threshold.",
			"Allowed values are 0-100.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 2.",
		]
		conn_server_lossy_ooo_threshold: description: [
			"A connection between avi and server is considered lossy when more than this percentage of out of order packets are received.",
			"Allowed values are 1-100.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 50.",
		]
		conn_server_lossy_timeo_rexmt_threshold: description: [
			"A connection between avi and server is considered lossy when more than this percentage of packets are retransmitted due to timeout.",
			"Allowed values are 1-100.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 20.",
		]
		conn_server_lossy_total_rexmt_threshold: description: [
			"A connection between avi and server is considered lossy when more than this percentage of packets are retransmitted.",
			"Allowed values are 1-100.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 50.",
		]
		conn_server_lossy_zero_win_size_event_threshold: description: [
			"A server connection is considered lossy when percentage of times a packet could not be transmitted due to tcp zero window is above this threshold.",
			"Allowed values are 0-100.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 2.",
		]
		description: description: [
			"User defined description for the object.",
		]
		disable_ondemand_metrics: {
			description: [
				"Virtual service (vs) metrics are processed only when there is live data traffic on the vs.",
				"In case, vs is idle for a period of time as specified by ondemand_metrics_idle_timeout then metrics processing is suspended for that vs.",
				"Field introduced in 18.1.1.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			version_added: "2.9"
			type:          "bool"
		}
		disable_se_analytics: {
			description: [
				"Disable node (service engine) level analytics forvs metrics.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			type: "bool"
		}
		disable_server_analytics: {
			description: [
				"Disable analytics on backend servers.",
				"This may be desired in container environment when there are large number of ephemeral servers.",
				"Additionally, no healthscore of servers is computed when server analytics is disabled.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			type: "bool"
		}
		disable_vs_analytics: {
			description: [
				"Disable virtualservice (frontend) analytics.",
				"This flag disables metrics and healthscore for virtualservice.",
				"Field introduced in 18.2.1.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			version_added: "2.9"
			type:          "bool"
		}
		enable_advanced_analytics: {
			description: [
				"Enables advanced analytics features like anomaly detection.",
				"If set to false, anomaly computation (and associated rules/events) for vs, pool and server metrics will be disabled.",
				"However, setting it to false reduces cpu and memory requirements for analytics subsystem.",
				"Field introduced in 17.2.13, 18.1.5, 18.2.1.",
				"Default value when not specified in API or module is interpreted by Avi Controller as True.",
			]
			version_added: "2.9"
			type:          "bool"
		}
		exclude_client_close_before_request_as_error: {
			description: [
				"Exclude client closed connection before an http request could be completed from being classified as an error.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			type: "bool"
		}
		exclude_dns_policy_drop_as_significant: {
			description: [
				"Exclude dns policy drops from the list of errors.",
				"Field introduced in 17.2.2.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			version_added: "2.5"
			type:          "bool"
		}
		exclude_gs_down_as_error: {
			description: [
				"Exclude queries to gslb services that are operationally down from the list of errors.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			type: "bool"
		}
		exclude_http_error_codes: description: [
			"List of http status codes to be excluded from being classified as an error.",
			"Error connections or responses impacts health score, are included as significant logs, and may be classified as part of a dos attack.",
		]
		exclude_invalid_dns_domain_as_error: {
			description: [
				"Exclude dns queries to domains outside the domains configured in the dns application profile from the list of errors.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			type: "bool"
		}
		exclude_invalid_dns_query_as_error: {
			description: [
				"Exclude invalid dns queries from the list of errors.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			type: "bool"
		}
		exclude_no_dns_record_as_error: {
			description: [
				"Exclude queries to domains that did not have configured services/records from the list of errors.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			type: "bool"
		}
		exclude_no_valid_gs_member_as_error: {
			description: [
				"Exclude queries to gslb services that have no available members from the list of errors.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			type: "bool"
		}
		exclude_persistence_change_as_error: {
			description: [
				"Exclude persistence server changed while load balancing' from the list of errors.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			type: "bool"
		}
		exclude_server_dns_error_as_error: {
			description: [
				"Exclude server dns error response from the list of errors.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			type: "bool"
		}
		exclude_server_tcp_reset_as_error: {
			description: [
				"Exclude server tcp reset from errors.",
				"It is common for applications like ms exchange.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			type: "bool"
		}
		exclude_sip_error_codes: {
			description: [
				"List of sip status codes to be excluded from being classified as an error.",
				"Field introduced in 17.2.13, 18.1.5, 18.2.1.",
			]
			version_added: "2.9"
		}
		exclude_syn_retransmit_as_error: {
			description: [
				"Exclude 'server unanswered syns' from the list of errors.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			type: "bool"
		}
		exclude_tcp_reset_as_error: {
			description: [
				"Exclude tcp resets by client from the list of potential errors.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			type: "bool"
		}
		exclude_unsupported_dns_query_as_error: {
			description: [
				"Exclude unsupported dns queries from the list of errors.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			type: "bool"
		}
		healthscore_max_server_limit: {
			description: [
				"Skips health score computation of pool servers when number of servers in a pool is more than this setting.",
				"Allowed values are 0-5000.",
				"Special values are 0- 'server health score is disabled'.",
				"Field introduced in 17.2.13, 18.1.4.",
				"Default value when not specified in API or module is interpreted by Avi Controller as 20.",
			]
			version_added: "2.9"
		}
		hs_event_throttle_window: description: [
			"Time window (in secs) within which only unique health change events should occur.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 1209600.",
		]
		hs_max_anomaly_penalty: description: [
			"Maximum penalty that may be deducted from health score for anomalies.",
			"Allowed values are 0-100.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 10.",
		]
		hs_max_resources_penalty: description: [
			"Maximum penalty that may be deducted from health score for high resource utilization.",
			"Allowed values are 0-100.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 25.",
		]
		hs_max_security_penalty: description: [
			"Maximum penalty that may be deducted from health score based on security assessment.",
			"Allowed values are 0-100.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 100.",
		]
		hs_min_dos_rate: description: [
			"Dos connection rate below which the dos security assessment will not kick in.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 1000.",
		]
		hs_performance_boost: description: [
			"Adds free performance score credits to health score.",
			"It can be used for compensating health score for known slow applications.",
			"Allowed values are 0-100.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 0.",
		]
		hs_pscore_traffic_threshold_l4_client: description: [
			"Threshold number of connections in 5min, below which apdexr, apdexc, rum_apdex, and other network quality metrics are not computed.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 10.0.",
		]
		hs_pscore_traffic_threshold_l4_server: description: [
			"Threshold number of connections in 5min, below which apdexr, apdexc, rum_apdex, and other network quality metrics are not computed.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 10.0.",
		]
		hs_security_certscore_expired: description: [
			"Score assigned when the certificate has expired.",
			"Allowed values are 0-5.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 0.0.",
		]
		hs_security_certscore_gt30d: description: [
			"Score assigned when the certificate expires in more than 30 days.",
			"Allowed values are 0-5.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 5.0.",
		]
		hs_security_certscore_le07d: description: [
			"Score assigned when the certificate expires in less than or equal to 7 days.",
			"Allowed values are 0-5.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 2.0.",
		]
		hs_security_certscore_le30d: description: [
			"Score assigned when the certificate expires in less than or equal to 30 days.",
			"Allowed values are 0-5.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 4.0.",
		]
		hs_security_chain_invalidity_penalty: description: [
			"Penalty for allowing certificates with invalid chain.",
			"Allowed values are 0-5.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 1.0.",
		]
		hs_security_cipherscore_eq000b: description: [
			"Score assigned when the minimum cipher strength is 0 bits.",
			"Allowed values are 0-5.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 0.0.",
		]
		hs_security_cipherscore_ge128b: description: [
			"Score assigned when the minimum cipher strength is greater than equal to 128 bits.",
			"Allowed values are 0-5.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 5.0.",
		]
		hs_security_cipherscore_lt128b: description: [
			"Score assigned when the minimum cipher strength is less than 128 bits.",
			"Allowed values are 0-5.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 3.5.",
		]
		hs_security_encalgo_score_none: description: [
			"Score assigned when no algorithm is used for encryption.",
			"Allowed values are 0-5.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 0.0.",
		]
		hs_security_encalgo_score_rc4: description: [
			"Score assigned when rc4 algorithm is used for encryption.",
			"Allowed values are 0-5.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 2.5.",
		]
		hs_security_hsts_penalty: description: [
			"Penalty for not enabling hsts.",
			"Allowed values are 0-5.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 1.0.",
		]
		hs_security_nonpfs_penalty: description: [
			"Penalty for allowing non-pfs handshakes.",
			"Allowed values are 0-5.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 1.0.",
		]
		hs_security_selfsignedcert_penalty: description: [
			"Deprecated.",
			"Allowed values are 0-5.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 1.0.",
		]
		hs_security_ssl30_score: description: [
			"Score assigned when supporting ssl3.0 encryption protocol.",
			"Allowed values are 0-5.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 3.5.",
		]
		hs_security_tls10_score: description: [
			"Score assigned when supporting tls1.0 encryption protocol.",
			"Allowed values are 0-5.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 5.0.",
		]
		hs_security_tls11_score: description: [
			"Score assigned when supporting tls1.1 encryption protocol.",
			"Allowed values are 0-5.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 5.0.",
		]
		hs_security_tls12_score: description: [
			"Score assigned when supporting tls1.2 encryption protocol.",
			"Allowed values are 0-5.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 5.0.",
		]
		hs_security_weak_signature_algo_penalty: description: [
			"Penalty for allowing weak signature algorithm(s).",
			"Allowed values are 0-5.",
			"Default value when not specified in API or module is interpreted by Avi Controller as 1.0.",
		]
		name: {
			description: [
				"The name of the analytics profile.",
			]
			required: true
		}
		ondemand_metrics_idle_timeout: {
			description: [
				"This flag sets the time duration of no live data traffic after which virtual service metrics processing is suspended.",
				"It is applicable only when disable_ondemand_metrics is set to false.",
				"Field introduced in 18.1.1.",
				"Default value when not specified in API or module is interpreted by Avi Controller as 1800.",
			]
			version_added: "2.9"
		}
		ranges: description: [
			"List of http status code ranges to be excluded from being classified as an error.",
		]
		resp_code_block: description: [
			"Block of http response codes to be excluded from being classified as an error.",
			"Enum options - AP_HTTP_RSP_4XX, AP_HTTP_RSP_5XX.",
		]
		sensitive_log_profile: {
			description: [
				"Rules applied to the http application log for filtering sensitive information.",
				"Field introduced in 17.2.10, 18.1.2.",
			]
			version_added: "2.9"
		}
		sip_log_depth: {
			description: [
				"Maximum number of sip messages added in logs for a sip transaction.",
				"By default, this value is 20.",
				"Allowed values are 1-1000.",
				"Field introduced in 17.2.13, 18.1.5, 18.2.1.",
				"Default value when not specified in API or module is interpreted by Avi Controller as 20.",
			]
			version_added: "2.9"
		}
		tenant_ref: description: [
			"It is a reference to an object of type tenant.",
		]
		url: description: [
			"Avi controller URL of the object.",
		]
		uuid: description: [
			"Uuid of the analytics profile.",
		]
	}
	extends_documentation_fragment: ["avi"]
}
