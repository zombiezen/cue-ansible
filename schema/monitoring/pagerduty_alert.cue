package ansible

module: pagerduty_alert: {
	module:            "pagerduty_alert"
	short_description: "Trigger, acknowledge or resolve PagerDuty incidents"
	description: [
		"This module will let you trigger, acknowledge or resolve a PagerDuty incident by sending events",
	]
	version_added: "1.9"
	author: [
		"Amanpreet Singh (@ApsOps)",
	]
	requirements: [
		"PagerDuty API access",
	]
	options: {
		name: description: [
			"PagerDuty unique subdomain. Obsolete. It is not used with PagerDuty REST v2 API.",
		]
		service_id: {
			description: [
				"ID of PagerDuty service when incidents will be triggered, acknowledged or resolved.",
			]
			required:      true
			version_added: "2.7"
		}
		service_key: description: [
			"The GUID of one of your \"Generic API\" services. Obsolete. Please use I(integration_key).",
		]
		integration_key: {
			description: [
				"The GUID of one of your \"Generic API\" services.",
				"This is the \"integration key\" listed on a \"Integrations\" tab of PagerDuty service.",
			]
			required:      true
			version_added: "2.7"
		}
		state: {
			description: [
				"Type of event to be sent.",
			]
			required: true
			choices: [
				"triggered",
				"acknowledged",
				"resolved",
			]
		}
		api_key: {
			description: [
				"The pagerduty API key (readonly access), generated on the pagerduty site.",
			]
			required: true
		}
		desc: {
			description: [
				"For C(triggered) I(state) - Required. Short description of the problem that led to this trigger. This field (or a truncated version) will be used when generating phone calls, SMS messages and alert emails. It will also appear on the incidents tables in the PagerDuty UI. The maximum length is 1024 characters.",
				"For C(acknowledged) or C(resolved) I(state) - Text that will appear in the incident's log associated with this event.",
			]
			required: false
			default:  "Created via Ansible"
		}
		incident_key: {
			description: [
				"Identifies the incident to which this I(state) should be applied.",
				"For C(triggered) I(state) - If there's no open (i.e. unresolved) incident with this key, a new one will be created. If there's already an open incident with a matching key, this event will be appended to that incident's log. The event key provides an easy way to \"de-dup\" problem reports.",
				"For C(acknowledged) or C(resolved) I(state) - This should be the incident_key you received back when the incident was first opened by a trigger event. Acknowledge events referencing resolved or nonexistent incidents will be discarded.",
			]

			required:      false
			version_added: "2.7"
		}
		client: {
			description: [
				"The name of the monitoring client that is triggering this event.",
			]
			required: false
		}
		client_url: {
			description: [
				"The URL of the monitoring client that is triggering this event.",
			]
			required: false
		}
	}
}
