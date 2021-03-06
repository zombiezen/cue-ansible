package ansible

module: kubevirt_pvc: {
	module: "kubevirt_pvc"

	short_description: "Manage PVCs on Kubernetes"

	version_added: "2.8"

	author: "KubeVirt Team (@kubevirt)"

	description: [
		"Use Openshift Python SDK to manage PVCs on Kubernetes",
		"Support Containerized Data Importer out of the box",
	]

	options: {
		resource_definition: {
			description: [
				"A partial YAML definition of the PVC object being created/updated. Here you can define Kubernetes PVC Resource parameters not covered by this module's parameters.",
				"NOTE: I(resource_definition) has lower priority than module parameters. If you try to define e.g. I(metadata.namespace) here, that value will be ignored and I(namespace) used instead.",
			]

			aliases: [
				"definition",
				"inline",
			]
			type: "dict"
		}
		state: {
			description: [
				"Determines if an object should be created, patched, or deleted. When set to C(present), an object will be created, if it does not already exist. If set to C(absent), an existing object will be deleted. If set to C(present), an existing object will be patched, if its attributes differ from those specified using module options and I(resource_definition).",
			]

			default: "present"
			choices: [
				"present",
				"absent",
			]
		}
		force: {
			description: [
				"If set to C(True), and I(state) is C(present), an existing object will be replaced.",
			]
			default: false
			type:    "bool"
		}
		merge_type: {
			description: [
				"Whether to override the default patch merge approach with a specific type.",
				"This defaults to C(['strategic-merge', 'merge']), which is ideal for using the same parameters on resource kinds that combine Custom Resources and built-in resources.",
				"See U(https://kubernetes.io/docs/tasks/run-application/update-api-object-kubectl-patch/#use-a-json-merge-patch-to-update-a-deployment)",
				"If more than one merge_type is given, the merge_types will be tried in order",
			]
			choices: [
				"json",
				"merge",
				"strategic-merge",
			]
			type: "list"
		}
		name: {
			description: [
				"Use to specify a PVC object name.",
			]
			required: true
			type:     "str"
		}
		namespace: {
			description: [
				"Use to specify a PVC object namespace.",
			]
			required: true
			type:     "str"
		}
		annotations: {
			description: [
				"Annotations attached to this object.",
				"U(https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/)",
			]
			type: "dict"
		}
		labels: {
			description: [
				"Labels attached to this object.",
				"U(https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/)",
			]
			type: "dict"
		}
		selector: {
			description: [
				"A label query over volumes to consider for binding.",
				"U(https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/)",
			]
			type: "dict"
		}
		access_modes: {
			description: [
				"Contains the desired access modes the volume should have.",
				"More info: U(https://kubernetes.io/docs/concepts/storage/persistent-volumes#access-modes)",
			]
			type: "list"
		}
		size: {
			description: [
				"How much storage to allocate to the PVC.",
			]
			type: "str"
			aliases: [
				"storage",
			]
		}
		storage_class_name: {
			description: [
				"Name of the StorageClass required by the claim.",
				"More info: U(https://kubernetes.io/docs/concepts/storage/persistent-volumes#class-1)",
			]
			type: "str"
		}
		volume_mode: {
			description: [
				"This defines what type of volume is required by the claim. Value of Filesystem is implied when not included in claim spec. This is an alpha feature of kubernetes and may change in the future.",
			]

			type: "str"
		}
		volume_name: {
			description: [
				"This is the binding reference to the PersistentVolume backing this claim.",
			]
			type: "str"
		}
		cdi_source: {
			description: [
				"If data is to be copied onto the PVC using the Containerized Data Importer you can specify the source of the data (along with any additional configuration) as well as it's format.",
				"Valid source types are: blank, http, s3, registry, pvc and upload. The last one requires using the M(kubevirt_cdi_upload) module to actually perform an upload.",
				"Source data format is specified using the optional I(content_type). Valid options are C(kubevirt) (default; raw image) and C(archive) (tar.gz).",
				"This uses the DataVolume source syntax: U(https://github.com/kubevirt/containerized-data-importer/blob/master/doc/datavolumes.md#https3registry-source)",
			]

			type: "dict"
		}
		wait: {
			description: [
				"If set, this module will wait for the PVC to become bound and CDI (if enabled) to finish its operation before returning.",
				"Used only if I(state) set to C(present).",
				"Unless used in conjunction with I(cdi_source), this might result in a timeout, as clusters may be configured to not bind PVCs until first usage.",
			]

			default: false
			type:    "bool"
		}
		wait_timeout: {
			description: [
				"Specifies how much time in seconds to wait for PVC creation to complete if I(wait) option is enabled.",
				"Default value is reasonably high due to an expectation that CDI might take a while to finish its operation.",
			]
			type:    "int"
			default: 300
		}
	}

	extends_documentation_fragment: [
		"k8s_auth_options",
	]

	requirements: [
		"python >= 2.7",
		"openshift >= 0.8.2",
	]
}
