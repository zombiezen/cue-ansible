package ansible

module: mso_schema_site_bd: {
	module:            "mso_schema_site_bd"
	short_description: "Manage site-local Bridge Domains (BDs) in schema template"
	description: [
		"Manage site-local BDs in schema template on Cisco ACI Multi-Site.",
	]
	author: [
		"Dag Wieers (@dagwieers)",
	]
	version_added: "2.8"
	options: {
		schema: {
			description: [
				"The name of the schema.",
			]
			type:     "str"
			required: true
		}
		site: {
			description: [
				"The name of the site.",
			]
			type:     "str"
			required: true
		}
		template: {
			description: [
				"The name of the template.",
			]
			type:     "str"
			required: true
		}
		bd: {
			description: [
				"The name of the BD to manage.",
			]
			type: "str"
			aliases: ["name"]
		}
		host_route: {
			description: [
				"Whether host-based routing is enabled.",
			]
			type: "bool"
		}
		state: {
			description: [
				"Use C(present) or C(absent) for adding or removing.",
				"Use C(query) for listing an object or multiple objects.",
			]
			type: "str"
			choices: ["absent", "present", "query"]
			default: "present"
		}
	}
	seealso: [{
		module: "mso_schema_site"
	}, {
		module: "mso_schema_site_bd_l3out"
	}, {
		module: "mso_schema_site_bd_subnet"
	}, {
		module: "mso_schema_template_bd"
	}]
	extends_documentation_fragment: "mso"
}
