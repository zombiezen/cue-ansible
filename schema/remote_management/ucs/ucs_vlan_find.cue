package ansible

module: ucs_vlan_find: {
	module:            "ucs_vlan_find"
	short_description: "Find VLANs on Cisco UCS Manager"
	description: [
		"Find VLANs on Cisco UCS Manager based on different criteria.",
	]
	extends_documentation_fragment: "ucs"
	options: {
		pattern: {
			description: [
				"Regex pattern to find within the name property of the fabricVlan class.",
				"This is required if C(vlanid) parameter is not supplied.",
			]
			type: "str"
		}
		fabric: {
			description: [
				"The fabric configuration of the VLAN.  This can be one of the following:",
				"common - The VLAN applies to both fabrics and uses the same configuration parameters in both cases.",
				"A — The VLAN only applies to fabric A.",
				"B — The VLAN only applies to fabric B.",
			]
			choices: ["common", "A", "B"]
			default: "common"
			type:    "str"
		}, vlanid: {

			description: [
				"The unique string identifier assigned to the VLAN.",
				"A VLAN ID can be between '1' and '3967', or between '4048' and '4093'.",
				"This is required if C(pattern) parameter is not supplied.",
			]
			type: "str"
		}
	}, requirements: [
		"ucsmsdk",
	]
	author: [
		"David Martinez (@dx0xm)",
		"CiscoUcs (@CiscoUcs)",
	]
	version_added:
		"2.9"
}
