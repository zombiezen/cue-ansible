package ansible

module: junos_lacp: {
	module:            "junos_lacp"
	version_added:     2.9
	short_description: "Manage Global Link Aggregation Control Protocol (LACP) on Juniper Junos devices"
	description:       "This module provides declarative management of global LACP on Juniper Junos network devices."
	author:            "Ganesh Nalawade (@ganeshrn)"
	options: {
		config: {
			description: "A dictionary of LACP global options"
			type:        "dict"
			suboptions: {
				system_priority: {
					description: [
						"LACP priority for the system.",
					]
					type: "int"
				}
				link_protection: {
					description: [
						"Enable LACP link-protection for the system. If the value is set to C(non-revertive) it will not revert links when a better priority link comes up. By default the link will be reverted.",
					]

					type: "str"
					choices: ["revertive", "non-revertive"]
				}
			}
		}
		state: {
			description: [
				"The state of the configuration after module completion",
			]
			type: "str"
			choices: [
				"merged",
				"replaced",
				"deleted",
			]
			default: "merged"
		}
	}
	requirements: [
		"ncclient (>=v0.6.4)",
	]
	notes: [
		"This module requires the netconf system service be enabled on the remote device being managed.",
		"Tested against vSRX JUNOS version 18.1R1.",
		"This module works with connection C(netconf). See L(the Junos OS Platform Options,../network/user_guide/platform_junos.html).",
	]
}
