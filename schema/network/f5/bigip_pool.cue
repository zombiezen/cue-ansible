package ansible

module: bigip_pool: {
	module:            "bigip_pool"
	short_description: "Manages F5 BIG-IP LTM pools"
	description: [
		"Manages F5 BIG-IP LTM pools via iControl REST API.",
	]
	version_added: 1.2
	options: {
		description: {
			description: [
				"Specifies descriptive text that identifies the pool.",
			]
			type:          "str"
			version_added: 2.3
		}
		name: {
			description: [
				"Pool name",
			]
			type:     "str"
			required: true
			aliases: [
				"pool",
			]
		}
		lb_method: {
			description: [
				"Load balancing method. When creating a new pool, if this value is not specified, the default of C(round-robin) will be used.",
			]

			type:          "str"
			version_added: 1.3
			choices: [
				"dynamic-ratio-member",
				"dynamic-ratio-node",
				"fastest-app-response",
				"fastest-node",
				"least-connections-member",
				"least-connections-node",
				"least-sessions",
				"observed-member",
				"observed-node",
				"predictive-member",
				"predictive-node",
				"ratio-least-connections-member",
				"ratio-least-connections-node",
				"ratio-member",
				"ratio-node",
				"ratio-session",
				"round-robin",
				"weighted-least-connections-member",
				"weighted-least-connections-node",
			]
		}
		monitor_type: {
			description: [
				"Monitor rule type when C(monitors) is specified.",
				"When creating a new pool, if this value is not specified, the default of 'and_list' will be used.",
				"When C(single) ensures that all specified monitors are checked, but additionally includes checks to make sure you only specified a single monitor.",
				"When C(and_list) ensures that B(all) monitors are checked.",
				"When C(m_of_n) ensures that C(quorum) of C(monitors) are checked. C(m_of_n) B(requires) that a C(quorum) of 1 or greater be set either in the playbook, or already existing on the device.",
				"Both C(single) and C(and_list) are functionally identical since BIG-IP considers all monitors as \"a list\".",
			]

			type: "str"
			choices: [
				"and_list",
				"m_of_n",
				"single",
			]
			version_added: 1.3
		}
		quorum: {
			description: [
				"Monitor quorum value when C(monitor_type) is C(m_of_n).",
				"Quorum must be a value of 1 or greater when C(monitor_type) is C(m_of_n).",
			]
			type:          "int"
			version_added: 1.3
		}
		monitors: {
			description: [
				"Monitor template name list. If the partition is not provided as part of the monitor name, then the C(partition) option will be used instead.",
			]

			type:          "list"
			version_added: 1.3
		}
		slow_ramp_time: {
			description: [
				"Sets the ramp-up time (in seconds) to gradually ramp up the load on newly added or freshly detected up pool members.",
			]

			type:          "int"
			version_added: 1.3
		}
		reselect_tries: {
			description: [
				"Sets the number of times the system tries to contact a pool member after a passive failure.",
			]

			type:          "int"
			version_added: 2.2
		}
		service_down_action: {
			description: [
				"Sets the action to take when node goes down in pool.",
			]
			type: "str"
			choices: [
				"none",
				"reset",
				"drop",
				"reselect",
			]
			version_added: 1.3
		}
		partition: {
			description: [
				"Device partition to manage resources on.",
			]
			type:          "str"
			default:       "Common"
			version_added: 2.5
		}
		state: {
			description: [
				"When C(present), guarantees that the pool exists with the provided attributes.",
				"When C(absent), removes the pool from the system.",
			]
			type: "str"
			choices: [
				"absent",
				"present",
			]
			default:       "present"
			version_added: 2.5
		}
		metadata: {
			description: [
				"Arbitrary key/value pairs that you can attach to a pool. This is useful in situations where you might want to annotate a pool to me managed by Ansible.",
				"Key names will be stored as strings; this includes names that are numbers.",
				"Values for all of the keys will be stored as strings; this includes values that are numbers.",
				"Data will be persisted, not ephemeral.",
			]
			type:          "raw"
			version_added: 2.5
		}
		priority_group_activation: {
			description: [
				"Specifies whether the system load balances traffic according to the priority number assigned to the pool member.",
				"When creating a new pool, if this parameter is not specified, the default of C(0) will be used.",
				"To disable this setting, provide the value C(0).",
				"Once you enable this setting, you can specify pool member priority when you create a new pool or on a pool member's properties screen.",
				"The system treats same-priority pool members as a group.",
				"To enable priority group activation, provide a number from C(0) to C(65535) that represents the minimum number of members that must be available in one priority group before the system directs traffic to members in a lower priority group.",
				"When a sufficient number of members become available in the higher priority group, the system again directs traffic to the higher priority group.",
			]

			type: "int"
			aliases: [
				"minimum_active_members",
			]
			version_added: 2.6
		}
		aggregate: {
			description: [
				"List of pool definitions to be created, modified or removed.",
				"When using C(aggregates) if one of the aggregate definitions is invalid, the aggregate run will fail, indicating the error it last encountered.",
				"The module will C(NOT) rollback any changes it has made prior to encountering the error.",
				"The module also will not indicate what changes were made prior to failure, therefore it is strongly advised to run the module in check mode to make basic validation, prior to module execution.",
			]

			type: "list"
			aliases: [
				"pools",
			]
			version_added: 2.8
		}
		replace_all_with: {
			description: [
				"Remove pools not defined in the C(aggregate) parameter.",
				"This operation is all or none, meaning that it will stop if there are some pools that cannot be removed.",
			]

			type:    "bool"
			default: false
			aliases: [
				"purge",
			]
			version_added: 2.8
		}
	}
	notes: [
		"To add members to a pool, use the C(bigip_pool_member) module. Previously, the C(bigip_pool) module allowed the management of members, but this has been removed in version 2.5 of Ansible.",
	]

	extends_documentation_fragment: "f5"
	author: [
		"Tim Rupp (@caphrim007)",
		"Wojciech Wypior (@wojtek0806)",
	]
}
