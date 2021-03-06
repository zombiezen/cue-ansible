package ansible

module: avi_actiongroupconfig: {
	module: "avi_actiongroupconfig"
	author: "Gaurav Rastogi (@grastogi23) <grastogi@avinetworks.com>"

	short_description: "Module for setup of ActionGroupConfig Avi RESTful Object"
	description: [
		"This module is used to configure ActionGroupConfig object",
		"more examples at U(https://github.com/avinetworks/devops)",
	]
	requirements: ["avisdk"]
	version_added: "2.4"
	options: {
		state: {
			description: [
				"The state that should be applied on the entity.",
			]
			default: "present"
			choices: ["absent", "present"]
		}
		avi_api_update_method: {
			description: [
				"Default method for object update is HTTP PUT.",
				"Setting to patch will override that behavior to use HTTP PATCH.",
			]
			version_added: "2.5"
			default:       "put"
			choices: ["put", "patch"]
		}
		avi_api_patch_op: {
			description: [
				"Patch operation to use when using avi_api_update_method as patch.",
			]
			version_added: "2.5"
			choices: ["add", "replace", "delete"]
		}
		action_script_config_ref: description: [
			"Reference of the action script configuration to be used.",
			"It is a reference to an object of type alertscriptconfig.",
		]
		autoscale_trigger_notification: {
			description: [
				"Trigger notification to autoscale manager.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			type: "bool"
		}
		description: description: [
			"User defined description for the object.",
		]
		email_config_ref: description: [
			"Select the email notification configuration to use when sending alerts via email.",
			"It is a reference to an object of type alertemailconfig.",
		]
		external_only: {
			description: [
				"Generate alert only to external destinations.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			required: true
			type:     "bool"
		}
		level: {
			description: [
				"When an alert is generated, mark its priority via the alert level.",
				"Enum options - ALERT_LOW, ALERT_MEDIUM, ALERT_HIGH.",
				"Default value when not specified in API or module is interpreted by Avi Controller as ALERT_LOW.",
			]
			required: true
		}
		name: {
			description: [
				"Name of the object.",
			]
			required: true
		}
		snmp_trap_profile_ref: description: [
			"Select the snmp trap notification to use when sending alerts via snmp trap.",
			"It is a reference to an object of type snmptrapprofile.",
		]
		syslog_config_ref: description: [
			"Select the syslog notification configuration to use when sending alerts via syslog.",
			"It is a reference to an object of type alertsyslogconfig.",
		]
		tenant_ref: description: [
			"It is a reference to an object of type tenant.",
		]
		url: description: [
			"Avi controller URL of the object.",
		]
		uuid: description: [
			"Unique object identifier of the object.",
		]
	}
	extends_documentation_fragment: ["avi"]
}
