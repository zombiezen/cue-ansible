package ansible

module: bigip_gtm_facts: {
	module:            "bigip_gtm_facts"
	short_description: "Collect facts from F5 BIG-IP GTM devices"
	description: [
		"Collect facts from F5 BIG-IP GTM devices.",
	]
	version_added: 2.3
	options: {
		include: {
			description: [
				"Fact category to collect.",
			]
			required: true
			choices: [
				"pool",
				"wide_ip",
				"server",
			]
		}
		filter: description: [
			"Perform regex filter of response. Filtering is done on the name of the resource. Valid filters are anything that can be provided to Python's C(re) module.",
		]
	}

	deprecated: {
		removed_in:  "2.11"
		alternative: "bigip_device_info"
		why: """
		The bigip_gtm_facts module is an outlier as all facts are being collected in the bigip_device_info module. Additionally, the M(bigip_device_info) module is easier to maintain and use.

		"""
	}

	extends_documentation_fragment: "f5"
	notes: [
		"This module is deprecated. Use the C(bigip_device_info) module instead.",
	]
	author: ["Tim Rupp (@caphrim007)"]
}
