package ansible

module: ftd_file_download: {
	module:            "ftd_file_download"
	short_description: "Downloads files from Cisco FTD devices over HTTP(S)"
	description: [
		"Downloads files from Cisco FTD devices including pending changes, disk files, certificates, troubleshoot reports, and backups.",
	]

	version_added: "2.7"
	author:        "Cisco Systems, Inc. (@annikulin)"
	options: {
		operation: {
			description: [
				"The name of the operation to execute.",
				"Only operations that return a file can be used in this module.",
			]
			required: true
			type:     "str"
		}
		path_params: {
			description: [
				"Key-value pairs that should be sent as path parameters in a REST API call.",
			]
			type: "dict"
		}
		destination: {
			description: [
				"Absolute path of where to download the file to.",
				"If destination is a directory, the module uses a filename from 'Content-Disposition' header specified by the server.",
			]

			required: true
			type:     "path"
		}
	}
}
