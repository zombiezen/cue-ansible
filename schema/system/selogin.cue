package ansible

module: selogin: {
	module:            "selogin"
	short_description: "Manages linux user to SELinux user mapping"
	description: [
		"Manages linux user to SELinux user mapping",
	]
	version_added: "2.8"
	options: {
		login: {
			description: [
				"a Linux user",
			]
			required: true
		}
		seuser: {
			description: [
				"SELinux user name",
			]
			required: true
		}
		selevel: {
			aliases: ["serange"]
			description: [
				"MLS/MCS Security Range (MLS/MCS Systems only) SELinux Range for SELinux login mapping defaults to the SELinux user record range.",
			]
			default: "s0"
		}
		state: {
			description: [
				"Desired mapping value.",
			]
			required: true
			default:  "present"
			choices: ["present", "absent"]
		}
		reload: {
			description: [
				"Reload SELinux policy after commit.",
			]
			default: true
		}
		ignore_selinux_state: {
			description: [
				"Run independent of selinux runtime state",
			]
			type:    "bool"
			default: false
		}
	}
	notes: [
		"The changes are persistent across reboots",
		"Not tested on any debian based system",
	]
	requirements: ["libselinux", "policycoreutils"]
	author: [
		"Dan Keder (@dankeder)",
		"Petr Lautrbach (@bachradsusi)",
		"James Cassell (@jamescassell)",
	]
}
