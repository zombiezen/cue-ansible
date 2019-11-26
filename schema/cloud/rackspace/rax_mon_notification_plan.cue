package ansible

module: rax_mon_notification_plan: {
	module:            "rax_mon_notification_plan"
	short_description: "Create or delete a Rackspace Cloud Monitoring notification plan."

	description: [
		"Create or delete a Rackspace Cloud Monitoring notification plan by associating existing rax_mon_notifications with severity levels. Rackspace monitoring module flow | rax_mon_entity -> rax_mon_check -> rax_mon_notification -> *rax_mon_notification_plan* -> rax_mon_alarm",
	]

	version_added: "2.0"
	options: {
		state: {
			description: [
				"Ensure that the notification plan with this C(label) exists or does not exist.",
			]

			choices: ["present", "absent"]
		}
		label: {
			description: [
				"Defines a friendly name for this notification plan. String between 1 and 255 characters long.",
			]

			required: true
		}
		critical_state: description: [
			"Notification list to use when the alarm state is CRITICAL. Must be an array of valid rax_mon_notification ids.",
		]

		warning_state: description: [
			"Notification list to use when the alarm state is WARNING. Must be an array of valid rax_mon_notification ids.",
		]

		ok_state: description: [
			"Notification list to use when the alarm state is OK. Must be an array of valid rax_mon_notification ids.",
		]
	}

	author:                         "Ash Wilson (@smashwilson)"
	extends_documentation_fragment: "rackspace.openstack"
}
