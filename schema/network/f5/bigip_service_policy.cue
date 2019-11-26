package ansible

module: bigip_service_policy: {
	module:            "bigip_service_policy"
	short_description: "Manages service policies on a BIG-IP."
	description: [
		"Service policies allow you to configure timers and port misuse rules, if enabled, on a per rule or per context basis.",
	]

	version_added: 2.6
	options: {
		name: {
			description: [
				"Name of the service policy.",
			]
			required: true
			type:     "str"
		}
		description: {
			description: [
				"Description of the service policy.",
			]
			type: "str"
		}
		timer_policy: {
			description: [
				"The timer policy to attach to the service policy.",
			]
			type: "str"
		}
		port_misuse_policy: {
			description: [
				"The port misuse policy to attach to the service policy.",
				"Requires that C(afm) be provisioned to use. If C(afm) is not provisioned, this parameter will be ignored.",
			]

			type: "str"
		}
		state: {
			description: [
				"Whether the resource should exist or not.",
			]
			type: "str"
			choices: [
				"present",
				"absent",
			]
			default: "present"
		}
		partition: {
			description: [
				"Device partition to manage resources on.",
			]
			type:    "str"
			default: "Common"
		}
	}
	extends_documentation_fragment: "f5"
	author: [
		"Tim Rupp (@caphrim007)",
		"Wojciech Wypior (@wojtek0806)",
	]
}
