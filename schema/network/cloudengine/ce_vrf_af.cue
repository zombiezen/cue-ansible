package ansible

module: ce_vrf_af: {
	module:            "ce_vrf_af"
	version_added:     "2.4"
	short_description: "Manages VPN instance address family on HUAWEI CloudEngine switches."
	description: [
		"Manages VPN instance address family of HUAWEI CloudEngine switches.",
	]
	author: "Yang yang (@QijunPan)"
	notes: [
		"If I(state=absent), the vrf will be removed, regardless of the non-required parameters.",
		"This module requires the netconf system service be enabled on the remote device being managed.",
		"Recommended connection is C(netconf).",
		"This module also works with C(local) connections for legacy playbooks.",
	]
	options: {
		vrf: {
			description: [
				"VPN instance.",
			]
			required: true
		}
		vrf_aftype: {
			description: [
				"VPN instance address family.",
			]
			choices: ["v4", "v6"]
			default: "v4"
		}
		route_distinguisher: description: [
			"VPN instance route distinguisher,the RD used to distinguish same route prefix from different vpn. The RD must be setted before setting vpn_target_value.",
		]

		vpn_target_state: {
			description: [
				"Manage the state of the vpn target.",
			]
			choices: ["present", "absent"]
		}
		vpn_target_type: {
			description: [
				"VPN instance vpn target type.",
			]
			choices: ["export_extcommunity", "import_extcommunity"]
		}
		vpn_target_value: description: [
			"VPN instance target value. Such as X.X.X.X:number<0-65535> or number<0-65535>:number<0-4294967295> or number<0-65535>.number<0-65535>:number<0-65535> or number<65536-4294967295>:number<0-65535> but not support 0:0 and 0.0:0.",
		]

		evpn: {
			description: [
				"Is extend vpn or normal vpn.",
			]
			type:    "bool"
			default: "no"
		}
		state: {
			description: [
				"Manage the state of the af.",
			]
			choices: ["present", "absent"]
			default: "present"
		}
	}
}
