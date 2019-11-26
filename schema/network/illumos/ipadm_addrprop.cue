package ansible

module: ipadm_addrprop: {
	module:            "ipadm_addrprop"
	short_description: "Manage IP address properties on Solaris/illumos systems."
	description: [
		"Modify IP address properties on Solaris/illumos systems.",
	]
	version_added: "2.3"
	author:        "Adam Števko (@xen0l)"
	options: {
		addrobj: {
			description: ["Specifies the address object we want to manage."]
			required: true
			aliases: ["nic", "interface"]
		}
		property: {
			description: ["Specifies the name of the address property we want to manage."]
			required: true
			aliases: ["name"]
		}
		value: {
			description: ["Specifies the value we want to set for the address property."]
			required: false
		}
		temporary: {
			description: [
				"Specifies that the address property value is temporary. Temporary values do not persist across reboots.",
			]

			required: false
			default:  false
			type:     "bool"
		}
		state: {
			description: ["Set or reset the property value."]
			required: false
			default:  "present"
			choices: ["present", "absent", "reset"]
		}
	}
}
