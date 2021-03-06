package ansible

module: win_pester: {
	module:            "win_pester"
	short_description: "Run Pester tests on Windows hosts"
	version_added:     "2.6"
	description: [
		"Run Pester tests on Windows hosts.",
		"Test files have to be available on the remote host.",
	]
	requirements: [
		"Pester",
	]
	options: {
		path: {
			description: [
				"Path to a pester test file or a folder where tests can be found.",
				"If the path is a folder, the module will consider all ps1 files as Pester tests.",
			]
			type:     "str"
			required: true
		}
		tags: {
			description: [
				"Runs only tests in Describe blocks with specified Tags values.",
				"Accepts multiple comma separated tags.",
			]
			type:          "list"
			version_added: "2.9"
		}
		output_file: {
			description: [
				"Generates an output test report.",
			]
			type:          "str"
			version_added: "2.10"
		}
		output_format: {
			description: [
				"Format of the test report to be generated.",
				"This parameter is to be used with output_file option.",
			]
			type:          "str"
			default:       "NunitXML"
			version_added: "2.10"
		}
		test_parameters: {
			description: [
				"Allows to specify parameters to the test script.",
			]
			type:          "dict"
			version_added: "2.9"
		}
		version: {
			description: [
				"Minimum version of the pester module that has to be available on the remote host.",
			]
			type: "str"
			aliases: [
				"minimum_version",
			]
		}
	}
	author: [
		"Erwan Quelin (@equelin)",
		"Prasoon Karunan V (@prasoonkarunan)",
	]
}
