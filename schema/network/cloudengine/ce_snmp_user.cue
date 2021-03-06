package ansible

module: ce_snmp_user: {
	module:            "ce_snmp_user"
	version_added:     "2.4"
	short_description: "Manages SNMP user configuration on HUAWEI CloudEngine switches."
	description: [
		"Manages SNMP user configurations on CloudEngine switches.",
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
		acl_number: description: [
			"Access control list number.",
		]
		usm_user_name: description: [
			"Unique name to identify the USM user.",
		]
		aaa_local_user: description: [
			"Unique name to identify the local user.",
		]
		remote_engine_id: description: [
			"Remote engine id of the USM user.",
		]
		user_group: description: [
			"Name of the group where user belongs to.",
		]
		auth_protocol: {
			description: [
				"Authentication protocol.",
			]
			choices: ["noAuth", "md5", "sha"]
		}
		auth_key: description: [
			"The authentication password. Password length, 8-255 characters.",
		]
		priv_protocol: {
			description: [
				"Encryption protocol.",
			]
			choices: ["noPriv", "des56", "3des168", "aes128", "aes192", "aes256"]
		}
		priv_key: description: ["The encryption password. Password length 8-255 characters."]
	}
}
