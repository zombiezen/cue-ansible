package ansible

module: gce_mig: {
	module:            "gce_mig"
	version_added:     "2.2"
	short_description: "Create, Update or Destroy a Managed Instance Group (MIG)."
	description: [
		"Create, Update or Destroy a Managed Instance Group (MIG).  See U(https://cloud.google.com/compute/docs/instance-groups) for an overview. Full install/configuration instructions for the gce* modules can be found in the comments of ansible/test/gce_tests.py.",
	]

	requirements: [
		"python >= 2.6",
		"apache-libcloud >= 1.2.0",
	]
	notes: [
		"Resizing and Recreating VM are also supported.",
		"An existing instance template is required in order to create a Managed Instance Group.",
	]

	author: [
		"Tom Melendez (@supertom) <tom@supertom.com>",
	]
	options: {
		name: {
			description: [
				"Name of the Managed Instance Group.",
			]
			required: true
		}
		template: description: [
			"Instance Template to be used in creating the VMs.  See U(https://cloud.google.com/compute/docs/instance-templates) to learn more about Instance Templates.  Required for creating MIGs.",
		]

		size: description: [
			"Size of Managed Instance Group.  If MIG already exists, it will be resized to the number provided here.  Required for creating MIGs.",
		]

		service_account_email: description: [
			"service account email",
		]
		credentials_file: description: [
			"Path to the JSON file associated with the service account email",
		]
		project_id: description: [
			"GCE project ID",
		]
		state: {
			description: [
				"desired state of the resource",
			]
			default: "present"
			choices: ["absent", "present"]
		}
		zone: {
			description: [
				"The GCE zone to use for this Managed Instance Group.",
			]
			required: true
		}
		autoscaling: description: [
			"A dictionary of configuration for the autoscaler. 'enabled (bool)', 'name (str)' and policy.max_instances (int) are required fields if autoscaling is used. See U(https://cloud.google.com/compute/docs/reference/beta/autoscalers) for more information on Autoscaling.",
		]

		named_ports: {
			version_added: "2.3"
			description: [
				"Define named ports that backend services can forward data to.  Format is a a list of name:port dictionaries.",
			]
		}
	}
}
