package ansible

module: digital_ocean_sshkey_facts: {
	module: "digital_ocean_sshkey_facts"
	deprecated: {
		removed_in:  "2.13"
		why:         "Deprecated in favour of C(_info) module."
		alternative: "Use M(digital_ocean_sshkey_info) instead."
	}
	short_description: "DigitalOcean SSH keys facts"
	description: [
		"Fetch DigitalOcean SSH keys facts.",
	]
	version_added:                  "2.5"
	author:                         "Patrick Marques (@pmarques)"
	extends_documentation_fragment: "digital_ocean.documentation"
	notes: [
		"Version 2 of DigitalOcean API is used.",
	]
	requirements: ["python >= 2.6"]
}
