package ansible

module: scaleway_organization_info: {
	module:            "scaleway_organization_info"
	short_description: "Gather information about the Scaleway organizations available."
	description: [
		"Gather information about the Scaleway organizations available.",
	]
	version_added: "2.9"
	author: [
		"Yanis Guenane (@Spredzy)",
		"Remy Leone (@sieben)",
	]
	options: api_url: {
		description: [
			"Scaleway API URL",
		]
		default: "https://account.scaleway.com"
		aliases: ["base_url"]
	}
	extends_documentation_fragment: "scaleway"
}
