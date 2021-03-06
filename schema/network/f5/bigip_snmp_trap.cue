package ansible

module: bigip_snmp_trap: {
	module:            "bigip_snmp_trap"
	short_description: "Manipulate SNMP trap information on a BIG-IP"
	description: [
		"Manipulate SNMP trap information on a BIG-IP.",
	]
	version_added: 2.4
	options: {
		name: {
			description: [
				"Name of the SNMP configuration endpoint.",
			]
			type:     "str"
			required: true
		}
		snmp_version: {
			description: [
				"Specifies to which Simple Network Management Protocol (SNMP) version the trap destination applies.",
			]

			type: "str"
			choices: [
				"1",
				"2c",
			]
		}
		community: {
			description: [
				"Specifies the community name for the trap destination.",
			]
			type: "str"
		}
		destination: {
			description: [
				"Specifies the address for the trap destination. This can be either an IP address or a hostname.",
			]

			type: "str"
		}
		port: {
			description: [
				"Specifies the port for the trap destination.",
			]
			type: "str"
		}
		network: {
			description: [
				"Specifies the name of the trap network. This option is not supported in versions of BIG-IP < 12.1.0. If used on versions < 12.1.0, it will simply be ignored.",
				"The value C(default) was removed in BIG-IP version 13.1.0. Specifying this value when configuring a BIG-IP will cause the module to stop and report an error. The usual remedy is to choose one of the other options, such as C(management).",
			]

			type: "str"
			choices: [
				"other",
				"management",
				"default",
			]
		}
		state: {
			description: [
				"When C(present), ensures that the resource exists.",
				"When C(absent), ensures that the resource does not exist.",
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
			type:          "str"
			default:       "Common"
			version_added: 2.5
		}
	}
	notes: [
		"This module only supports version v1 and v2c of SNMP.",
		"The C(network) option is not supported on versions of BIG-IP < 12.1.0 because the platform did not support that option until 12.1.0. If used on versions < 12.1.0, it will simply be ignored.",
	]

	extends_documentation_fragment: "f5"
	author: [
		"Tim Rupp (@caphrim007)",
		"Wojciech Wypior (@wojtek0806)",
	]
}
