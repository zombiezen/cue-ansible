package ansible

module: gcp_compute_autoscaler: {
	module: "gcp_compute_autoscaler"
	description: [
		"Represents an Autoscaler resource.",
		"Autoscalers allow you to automatically scale virtual machine instances in managed instance groups according to an autoscaling policy that you define.",
	]

	short_description: "Creates a GCP Autoscaler"
	version_added:     "2.9"
	author:            "Google Inc. (@googlecloudplatform)"
	requirements: [
		"python >= 2.6",
		"requests >= 2.18.4",
		"google-auth >= 1.3.0",
	]
	options: {
		state: {
			description: [
				"Whether the given object should exist in GCP",
			]
			choices: [
				"present",
				"absent",
			]
			default: "present"
			type:    "str"
		}
		name: {
			description: [
				"Name of the resource. The name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.",
			]

			required: true
			type:     "str"
		}
		description: {
			description: [
				"An optional description of this resource.",
			]
			required: false
			type:     "str"
		}
		autoscaling_policy: {
			description: [
				"The configuration parameters for the autoscaling algorithm. You can define one or more of the policies for an autoscaler: cpuUtilization, customMetricUtilizations, and loadBalancingUtilization.",
				"If none of these are specified, the default will be to autoscale based on cpuUtilization to 0.6 or 60%.",
			]

			required: true
			type:     "dict"
			suboptions: {
				min_num_replicas: {
					description: [
						"The minimum number of replicas that the autoscaler can scale down to. This cannot be less than 0. If not provided, autoscaler will choose a default value depending on maximum number of instances allowed.",
					]

					required: false
					type:     "int"
					aliases: [
						"minReplicas",
					]
				}
				max_num_replicas: {
					description: [
						"The maximum number of instances that the autoscaler can scale up to. This is required when creating or updating an autoscaler. The maximum number of replicas should not be lower than minimal number of replicas.",
					]

					required: true
					type:     "int"
					aliases: [
						"maxReplicas",
					]
				}
				cool_down_period_sec: {
					description: [
						"The number of seconds that the autoscaler should wait before it starts collecting information from a new instance. This prevents the autoscaler from collecting information when the instance is initializing, during which the collected usage would not be reliable. The default time autoscaler waits is 60 seconds.",
						"Virtual machine initialization times might vary because of numerous factors. We recommend that you test how long an instance may take to initialize. To do this, create an instance and time the startup process.",
					]

					required: false
					default:  "60"
					type:     "int"
					aliases: [
						"cooldownPeriod",
					]
				}
				cpu_utilization: {
					description: [
						"Defines the CPU utilization policy that allows the autoscaler to scale based on the average CPU utilization of a managed instance group.",
					]

					required: false
					type:     "dict"
					suboptions: utilization_target: {
						description: [
							"The target CPU utilization that the autoscaler should maintain.",
							"Must be a float value in the range (0, 1]. If not specified, the default is 0.6.",
							"If the CPU level is below the target utilization, the autoscaler scales down the number of instances until it reaches the minimum number of instances you specified or until the average CPU of your instances reaches the target utilization.",
							"If the average CPU is above the target utilization, the autoscaler scales up until it reaches the maximum number of instances you specified or until the average utilization reaches the target utilization.",
						]

						required: false
						type:     "str"
						aliases: [
							"target",
						]
					}
				}
				custom_metric_utilizations: {
					description: [
						"Defines the CPU utilization policy that allows the autoscaler to scale based on the average CPU utilization of a managed instance group.",
					]

					required: false
					type:     "list"
					aliases: [
						"metric",
					]
					suboptions: {
						metric: {
							description: [
								"The identifier (type) of the Stackdriver Monitoring metric.",
								"The metric cannot have negative values.",
								"The metric must have a value type of INT64 or DOUBLE.",
							]
							required: true
							type:     "str"
							aliases: [
								"name",
							]
						}
						utilization_target: {
							description: [
								"The target value of the metric that autoscaler should maintain. This must be a positive value. A utilization metric scales number of virtual machines handling requests to increase or decrease proportionally to the metric.",
								"For example, a good metric to use as a utilizationTarget is U(www.googleapis.com/compute/instance/network/received_bytes_count).",
								"The autoscaler will work to keep this value constant for each of the instances.",
							]

							required: false
							type:     "str"
							aliases: [
								"target",
							]
						}
						utilization_target_type: {
							description: [
								"Defines how target utilization value is expressed for a Stackdriver Monitoring metric. Either GAUGE, DELTA_PER_SECOND, or DELTA_PER_MINUTE.",
								"Some valid choices include: \"GAUGE\", \"DELTA_PER_SECOND\", \"DELTA_PER_MINUTE\"",
							]
							required: false
							type:     "str"
							aliases: [
								"type",
							]
						}
					}
				}
				load_balancing_utilization: {
					description: [
						"Configuration parameters of autoscaling based on a load balancer.",
					]
					required: false
					type:     "dict"
					suboptions: utilization_target: {
						description: [
							"Fraction of backend capacity utilization (set in HTTP(s) load balancing configuration) that autoscaler should maintain. Must be a positive float value. If not defined, the default is 0.8.",
						]

						required: false
						type:     "str"
						aliases: [
							"target",
						]
					}
				}
			}
		}
		target: {
			description: [
				"URL of the managed instance group that this autoscaler will scale.",
				"This field represents a link to a InstanceGroupManager resource in GCP. It can be specified in two ways. First, you can place a dictionary with key 'selfLink' and value of your resource's selfLink Alternatively, you can add `register: name-of-resource` to a gcp_compute_instance_group_manager task and then set this target field to \"{{ name-of-resource }}\"",
			]

			required: true
			type:     "dict"
		}
		zone: {
			description: [
				"URL of the zone where the instance group resides.",
			]
			required: true
			type:     "str"
		}
		project: {
			description: [
				"The Google Cloud Platform project to use.",
			]
			type: "str"
		}
		auth_kind: {
			description: [
				"The type of credential used.",
			]
			type:     "str"
			required: true
			choices: [
				"application",
				"machineaccount",
				"serviceaccount",
			]
		}
		service_account_contents: {
			description: [
				"The contents of a Service Account JSON file, either in a dictionary or as a JSON string that represents it.",
			]

			type: "jsonarg"
		}
		service_account_file: {
			description: [
				"The path of a Service Account JSON file if serviceaccount is selected as type.",
			]
			type: "path"
		}
		service_account_email: {
			description: [
				"An optional service account email address if machineaccount is selected and the user does not wish to use the default email.",
			]

			type: "str"
		}
		scopes: {
			description: [
				"Array of scopes to be used",
			]
			type: "list"
		}
		env_type: {
			description: [
				"Specifies which Ansible environment you're running this module within.",
				"This should not be set unless you know what you're doing.",
				"This only alters the User Agent string for any API requests.",
			]
			type: "str"
		}
	}
	notes: [
		"API Reference: U(https://cloud.google.com/compute/docs/reference/rest/v1/autoscalers)",
		"Autoscaling Groups of Instances: U(https://cloud.google.com/compute/docs/autoscaler/)",
		"for authentication, you can set service_account_file using the C(gcp_service_account_file) env variable.",
		"for authentication, you can set service_account_contents using the C(GCP_SERVICE_ACCOUNT_CONTENTS) env variable.",
		"For authentication, you can set service_account_email using the C(GCP_SERVICE_ACCOUNT_EMAIL) env variable.",
		"For authentication, you can set auth_kind using the C(GCP_AUTH_KIND) env variable.",
		"For authentication, you can set scopes using the C(GCP_SCOPES) env variable.",
		"Environment variables values will only be used if the playbook values are not set.",
		"The I(service_account_email) and I(service_account_file) options are mutually exclusive.",
	]
}
