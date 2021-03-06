package ansible

module: bigip_monitor_external: {
	module:            "bigip_monitor_external"
	short_description: "Manages external LTM monitors on a BIG-IP"
	description: [
		"Manages external LTM monitors on a BIG-IP.",
	]
	version_added: 2.6
	options: {
		name: {
			description: [
				"Specifies the name of the monitor.",
			]
			type:     "str"
			required: true
		}
		description: {
			description: [
				"The description of the monitor.",
			]
			type:          "str"
			version_added: 2.7
		}
		parent: {
			description: [
				"The parent template of this monitor template. Once this value has been set, it cannot be changed. By default, this value is the C(http) parent on the C(Common) partition.",
			]

			type:    "str"
			default: "/Common/external"
		}
		arguments: {
			description: [
				"Specifies any command-line arguments that the script requires.",
			]
			type: "str"
		}
		ip: {
			description: [
				"IP address part of the IP/port definition. If this parameter is not provided when creating a new monitor, then the default value will be '*'.",
			]

			type: "str"
		}
		port: {
			description: [
				"Port address part of the IP/port definition. If this parameter is not provided when creating a new monitor, then the default value will be '*'. Note that if specifying an IP address, a value between 1 and 65535 must be specified.",
			]

			type: "str"
		}
		external_program: {
			description: [
				"Specifies the name of the file for the monitor to use. In order to reference a file, you must first import it using options on the System > File Management > External Monitor Program File List > Import screen. The BIG-IP system automatically places the file in the proper location on the file system.",
			]

			type: "str"
		}
		interval: {
			description: [
				"The interval specifying how frequently the monitor instance of this template will run. If this parameter is not provided when creating a new monitor, then the default value will be 5. This value B(must) be less than the C(timeout) value.",
			]

			type: "int"
		}
		timeout: {
			description: [
				"The number of seconds in which the node or service must respond to the monitor request.",
				"If the target responds within the set time period, it is considered up.",
				"If the target does not respond within the set time period, it is considered down.",
				"You can change this number to any number you want, however, it should be 3 times the interval number of seconds plus 1 second.",
				"If this parameter is not provided when creating a new monitor, then the default value will be C(16).",
			]

			type: "int"
		}
		variables: {
			description: [
				"Specifies any variables that the script requires.",
				"Note that double quotes in values will be suppressed.",
			]
			type: "dict"
		}
		partition: {
			description: [
				"Device partition to manage resources on.",
			]
			type:    "str"
			default: "Common"
		}
		state: {
			description: [
				"When C(present), ensures that the monitor exists.",
				"When C(absent), ensures the monitor is removed.",
			]
			type: "str"
			choices: [
				"present",
				"absent",
			]
			default: "present"
		}
	}
	extends_documentation_fragment: "f5"
	author: [
		"Tim Rupp (@caphrim007)",
		"Wojciech Wypior (@wojtek0806)",
	]
}
