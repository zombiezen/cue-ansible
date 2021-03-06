package ansible

module: logicmonitor: {
	module:            "logicmonitor"
	short_description: "Manage your LogicMonitor account through Ansible Playbooks"
	description: [
		"LogicMonitor is a hosted, full-stack, infrastructure monitoring platform.",
		"This module manages hosts, host groups, and collectors within your LogicMonitor account.",
	]
	version_added: "2.2"
	author: [
		"Ethan Culler-Mayeno (@ethanculler)",
		"Jeff Wozniak (@woz5999)",
	]
	notes: [
		"You must have an existing LogicMonitor account for this module to function.",
	]
	requirements: ["An existing LogicMonitor account", "Linux"]
	options: {
		target: {
			description: [
				"The type of LogicMonitor object you wish to manage.",
				"Collector: Perform actions on a LogicMonitor collector.",
				"NOTE You should use Ansible service modules such as M(service) or M(supervisorctl) for managing the Collector 'logicmonitor-agent' and 'logicmonitor-watchdog' services. Specifically, you'll probably want to start these services after a Collector add and stop these services before a Collector remove.",
				"Host: Perform actions on a host device.",
				"Hostgroup: Perform actions on a LogicMonitor host group.",
				"""
		NOTE Host and Hostgroup tasks should always be performed via delegate_to: localhost. There are no benefits to running these tasks on the remote host and doing so will typically cause problems.

		""",
			]

			required: true
			choices: ["collector", "host", "datasource", "hostgroup"]
		}
		action: {
			description: [
				"The action you wish to perform on target.",
				"Add: Add an object to your LogicMonitor account.",
				"Remove: Remove an object from your LogicMonitor account.",
				"Update: Update properties, description, or groups (target=host) for an object in your LogicMonitor account.",
				"SDT: Schedule downtime for an object in your LogicMonitor account.",
			]
			required: true
			choices: ["add", "remove", "update", "sdt"]
		}
		company: {
			description: [
				"The LogicMonitor account company name. If you would log in to your account at \"superheroes.logicmonitor.com\" you would use \"superheroes.\"",
			]
			required: true
		}
		user: {
			description: [
				"A LogicMonitor user name. The module will authenticate and perform actions on behalf of this user.",
			]
			required: true
		}
		password: {
			description: [
				"The password of the specified LogicMonitor user",
			]
			required: true
		}
		collector: description: [
			"The fully qualified domain name of a collector in your LogicMonitor account.",
			"This is required for the creation of a LogicMonitor host (target=host action=add).",
			"This is required for updating, removing or scheduling downtime for hosts if 'displayname' isn't specified (target=host action=update action=remove action=sdt).",
		]

		hostname: {
			description: [
				"The hostname of a host in your LogicMonitor account, or the desired hostname of a device to manage.",
				"Optional for managing hosts (target=host).",
			]
			default: "hostname -f"
		}
		displayname: {
			description: [
				"The display name of a host in your LogicMonitor account or the desired display name of a device to manage.",
				"Optional for managing hosts (target=host).",
			]
			default: "hostname -f"
		}
		description: {
			description: [
				"The long text description of the object in your LogicMonitor account.",
				"Optional for managing hosts and host groups (target=host or target=hostgroup; action=add or action=update).",
			]
			default: ""
		}
		properties: {
			description: [
				"A dictionary of properties to set on the LogicMonitor host or host group.",
				"Optional for managing hosts and host groups (target=host or target=hostgroup; action=add or action=update).",
				"This parameter will add or update existing properties in your LogicMonitor account.",
			]
			default: {}
		}
		groups: {
			description: [
				"A list of groups that the host should be a member of.",
				"Optional for managing hosts (target=host; action=add or action=update).",
			]
			default: []
		}
		id: description: [
			"ID of the datasource to target.",
			"Required for management of LogicMonitor datasources (target=datasource).",
		]
		fullpath: description: [
			"The fullpath of the host group object you would like to manage.",
			"Recommend running on a single Ansible host.",
			"Required for management of LogicMonitor host groups (target=hostgroup).",
		]
		alertenable: {
			description: [
				"A boolean flag to turn alerting on or off for an object.",
				"Optional for managing all hosts (action=add or action=update).",
			]
			type:    "bool"
			default: "yes"
		}
		starttime: {
			description: [
				"The time that the Scheduled Down Time (SDT) should begin.",
				"Optional for managing SDT (action=sdt).",
				"Y-m-d H:M",
			]
			default: "Now"
		}
		duration: {
			description: [
				"The duration (minutes) of the Scheduled Down Time (SDT).",
				"Optional for putting an object into SDT (action=sdt).",
			]
			default: 30
		}
	}
}
