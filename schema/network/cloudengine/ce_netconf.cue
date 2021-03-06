package ansible

module: ce_netconf: {
	module:            "ce_netconf"
	version_added:     "2.4"
	short_description: "Run an arbitrary netconf command on HUAWEI CloudEngine switches."
	description: [
		"Sends an arbitrary netconf command on HUAWEI CloudEngine switches.",
	]
	author: [
		"wangdezhuang (@QijunPan)",
	]
	notes: [
		"This module requires the netconf system service be enabled on the remote device being managed.",
		"Recommended connection is C(netconf).",
		"This module also works with C(local) connections for legacy playbooks.",
	]
	options: {
		rpc: {
			description: [
				"The type of rpc.",
			]
			required: true
			choices: ["get", "edit-config", "execute-action", "execute-cli"]
		}
		cfg_xml: {
			description: [
				"The config xml string.",
			]
			required: true
		}
	}
}
