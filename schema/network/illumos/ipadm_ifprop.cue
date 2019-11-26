package ansible

module: ipadm_ifprop: {
	module:            "ipadm_ifprop"
	short_description: "Manage IP interface properties on Solaris/illumos systems."
	description: [
		"Modify IP interface properties on Solaris/illumos systems.",
	]
	version_added: "2.3"
	author:        "Adam Števko (@xen0l)"
	options: {
		interface: {
			description: ["Specifies the IP interface we want to manage."]
			required: true
			aliases: ["nic"]
		}
		protocol: {
			description: ["Specifies the protocol for which we want to manage properties."]
			required: true
		}
		property: {
			description: ["Specifies the name of the property we want to manage."]
			required: true
			aliases: ["name"]
		}
		value: {
			description: ["Specifies the value we want to set for the property."]
			required: false
		}
		temporary: {
			description: [
				"Specifies that the property value is temporary. Temporary property values do not persist across reboots.",
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
