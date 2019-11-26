package ansible

module: nxos_snmp_community: {
	module:                         "nxos_snmp_community"
	extends_documentation_fragment: "nxos"
	version_added:                  "2.2"
	short_description:              "Manages SNMP community configs."
	description: [
		"Manages SNMP community configuration.",
	]
	author: [
		"Jason Edelman (@jedelman8)",
		"Gabriele Gerbino (@GGabriele)",
	]
	notes: [
		"Tested against NXOSv 7.3.(0)D1(1) on VIRL",
	]
	options: {
		community: {
			description: [
				"Case-sensitive community string.",
			]
			required: true
		}
		access: {
			description: [
				"Access type for community.",
			]
			choices: ["ro", "rw"]
		}
		group: description: [
			"Group to which the community belongs.",
		]
		acl: description: [
			"ACL name to filter snmp requests or keyword 'default'.",
		]
		state: {
			description: [
				"Manage the state of the resource.",
			]
			default: "present"
			choices: ["present", "absent"]
		}
	}
}
