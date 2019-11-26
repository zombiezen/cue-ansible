package ansible

module: panos_dag_tags: {
	module:            "panos_dag_tags"
	short_description: "Create tags for DAG's on PAN-OS devices."
	description: [
		"Create the ip address to tag associations. Tags will in turn be used to create DAG's",
	]
	author:        "Vinay Venkataraghavan (@vinayvenkat)"
	version_added: "2.5"
	requirements: [
		"pan-python can be obtained from PyPI U(https://pypi.org/project/pan-python/)",
		"pandevice can be obtained from PyPI U(https://pypi.org/project/pandevice/)",
	]
	deprecated: {
		alternative: "Use U(https://galaxy.ansible.com/PaloAltoNetworks/paloaltonetworks) instead."
		removed_in:  "2.12"
		why:         "Consolidating code base."
	}
	notes: [
		"Checkmode is not supported.",
		"Panorama is not supported.",
	]
	options: {
		api_key: description: [
			"API key that can be used instead of I(username)/I(password) credentials.",
		]
		description: description: [
			"The purpose / objective of the static Address Group",
		]
		commit: {
			description: [
				"commit if changed",
			]
			default: true
			type:    "bool"
		}
		devicegroup: description: """
		- Device groups are used for the Panorama interaction with Firewall(s). The group must exists on Panorama. If device group is not define we assume that we are contacting Firewall.

		"""

		operation: description: [
			"The action to be taken. Supported values are I(add)/I(update)/I(find)/I(delete).",
		]
		tag_names: description: [
			"The list of the tags that will be added or removed from the IP address.",
		]
		ip_to_register: description: [
			"IP that will be registered with the given tag names.",
		]
	}
	extends_documentation_fragment: "panos"
}
