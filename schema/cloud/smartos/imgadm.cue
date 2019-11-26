package ansible

module: imgadm: {
	module:            "imgadm"
	short_description: "Manage SmartOS images"
	description: [
		"Manage SmartOS virtual machine images through imgadm(1M)",
	]
	version_added: "2.3"
	author:        "Jasper Lievisse Adriaanse (@jasperla)"
	options: {
		force: {
			required: false
			type:     "bool"
			description: [
				"Force a given operation (where supported by imgadm(1M)).",
			]
		}
		pool: {
			required: false
			default:  "zones"
			description: [
				"zpool to import to or delete images from.",
			]
		}
		source: {
			required: false
			description: [
				"URI for the image source.",
			]
		}
		state: {
			required: true
			choices: ["present", "absent", "deleted", "imported", "updated", "vacuumed"]
			description: [
				"State the object operated on should be in. C(imported) is an alias for for C(present) and C(deleted) for C(absent). When set to C(vacuumed) and C(uuid) to C(*), it will remove all unused images.",
			]
		}

		type: {
			required: false
			choices: ["imgapi", "docker", "dsapi"]
			default: "imgapi"
			description: [
				"Type for image sources.",
			]
		}
		uuid: {
			required: false
			description: [
				"Image UUID. Can either be a full UUID or C(*) for all images.",
			]
		}
	}
	requirements: ["python >= 2.6"]
}
