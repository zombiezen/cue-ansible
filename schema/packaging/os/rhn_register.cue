package ansible

module: rhn_register: {
	module:            "rhn_register"
	short_description: "Manage Red Hat Network registration using the C(rhnreg_ks) command"
	description: [
		"Manage registration to the Red Hat Network.",
	]
	version_added: "1.2"
	author: [
		"James Laska (@jlaska)",
	]
	notes: [
		"This is for older Red Hat products. You probably want the M(redhat_subscription) module instead.",
		"In order to register a system, C(rhnreg_ks) requires either a username and password, or an activationkey.",
	]
	requirements: [
		"rhnreg_ks",
		"either libxml2 or lxml",
	]
	options: {
		state: {
			description: [
				"Whether to register (C(present)), or unregister (C(absent)) a system.",
			]
			type: "str"
			choices: ["absent", "present"]
			default: "present"
		}
		username: {
			description: [
				"Red Hat Network username.",
			]
			type: "str"
		}
		password: {
			description: [
				"Red Hat Network password.",
			]
			type: "str"
		}
		server_url: {
			description: [
				"Specify an alternative Red Hat Network server URL.",
				"The default is the current value of I(serverURL) from C(/etc/sysconfig/rhn/up2date).",
			]
			type: "str"
		}
		activationkey: {
			description: [
				"Supply an activation key for use with registration.",
			]
			type: "str"
		}
		profilename: {
			description: [
				"Supply an profilename for use with registration.",
			]
			type:          "str"
			version_added: "2.0"
		}
		ca_cert: {
			description: [
				"Supply a custom ssl CA certificate file for use with registration.",
			]
			type:          "path"
			version_added: "2.1"
			aliases: ["sslcacert"]
		}
		systemorgid: {
			description: [
				"Supply an organizational id for use with registration.",
			]
			type:          "str"
			version_added: "2.1"
		}
		channels: {
			description: [
				"Optionally specify a list of channels to subscribe to upon successful registration.",
			]
			type: "list"
			default: []
		}
		enable_eus: {
			description: [
				"If C(no), extended update support will be requested.",
			]
			type:    "bool"
			default: false
		}
		nopackages: {
			description: [
				"If C(yes), the registered node will not upload its installed packages information to Satellite server.",
			]
			type:          "bool"
			default:       false
			version_added: "2.5"
		}
	}
}
