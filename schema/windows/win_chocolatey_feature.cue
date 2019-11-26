package ansible

module: win_chocolatey_feature: {
	module:            "win_chocolatey_feature"
	version_added:     "2.7"
	short_description: "Manages Chocolatey features"
	description: [
		"Used to enable or disable features in Chocolatey.",
	]
	options: {
		name: {
			description: [
				"The name of the feature to manage.",
				"Run C(choco.exe feature list) to get a list of features that can be managed.",
			]

			type:     "str"
			required: true
		}
		state: {
			description: [
				"When C(disabled) then the feature will be disabled.",
				"When C(enabled) then the feature will be enabled.",
			]
			type: "str"
			choices: ["disabled", "enabled"]
			default: "enabled"
		}
	}
	seealso: [{
		module: "win_chocolatey"
	}, {
		module: "win_chocolatey_config"
	}, {
		module: "win_chocolatey_facts"
	}, {
		module: "win_chocolatey_source"
	}]
	author: ["Jordan Borean (@jborean93)"]
}
