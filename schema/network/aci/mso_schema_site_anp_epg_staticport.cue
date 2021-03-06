package ansible

module: mso_schema_site_anp_epg_staticport: {
	module:            "mso_schema_site_anp_epg_staticport"
	short_description: "Manage site-local EPG static ports in schema template"
	description: [
		"Manage site-local EPG static ports in schema template on Cisco ACI Multi-Site.",
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
		anp: {
			description: [
				"The name of the ANP.",
			]
			type: "str"
		}
		epg: {
			description: [
				"The name of the EPG.",
			]
			type: "str"
		}
		type: {
			description: [
				"The path type of the static port",
			]
			type: "str"
			choices: ["port", "vpc"]
			default: "port"
		}
		pod: {
			description: [
				"The pod of the static port.",
			]
			type: "str"
		}
		leaf: {
			description: [
				"The leaf of the static port.",
			]
			type: "str"
		}
		path: {
			description: [
				"The path of the static port.",
			]
			type: "str"
		}
		vlan: {
			description: [
				"The port encap VLAN id of the static port.",
			]
			type: "int"
		}
		deployment_immediacy: {
			description: [
				"The deployment immediacy of the static port.",
				"C(immediate) means B(Deploy immediate).",
				"C(lazy) means B(deploy on demand).",
			]
			type: "str"
			choices: ["immediate", "lazy"]
		}
		mode: {
			description: [
				"The mode of the static port.",
				"C(native) means B(Access (802.1p)).",
				"C(regular) means B(Trunk).",
				"C(untagged) means B(Access (untagged)).",
			]
			type: "str"
			choices: ["native", "regular", "untagged"]
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
		"The ACI MultiSite PATCH API has a deficiency requiring some objects to be referenced by index. This can cause silent corruption on concurrent access when changing/removing an object as the wrong object may be referenced. This module is affected by this deficiency.",
	]

	seealso: [{
		module: "mso_schema_site_anp_epg"
	}, {
		module: "mso_schema_template_anp_epg"
	}]
	extends_documentation_fragment: "mso"
}
