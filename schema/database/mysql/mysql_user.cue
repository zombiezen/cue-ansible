package ansible

module: mysql_user: {
	module:            "mysql_user"
	short_description: "Adds or removes a user from a MySQL database"
	description: [
		"Adds or removes a user from a MySQL database.",
	]
	version_added: "0.6"
	options: {
		name: {
			description: [
				"Name of the user (role) to add or remove.",
			]
			type:     "str"
			required: true
		}
		password: {
			description: [
				"Set the user's password..",
			]
			type: "str"
		}
		encrypted: {
			description: [
				"Indicate that the 'password' field is a `mysql_native_password` hash.",
			]
			type:          "bool"
			default:       false
			version_added: "2.0"
		}
		host: {
			description: [
				"The 'host' part of the MySQL username.",
			]
			type:    "str"
			default: "localhost"
		}
		host_all: {
			description: [
				"Override the host option, making ansible apply changes to all hostnames for a given user.",
				"This option cannot be used when creating users.",
			]
			type:          "bool"
			default:       false
			version_added: "2.1"
		}
		priv: {
			description: [
				"MySQL privileges string in the format: C(db.table:priv1,priv2).",
				"Multiple privileges can be specified by separating each one using a forward slash: C(db.table:priv/db.table:priv).",
				"The format is based on MySQL C(GRANT) statement.",
				"Database and table names can be quoted, MySQL-style.",
				"If column privileges are used, the C(priv1,priv2) part must be exactly as returned by a C(SHOW GRANT) statement. If not followed, the module will always report changes. It includes grouping columns by permission (C(SELECT(col1,col2)) instead of C(SELECT(col1),SELECT(col2))).",
			]

			type: "str"
		}
		append_privs: {
			description: [
				"Append the privileges defined by priv to the existing ones for this user instead of overwriting existing ones.",
			]

			type:          "bool"
			default:       false
			version_added: "1.4"
		}
		sql_log_bin: {
			description: [
				"Whether binary logging should be enabled or disabled for the connection.",
			]
			type:          "bool"
			default:       true
			version_added: "2.1"
		}
		state: {
			description: [
				"Whether the user should exist.",
				"When C(absent), removes the user.",
			]
			type: "str"
			choices: ["absent", "present"]
			default: "present"
		}
		check_implicit_admin: {
			description: [
				"Check if mysql allows login as root/nopassword before trying supplied credentials.",
			]
			type:          "bool"
			default:       false
			version_added: "1.3"
		}
		update_password: {
			description: [
				"C(always) will update passwords if they differ.",
				"C(on_create) will only set the password for newly created users.",
			]
			type: "str"
			choices: ["always", "on_create"]
			default:       "always"
			version_added: "2.0"
		}
	}
	notes: [
		"MySQL server installs with default login_user of 'root' and no password. To secure this user as part of an idempotent playbook, you must create at least two tasks: the first must change the root user's password, without providing any login_user/login_password details. The second must drop a ~/.my.cnf file containing the new root credentials. Subsequent runs of the playbook will then succeed by reading the new credentials from the file.",
		"Currently, there is only support for the `mysql_native_password` encrypted password hash module.",
	]

	seealso: [{
		module: "mysql_info"
	}, {
		name:        "MySQL access control and account management reference"
		description: "Complete reference of the MySQL access control and account management documentation."
		link:        "https://dev.mysql.com/doc/refman/8.0/en/access-control.html"
	}]

	author: [
		"Jonathan Mainguy (@Jmainguy)",
		"Benjamin Malynovytch (@bmalynovytch)",
	]
	extends_documentation_fragment: "mysql"
}
