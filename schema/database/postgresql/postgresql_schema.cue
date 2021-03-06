package ansible

module: postgresql_schema: {
	module:            "postgresql_schema"
	short_description: "Add or remove PostgreSQL schema"
	description: [
		"Add or remove PostgreSQL schema.",
	]
	version_added: "2.3"
	options: {
		name: {
			description: [
				"Name of the schema to add or remove.",
			]
			required: true
			type:     "str"
			aliases: [
				"schema",
			]
		}
		database: {
			description: [
				"Name of the database to connect to and add or remove the schema.",
			]
			type:    "str"
			default: "postgres"
			aliases: [
				"db",
				"login_db",
			]
		}
		owner: {
			description: [
				"Name of the role to set as owner of the schema.",
			]
			type: "str"
		}
		session_role: {
			version_added: "2.8"
			description: [
				"Switch to session_role after connecting.",
				"The specified session_role must be a role that the current login_user is a member of.",
				"Permissions checking for SQL commands is carried out as though the session_role were the one that had logged in originally.",
			]

			type: "str"
		}
		state: {
			description: [
				"The schema state.",
			]
			type:    "str"
			default: "present"
			choices: ["absent", "present"]
		}
		cascade_drop: {
			description: [
				"Drop schema with CASCADE to remove child objects.",
			]
			type:          "bool"
			default:       false
			version_added: "2.8"
		}
		ssl_mode: {
			description: [
				"Determines whether or with what priority a secure SSL TCP/IP connection will be negotiated with the server.",
				"See https://www.postgresql.org/docs/current/static/libpq-ssl.html for more information on the modes.",
				"Default of C(prefer) matches libpq default.",
			]
			type:    "str"
			default: "prefer"
			choices: ["allow", "disable", "prefer", "require", "verify-ca", "verify-full"]
			version_added: "2.8"
		}
		ca_cert: {
			description: [
				"Specifies the name of a file containing SSL certificate authority (CA) certificate(s).",
				"If the file exists, the server's certificate will be verified to be signed by one of these authorities.",
			]
			type: "str"
			aliases: ["ssl_rootcert"]
			version_added: "2.8"
		}
	}
	seealso: [{
		name:        "PostgreSQL schemas"
		description: "General information about PostgreSQL schemas."
		link:        "https://www.postgresql.org/docs/current/ddl-schemas.html"
	}, {
		name:        "CREATE SCHEMA reference"
		description: "Complete reference of the CREATE SCHEMA command documentation."
		link:        "https://www.postgresql.org/docs/current/sql-createschema.html"
	}, {
		name:        "ALTER SCHEMA reference"
		description: "Complete reference of the ALTER SCHEMA command documentation."
		link:        "https://www.postgresql.org/docs/current/sql-alterschema.html"
	}, {
		name:        "DROP SCHEMA reference"
		description: "Complete reference of the DROP SCHEMA command documentation."
		link:        "https://www.postgresql.org/docs/current/sql-dropschema.html"
	}]
	author: [
		"Flavien Chantelot (@Dorn-) <contact@flavien.io>",
		"Thomas O'Donnell (@andytom)",
	]
	extends_documentation_fragment: "postgres"
}
