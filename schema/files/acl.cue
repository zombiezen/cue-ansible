package ansible

module: acl: {
	module:            "acl"
	version_added:     "1.4"
	short_description: "Set and retrieve file ACL information."
	description: [
		"Set and retrieve file ACL information.",
	]
	options: {
		path: {
			description: [
				"The full path of the file or object.",
			]
			type:     "path"
			required: true
			aliases: ["name"]
		}
		state: {
			description: [
				"Define whether the ACL should be present or not.",
				"The C(query) state gets the current ACL without changing it, for use in C(register) operations.",
			]
			choices: ["absent", "present", "query"]
			default: "query"
		}
		follow: {
			description: [
				"Whether to follow symlinks on the path if a symlink is encountered.",
			]
			type:    "bool"
			default: true
		}
		default: {
			description: [
				"If the target is a directory, setting this to C(yes) will make it the default ACL for entities created inside the directory.",
				"Setting C(default) to C(yes) causes an error if the path is a file.",
			]
			type:          "bool"
			default:       false
			version_added: "1.5"
		}
		entity: {
			description: [
				"The actual user or group that the ACL applies to when matching entity types user or group are selected.",
			]
			version_added: "1.5"
		}
		etype: {
			description: [
				"The entity type of the ACL to apply, see C(setfacl) documentation for more info.",
			]
			choices: ["group", "mask", "other", "user"]
			version_added: "1.5"
		}
		permissions: {
			description: [
				"The permissions to apply/remove can be any combination of C(r), C(w) and C(x) (read, write and execute respectively)",
			]
			version_added: "1.5"
		}
		entry: description: [
			"DEPRECATED.",
			"The ACL to set or remove.",
			"This must always be quoted in the form of C(<etype>:<qualifier>:<perms>).",
			"The qualifier may be empty for some types, but the type and perms are always required.",
			"C(-) can be used as placeholder when you do not care about permissions.",
			"This is now superseded by entity, type and permissions fields.",
		]
		recursive: {
			description: [
				"Recursively sets the specified ACL.",
				"Incompatible with C(state=query).",
			]
			type:          "bool"
			default:       false
			version_added: "2.0"
		}
		use_nfsv4_acls: {
			description: [
				"Use NFSv4 ACLs instead of POSIX ACLs.",
			]
			type:          "bool"
			default:       false
			version_added: "2.2"
		}
		recalculate_mask: {
			description: [
				"Select if and when to recalculate the effective right masks of the files.",
				"See C(setfacl) documentation for more info.",
				"Incompatible with C(state=query).",
			]
			choices: ["default", "mask", "no_mask"]
			default:       "default"
			version_added: "2.7"
		}
	}
	author: [
		"Brian Coca (@bcoca)",
		"Jérémie Astori (@astorije)",
	], notes: [
		"The C(acl) module requires that ACLs are enabled on the target filesystem and that the C(setfacl) and C(getfacl) binaries are installed.",
		"As of Ansible 2.0, this module only supports Linux distributions.",
		"As of Ansible 2.3, the I(name) option has been changed to I(path) as default, but I(name) still works as well.",
	]
}
