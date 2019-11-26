package ansible

module: postgresql_query: {
	module:            "postgresql_query"
	short_description: "Run PostgreSQL queries"
	description: [
		"Runs arbitrary PostgreSQL queries.",
		"Can run queries from SQL script files.",
		"Does not run against backup files. Use M(postgresql_db) with I(state=restore) to run queries on files made by pg_dump/pg_dumpall utilities.",
	]

	version_added: "2.8"
	options: {
		query: {
			description: [
				"SQL query to run. Variables can be escaped with psycopg2 syntax U(http://initd.org/psycopg/docs/usage.html).",
			]
			type: "str"
		}
		positional_args: {
			description: [
				"List of values to be passed as positional arguments to the query. When the value is a list, it will be converted to PostgreSQL array.",
				"Mutually exclusive with I(named_args).",
			]
			type: "list"
		}
		named_args: {
			description: [
				"Dictionary of key-value arguments to pass to the query. When the value is a list, it will be converted to PostgreSQL array.",
				"Mutually exclusive with I(positional_args).",
			]
			type: "dict"
		}
		path_to_script: {
			description: [
				"Path to SQL script on the remote host.",
				"Returns result of the last query in the script.",
				"Mutually exclusive with I(query).",
			]
			type: "path"
		}
		session_role: {
			description: [
				"Switch to session_role after connecting. The specified session_role must be a role that the current login_user is a member of.",
				"Permissions checking for SQL commands is carried out as though the session_role were the one that had logged in originally.",
			]

			type: "str"
		}
		db: {
			description: [
				"Name of database to connect to and run queries against.",
			]
			type: "str"
			aliases: [
				"login_db",
			]
		}
		autocommit: {
			description: [
				"Execute in autocommit mode when the query can't be run inside a transaction block (e.g., VACUUM).",
				"Mutually exclusive with I(check_mode).",
			]
			type:          "bool"
			default:       false
			version_added: "2.9"
		}
	}
	seealso: [{
		module: "postgresql_db"
	}]
	author: [
		"Felix Archambault (@archf)",
		"Andrew Klychkov (@Andersson007)",
		"Will Rouesnel (@wrouesnel)",
	]
	extends_documentation_fragment: "postgres"
}
