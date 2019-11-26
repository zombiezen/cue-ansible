package ansible

module: mso_schema_template: {
	module:            "mso_schema_template"
	short_description: "Manage templates in schemas"
	description: [
		"Manage templates on Cisco ACI Multi-Site.",
	]
	author: [
		"Dag Wieers (@dagwieers)",
	]
	version_added: "2.8"
	options: {
		tenant: {
			description: [
				"The tenant used for this template.",
			]
			type:     "str"
			required: true
		}
		schema: {
			description: [
				"The name of the schema.",
			]
			type:     "str"
			required: true
		}
		template: {
			description: [
				"The name of the template.",
			]
			type: "str"
			aliases: ["name"]
		}
		display_name: {
			description: [
				"The name as displayed on the MSO web interface.",
			]
			type: "str"
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
	notes: [
		"Due to restrictions of the MSO REST API this module creates schemas when needed, and removes them when the last template has been removed.",
	]
	seealso: [{
		module: "mso_schema"
	}, {
		module: "mso_schema_site"
	}]
	extends_documentation_fragment: "mso"
}
