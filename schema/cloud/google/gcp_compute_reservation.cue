package ansible

module: gcp_compute_reservation: {
	module: "gcp_compute_reservation"
	description: [
		"Represents a reservation resource. A reservation ensures that capacity is held in a specific zone even if the reserved VMs are not running.",
		"Reservations apply only to Compute Engine, Cloud Dataproc, and Google Kubernetes Engine VM usage.Reservations do not apply to `f1-micro` or `g1-small` machine types, preemptible VMs, sole tenant nodes, or other services not listed above like Cloud SQL and Dataflow.",
	]

	short_description: "Creates a GCP Reservation"
	version_added:     "2.10"
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
		description: {
			description: [
				"An optional description of this resource.",
			]
			required: false
			type:     "str"
		}
		name: {
			description: [
				"Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.",
			]

			required: true
			type:     "str"
		}
		specific_reservation_required: {
			description: [
				"When set to true, only VMs that target this reservation by name can consume this reservation. Otherwise, it can be consumed by VMs with affinity for any reservation. Defaults to false.",
			]

			required: false
			default:  "false"
			type:     "bool"
		}
		specific_reservation: {
			description: [
				"Reservation for instances with specific machine shapes.",
			]
			required: true
			type:     "dict"
			suboptions: {
				count: {
					description: [
						"The number of resources that are allocated.",
					]
					required: true
					type:     "int"
				}
				instance_properties: {
					description: [
						"The instance properties for the reservation.",
					]
					required: true
					type:     "dict"
					suboptions: {
						machine_type: {
							description: [
								"The name of the machine type to reserve.",
							]
							required: true
							type:     "str"
						}
						min_cpu_platform: {
							description: [
								"The minimum CPU platform for the reservation. For example, `\"Intel Skylake\"`. See U(https://cloud.google.com/compute/docs/instances/specify-min-cpu-platform#availablezones) for information on available CPU platforms.",
							]

							required: false
							type:     "str"
						}
						guest_accelerators: {
							description: [
								"Guest accelerator type and count.",
							]
							required: false
							type:     "list"
							suboptions: {
								accelerator_type: {
									description: [
										"The full or partial URL of the accelerator type to attach to this instance. For example: `projects/my-project/zones/us-central1-c/acceleratorTypes/nvidia-tesla-p100` If you are creating an instance template, specify only the accelerator name.",
									]

									required: true
									type:     "str"
								}
								accelerator_count: {
									description: [
										"The number of the guest accelerator cards exposed to this instance.",
									]
									required: true
									type:     "int"
								}
							}
						}
						local_ssds: {
							description: [
								"The amount of local ssd to reserve with each instance. This reserves disks of type `local-ssd`.",
							]

							required: false
							type:     "list"
							suboptions: {
								interface: {
									description: [
										"The disk interface to use for attaching this disk, one of `SCSI` or `NVME`. The default is `SCSI`.",
										"Some valid choices include: \"SCSI\", \"NVME\"",
									]
									required: false
									default:  "SCSI"
									type:     "str"
								}
								disk_size_gb: {
									description: [
										"The size of the disk in base-2 GB.",
									]
									required: true
									type:     "int"
								}
							}
						}
					}
				}
			}
		}
		zone: {
			description: [
				"The zone where the reservation is made.",
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
		"API Reference: U(https://cloud.google.com/compute/docs/reference/rest/v1/reservations)",
		"Reserving zonal resources: U(https://cloud.google.com/compute/docs/instances/reserving-zonal-resources)",
		"for authentication, you can set service_account_file using the C(gcp_service_account_file) env variable.",
		"for authentication, you can set service_account_contents using the C(GCP_SERVICE_ACCOUNT_CONTENTS) env variable.",
		"For authentication, you can set service_account_email using the C(GCP_SERVICE_ACCOUNT_EMAIL) env variable.",
		"For authentication, you can set auth_kind using the C(GCP_AUTH_KIND) env variable.",
		"For authentication, you can set scopes using the C(GCP_SCOPES) env variable.",
		"Environment variables values will only be used if the playbook values are not set.",
		"The I(service_account_email) and I(service_account_file) options are mutually exclusive.",
	]
}
