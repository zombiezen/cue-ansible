package ansible

module: ipa_subca: {
	module:            "ipa_subca"
	author:            "Abhijeet Kasurde (@Akasurde)"
	short_description: "Manage FreeIPA Lightweight Sub Certificate Authorities."
	description: [
		"Add, modify, enable, disable and delete an IPA Lightweight Sub Certificate Authorities using IPA API.",
	]
	version_added: "2.5"
	options: {
		subca_name: {
			description: [
				"The Sub Certificate Authority name which needs to be managed.",
			]
			required: true
			aliases: ["name"]
		}
		subca_subject: {
			description: [
				"The Sub Certificate Authority's Subject. e.g., 'CN=SampleSubCA1,O=testrelm.test'",
			]
			required: true
		}
		subca_desc: {
			description: [
				"The Sub Certificate Authority's description.",
			]
			required: true
		}
		state: {
			description: [
				"State to ensure",
				"State 'disable' and 'enable' is available for FreeIPA 4.4.2 version and onwards",
			]
			required: false
			default:  "present"
			choices: ["present", "absent", "enabled", "disabled"]
		}
	}
	extends_documentation_fragment: "ipa.documentation"
}
