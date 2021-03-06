package ansible

module: bigip_apm_policy_import: {
	module:            "bigip_apm_policy_import"
	short_description: "Manage BIG-IP APM policy or APM access profile imports"
	description: [
		"Manage BIG-IP APM policy or APM access profile imports.",
	]
	version_added: 2.8
	options: {
		name: {
			description: [
				"The name of the APM policy or APM access profile to create or override.",
			]
			type:     "str"
			required: true
		}
		type: {
			description: [
				"Specifies the type of item to export from device.",
			]
			type: "str"
			choices: [
				"profile_access",
				"access_policy",
			]
			default: "profile_access"
		}
		source: {
			description: [
				"Full path to a file to be imported into the BIG-IP APM.",
			]
			type: "path"
		}
		force: {
			description: [
				"When set to C(yes) any existing policy with the same name will be overwritten by the new import.",
				"If policy does not exist this setting is ignored.",
			]
			default: false
			type:    "bool"
		}
		partition: {
			description: [
				"Device partition to manage resources on.",
			]
			type:    "str"
			default: "Common"
		}
	}
	notes: [
		"Due to ID685681 it is not possible to execute ng_* tools via REST api on v12.x and 13.x, once this is fixed this restriction will be removed.",
		"Requires BIG-IP >= 14.0.0",
	]
	extends_documentation_fragment: "f5"
	author: ["Wojciech Wypior (@wojtek0806)"]
}
