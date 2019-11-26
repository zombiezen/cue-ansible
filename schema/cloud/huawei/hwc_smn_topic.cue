package ansible

module: hwc_smn_topic: {
	module: "hwc_smn_topic"
	description: [
		"Represents a SMN notification topic resource.",
	]
	short_description: "Creates a resource of SMNTopic in Huaweicloud Cloud"
	version_added:     "2.8"
	author:            "Huawei Inc. (@huaweicloud)"
	requirements: [
		"requests >= 2.18.4",
		"keystoneauth1 >= 3.6.0",
	]
	options: {
		state: {
			description: [
				"Whether the given object should exist in Huaweicloud Cloud.",
			]
			type: "str"
			choices: ["present", "absent"]
			default: "present"
		}
		display_name: {
			description: [
				"Topic display name, which is presented as the name of the email sender in an email message. The topic display name contains a maximum of 192 bytes.",
			]

			type:     "str"
			required: false
		}
		name: {
			description: [
				"Name of the topic to be created. The topic name is a string of 1 to 256 characters. It must contain upper- or lower-case letters, digits, hyphens (-), and underscores C(_), and must start with a letter or digit.",
			]

			type:     "str"
			required: true
		}
	}
	extends_documentation_fragment: "hwc"
}
