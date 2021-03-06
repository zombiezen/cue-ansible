package ansible

module: rhsm_release: {
	module:            "rhsm_release"
	short_description: "Set or Unset RHSM Release version"
	version_added:     "2.8"
	description: [
		"Sets or unsets the release version used by RHSM repositories.",
	]
	notes: [
		"This module will fail on an unregistered system. Use the C(redhat_subscription) module to register a system prior to setting the RHSM release.",
	]

	requirements: [
		"Red Hat Enterprise Linux 6+ with subscription-manager installed",
	]
	options: release: {
		description: [
			"RHSM release version to use (use null to unset)",
		]
		required: true
	}
	author: ["Sean Myers (@seandst)"]
}
