package ansible

module: panos_lic: {
	module:            "panos_lic"
	short_description: "apply authcode to a device/instance"
	description: [
		"Apply an authcode to a device.",
		"The authcode should have been previously registered on the Palo Alto Networks support portal.",
		"The device should have Internet access.",
	]
	author:        "Luigi Mori (@jtschichold), Ivan Bojer (@ivanbojer)"
	version_added: "2.3"
	requirements: [
		"pan-python",
	]
	deprecated: {
		alternative: "Use U(https://galaxy.ansible.com/PaloAltoNetworks/paloaltonetworks) instead."
		removed_in:  "2.12"
		why:         "Consolidating code base."
	}
	options: {
		auth_code: {
			description: [
				"authcode to be applied",
			]
			required: true
		}
		force: {
			description: [
				"whether to apply authcode even if device is already licensed",
			]
			required: false
			default:  "false"
			type:     "bool"
		}
	}
	extends_documentation_fragment: "panos"
}
