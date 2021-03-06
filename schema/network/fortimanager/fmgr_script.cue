package ansible

module: fmgr_script: {
	module:        "fmgr_script"
	version_added: "2.5"
	notes: [
		"Full Documentation at U(https://ftnt-ansible-docs.readthedocs.io/en/latest/).",
	]
	author:            "Andrew Welsh (@Ghilli3)"
	short_description: "Add/Edit/Delete and execute scripts"
	description:       "Create/edit/delete scripts and execute the scripts on the FortiManager using jsonrpc API"

	options: {
		adom: {
			description: [
				"The administrative domain (admon) the configuration belongs to",
			]
			required: true
		}

		vdom: description: [
			"The virtual domain (vdom) the configuration belongs to",
		]

		mode: {
			description: [
				"The desired mode of the specified object. Execute will run the script.",
			]
			required: false
			default:  "add"
			choices: ["add", "delete", "execute", "set"]
			version_added: "2.8"
		}

		script_name: {
			description: [
				"The name of the script.",
			]
			required: true
		}

		script_type: {
			description: [
				"The type of script (CLI or TCL).",
			]
			required: false
		}

		script_target: {
			description: [
				"The target of the script to be run.",
			]
			required: false
		}

		script_description: {
			description: [
				"The description of the script.",
			]
			required: false
		}

		script_content: {
			description: [
				"The script content that will be executed.",
			]
			required: false
		}

		script_scope: {
			description: [
				"(datasource) The devices that the script will run on, can have both device member and device group member.",
			]
			required: false
		}

		script_package: {
			description: [
				"(datasource) Policy package object to run the script against",
			]
			required: false
		}
	}
}
