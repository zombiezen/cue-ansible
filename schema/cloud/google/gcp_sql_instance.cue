package ansible

module: gcp_sql_instance: {
	module: "gcp_sql_instance"
	description: [
		"Represents a Cloud SQL instance. Cloud SQL instances are SQL databases hosted in Google's cloud. The Instances resource provides methods for common configuration and management tasks.",
	]

	short_description: "Creates a GCP Instance"
	version_added:     "2.7"
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
		backend_type: {
			description: [
				"* FIRST_GEN: First Generation instance. MySQL only.",
				"* SECOND_GEN: Second Generation instance or PostgreSQL instance.",
				"* EXTERNAL: A database server that is not managed by Google.",
				"Some valid choices include: \"FIRST_GEN\", \"SECOND_GEN\", \"EXTERNAL\"",
			]
			required: false
			type:     "str"
		}
		connection_name: {
			description: [
				"Connection name of the Cloud SQL instance used in connection strings.",
			]
			required: false
			type:     "str"
		}
		database_version: {
			description: [
				"The database engine type and version. For First Generation instances, can be MYSQL_5_5, or MYSQL_5_6. For Second Generation instances, can be MYSQL_5_6 or MYSQL_5_7. Defaults to MYSQL_5_6.",
				"PostgreSQL instances: POSTGRES_9_6 The databaseVersion property can not be changed after instance creation.",
				"Some valid choices include: \"MYSQL_5_5\", \"MYSQL_5_6\", \"MYSQL_5_7\", \"POSTGRES_9_6\"",
			]
			required: false
			type:     "str"
		}
		failover_replica: {
			description: [
				"The name and status of the failover replica. This property is applicable only to Second Generation instances.",
			]

			required: false
			type:     "dict"
			suboptions: name: {
				description: [
					"The name of the failover replica. If specified at instance creation, a failover replica is created for the instance. The name doesn't include the project ID. This property is applicable only to Second Generation instances.",
				]

				required: false
				type:     "str"
			}
		}
		instance_type: {
			description: [
				"The instance type. This can be one of the following.",
				"* CLOUD_SQL_INSTANCE: A Cloud SQL instance that is not replicating from a master.",
				"* ON_PREMISES_INSTANCE: An instance running on the customer's premises.",
				"* READ_REPLICA_INSTANCE: A Cloud SQL instance configured as a read-replica.",
				"Some valid choices include: \"CLOUD_SQL_INSTANCE\", \"ON_PREMISES_INSTANCE\", \"READ_REPLICA_INSTANCE\"",
			]
			required: false
			type:     "str"
		}
		ipv6_address: {
			description: [
				"The IPv6 address assigned to the instance. This property is applicable only to First Generation instances.",
			]

			required: false
			type:     "str"
		}
		master_instance_name: {
			description: [
				"The name of the instance which will act as master in the replication setup.",
			]
			required: false
			type:     "str"
		}
		max_disk_size: {
			description: [
				"The maximum disk size of the instance in bytes.",
			]
			required: false
			type:     "int"
		}
		name: {
			description: [
				"Name of the Cloud SQL instance. This does not include the project ID.",
			]
			required: true
			type:     "str"
		}
		region: {
			description: [
				"The geographical region. Defaults to us-central or us-central1 depending on the instance type (First Generation or Second Generation/PostgreSQL).",
			]

			required: false
			type:     "str"
		}
		replica_configuration: {
			description: [
				"Configuration specific to failover replicas and read replicas.",
			]
			required: false
			type:     "dict"
			suboptions: {
				failover_target: {
					description: [
						"Specifies if the replica is the failover target. If the field is set to true the replica will be designated as a failover replica.",
						"In case the master instance fails, the replica instance will be promoted as the new master instance.",
						"Only one replica can be specified as failover target, and the replica has to be in different zone with the master instance.",
					]

					required: false
					type:     "bool"
				}
				mysql_replica_configuration: {
					description: [
						"MySQL specific configuration when replicating from a MySQL on-premises master. Replication configuration information such as the username, password, certificates, and keys are not stored in the instance metadata. The configuration information is used only to set up the replication connection and is stored by MySQL in a file named master.info in the data directory.",
					]

					required: false
					type:     "dict"
					suboptions: {
						ca_certificate: {
							description: [
								"PEM representation of the trusted CA's x509 certificate.",
							]
							required: false
							type:     "str"
						}
						client_certificate: {
							description: [
								"PEM representation of the slave's x509 certificate .",
							]
							required: false
							type:     "str"
						}
						client_key: {
							description: [
								"PEM representation of the slave's private key. The corresponding public key is encoded in the client's certificate.",
							]

							required: false
							type:     "str"
						}
						connect_retry_interval: {
							description: [
								"Seconds to wait between connect retries. MySQL's default is 60 seconds.",
							]
							required: false
							type:     "int"
						}
						dump_file_path: {
							description: [
								"Path to a SQL dump file in Google Cloud Storage from which the slave instance is to be created. The URI is in the form gs://bucketName/fileName. Compressed gzip files (.gz) are also supported. Dumps should have the binlog coordinates from which replication should begin. This can be accomplished by setting --master-data to 1 when using mysqldump.",
							]

							required: false
							type:     "str"
						}
						master_heartbeat_period: {
							description: [
								"Interval in milliseconds between replication heartbeats.",
							]
							required: false
							type:     "int"
						}
						password: {
							description: [
								"The password for the replication connection.",
							]
							required: false
							type:     "str"
						}
						ssl_cipher: {
							description: [
								"A list of permissible ciphers to use for SSL encryption.",
							]
							required: false
							type:     "str"
						}
						username: {
							description: [
								"The username for the replication connection.",
							]
							required: false
							type:     "str"
						}
						verify_server_certificate: {
							description: [
								"Whether or not to check the master's Common Name value in the certificate that it sends during the SSL handshake.",
							]

							required: false
							type:     "bool"
						}
					}
				}
				replica_names: {
					description: [
						"The replicas of the instance.",
					]
					required: false
					type:     "list"
				}
				service_account_email_address: {
					description: [
						"The service account email address assigned to the instance. This property is applicable only to Second Generation instances.",
					]

					required: false
					type:     "str"
				}
			}
		}
		settings: {
			description: [
				"The user settings.",
			]
			required: false
			type:     "dict"
			suboptions: {
				database_flags: {
					description: [
						"The database flags passed to the instance at startup.",
					]
					required:      false
					type:          "list"
					version_added: "2.9"
					suboptions: {
						name: {
							description: [
								"The name of the flag. These flags are passed at instance startup, so include both server options and system variables for MySQL. Flags should be specified with underscores, not hyphens.",
							]

							required: false
							type:     "str"
						}
						value: {
							description: [
								"The value of the flag. Booleans should be set to on for true and off for false. This field must be omitted if the flag doesn't take a value.",
							]

							required: false
							type:     "str"
						}
					}
				}
				ip_configuration: {
					description: [
						"The settings for IP Management. This allows to enable or disable the instance IP and manage which external networks can connect to the instance. The IPv4 address cannot be disabled for Second Generation instances.",
					]

					required: false
					type:     "dict"
					suboptions: {
						ipv4_enabled: {
							description: [
								"Whether the instance should be assigned an IP address or not.",
							]
							required: false
							type:     "bool"
						}
						authorized_networks: {
							description: [
								"The list of external networks that are allowed to connect to the instance using the IP. In CIDR notation, also known as 'slash' notation (e.g. 192.168.100.0/24).",
							]

							required: false
							type:     "list"
							suboptions: {
								expiration_time: {
									description: [
										"The time when this access control entry expires in RFC 3339 format, for example 2012-11-15T16:19:00.094Z.",
									]

									required: false
									type:     "str"
								}
								name: {
									description: [
										"An optional label to identify this entry.",
									]
									required: false
									type:     "str"
								}
								value: {
									description: [
										"The whitelisted value for the access control list. For example, to grant access to a client from an external IP (IPv4 or IPv6) address or subnet, use that address or subnet here.",
									]

									required: false
									type:     "str"
								}
							}
						}
						require_ssl: {
							description: [
								"Whether the mysqld should default to 'REQUIRE X509' for users connecting over IP.",
							]

							required: false
							type:     "bool"
						}
					}
				}
				tier: {
					description: [
						"The tier or machine type for this instance, for example db-n1-standard-1. For MySQL instances, this field determines whether the instance is Second Generation (recommended) or First Generation.",
					]

					required: false
					type:     "str"
				}
				availability_type: {
					description: [
						"The availabilityType define if your postgres instance is run zonal or regional.",
						"Some valid choices include: \"ZONAL\", \"REGIONAL\"",
					]
					required: false
					type:     "str"
				}
				backup_configuration: {
					description: [
						"The daily backup configuration for the instance.",
					]
					required: false
					type:     "dict"
					suboptions: {
						enabled: {
							description: [
								"Enable Autobackup for your instance.",
							]
							required: false
							type:     "bool"
						}
						binary_log_enabled: {
							description: [
								"Whether binary log is enabled. If backup configuration is disabled, binary log must be disabled as well. MySQL only.",
							]

							required: false
							type:     "bool"
						}
						start_time: {
							description: [
								"Define the backup start time in UTC (HH:MM) .",
							]
							required: false
							type:     "str"
						}
					}
				}
			}
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
}
