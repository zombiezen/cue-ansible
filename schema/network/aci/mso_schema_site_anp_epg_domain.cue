package ansible

module: mso_schema_site_anp_epg_domain: {
	module:            "mso_schema_site_anp_epg_domain"
	short_description: "Manage site-local EPG domains in schema template"
	description: [
		"Manage site-local EPG domains in schema template on Cisco ACI Multi-Site.",
	]
	author: [
		"Nirav Katarmal (@nkatarmal-crest)",
	]
	version_added: "2.9"
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
		domain_association_type: {
			description: [
				"The type of domain to associate.",
			]
			type: "str"
			choices: ["vmmDomain", "l3ExtDomain", "l2ExtDomain", "physicalDomain", "fibreChannel"]
		}
		domain_profile: {
			description: [
				"The domain profile name.",
			]
			type: "str"
		}
		deployment_immediacy: {
			description: [
				"The deployment immediacy of the domain.",
				"C(immediate) means B(Deploy immediate).",
				"C(lazy) means B(deploy on demand).",
			]
			type: "str"
			choices: ["immediate", "lazy"]
		}
		resolution_immediacy: {
			description: [
				"Determines when the policies should be resolved and available.",
				"Defaults to C(lazy) when unset during creation.",
			]
			type: "str"
			choices: ["immediate", "lazy", "pre-provision"]
		}
		micro_seg_vlan_type: {
			description: [
				"Virtual LAN type for microsegmentation. This attribute can only be used with vmmDomain domain association.",
			]
			type: "str"
		}
		micro_seg_vlan: {
			description: [
				"Virtual LAN for microsegmentation. This attribute can only be used with vmmDomain domain association.",
			]
			type: "int"
		}
		port_encap_vlan_type: {
			description: [
				"Virtual LAN type for port encap. This attribute can only be used with vmmDomain domain association.",
			]
			type: "str"
		}
		port_encap_vlan: {
			description: [
				"Virtual LAN type for port encap. This attribute can only be used with vmmDomain domain association.",
			]
			type: "int"
		}
		vlan_encap_mode: {
			description: [
				"Which VLAN enacap mode to use. This attribute can only be used with vmmDomain domain association.",
			]
			type: "str"
			choices: ["static", "dynamic"]
		}
		allow_micro_segmentation: {
			description: [
				"Specifies microsegmentation is enabled or not. This attribute can only be used with vmmDomain domain association.",
			]
			type: "bool"
		}
		switch_type: {
			description: [
				"Which switch type to use with this domain association. This attribute can only be used with vmmDomain domain association.",
			]
			type: "str"
		}
		switching_mode: {
			description: [
				"Which switching mode to use with this domain association. This attribute can only be used with vmmDomain domain association.",
			]
			type: "str"
		}
		enhanced_lagpolicy_name: {
			description: [
				"EPG enhanced lagpolicy name. This attribute can only be used with vmmDomain domain association.",
			]
			type: "str"
		}
		enhanced_lagpolicy_dn: {
			description: [
				"Distinguished name of EPG lagpolicy. This attribute can only be used with vmmDomain domain association.",
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
		"The ACI MultiSite PATCH API has a deficiency requiring some objects to be referenced by index. This can cause silent corruption on concurrent access when changing/removing on object as the wrong object may be referenced. This module is affected by this deficiency.",
	]

	seealso: [{
		module: "mso_schema_site_anp_epg"
	}, {
		module: "mso_schema_template_anp_epg"
	}]
	extends_documentation_fragment: "mso"
}
