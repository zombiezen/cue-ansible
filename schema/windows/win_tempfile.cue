package ansible

module: win_tempfile: {
	module:            "win_tempfile"
	version_added:     "2.3"
	short_description: "Creates temporary files and directories"
	description: [
		"Creates temporary files and directories.",
		"For non-Windows targets, please use the M(tempfile) module instead.",
	]
	options: {
		state: {
			description: [
				"Whether to create file or directory.",
			]
			type: "str"
			choices: ["directory", "file"]
			default: "file"
		}
		path: {
			description: [
				"Location where temporary file or directory should be created.",
				"If path is not specified default system temporary directory (%TEMP%) will be used.",
			]
			type:    "path"
			default: "%TEMP%"
			aliases: ["dest"]
		}
		prefix: {
			description: [
				"Prefix of file/directory name created by module.",
			]
			type:    "str"
			default: "ansible."
		}
		suffix: {
			description: [
				"Suffix of file/directory name created by module.",
			]
			type:    "str"
			default: ""
		}
	}
	seealso: [{
		module: "tempfile"
	}]
	author: ["Dag Wieers (@dagwieers)"]
}
