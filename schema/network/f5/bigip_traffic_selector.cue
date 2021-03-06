package ansible

module: bigip_traffic_selector: {
	module:            "bigip_traffic_selector"
	short_description: "Manage IPSec Traffic Selectors on BIG-IP"
	description: [
		"Manage IPSec Traffic Selectors on BIG-IP.",
	]
	version_added: 2.8
	options: {
		name: {
			description: [
				"Specifies the name of the traffic selector.",
			]
			type:     "str"
			required: true
		}
		destination_address: {
			description: [
				"Specifies the host or network IP address to which the application traffic is destined.",
				"When creating a new traffic selector, this parameter is required.",
			]
			type: "str"
		}
		source_address: {
			description: [
				"Specifies the host or network IP address from which the application traffic originates.",
				"When creating a new traffic selector, this parameter is required.",
			]
			type: "str"
		}
		ipsec_policy: {
			description: [
				"Specifies the IPsec policy that tells the BIG-IP system how to handle the packets.",
				"When creating a new traffic selector, if this parameter is not specified, the default is C(default-ipsec-policy).",
			]

			type: "str"
		}
		order: {
			description: [
				"Specifies the order in which traffic is matched, if traffic can be matched to multiple traffic selectors.",
				"Traffic is matched to the traffic selector with the highest priority (lowest order number).",
				"When creating a new traffic selector, if this parameter is not specified, the default is C(last).",
			]

			type: "int"
		}
		description: {
			description: [
				"Description of the traffic selector.",
			]
			type: "str"
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
				"When C(present), ensures that the resource exists.",
				"When C(absent), ensures the resource is removed.",
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
