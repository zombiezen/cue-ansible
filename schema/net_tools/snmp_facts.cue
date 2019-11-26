package ansible

module: snmp_facts: {
	module:        "snmp_facts"
	version_added: "1.9"
	author: [
		"Patrick Ogenstad (@ogenstad)",
	]
	short_description: "Retrieve facts for a device using SNMP"
	description: [
		"Retrieve facts for a device using SNMP, the facts will be inserted to the ansible_facts key.",
	]

	requirements: [
		"pysnmp",
	]
	options: {
		host: {
			description: [
				"Set to target snmp server (normally C({{ inventory_hostname }})).",
			]
			type:     "str"
			required: true
		}
		version: {
			description: [
				"SNMP Version to use, v2/v2c or v3.",
			]
			type:     "str"
			required: true
			choices: ["v2", "v2c", "v3"]
		}
		community: {
			description: [
				"The SNMP community string, required if version is v2/v2c.",
			]
			type: "str"
		}
		level: {
			description: [
				"Authentication level.",
				"Required if version is v3.",
			]
			type: "str"
			choices: ["authNoPriv", "authPriv"]
		}
		username: {
			description: [
				"Username for SNMPv3.",
				"Required if version is v3.",
			]
			type: "str"
		}
		integrity: {
			description: [
				"Hashing algorithm.",
				"Required if version is v3.",
			]
			type: "str"
			choices: ["md5", "sha"]
		}
		authkey: {
			description: [
				"Authentication key.",
				"Required if version is v3.",
			]
			type: "str"
		}
		privacy: {
			description: [
				"Encryption algorithm.",
				"Required if level is authPriv.",
			]
			type: "str"
			choices: ["aes", "des"]
		}
		privkey: {
			description: [
				"Encryption key.",
				"Required if version is authPriv.",
			]
			type: "str"
		}
	}
}
