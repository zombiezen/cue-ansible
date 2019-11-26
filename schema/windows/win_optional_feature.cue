package ansible

module: win_optional_feature: {
	module:            "win_optional_feature"
	version_added:     "2.8"
	short_description: "Manage optional Windows features"
	description: [
		"Install or uninstall optional Windows features on non-Server Windows.",
		"This module uses the C(Enable-WindowsOptionalFeature) and C(Disable-WindowsOptionalFeature) cmdlets.",
	]
	options: {
		name: {
			description: [
				"The name(s) of the feature to install.",
				"This relates to C(FeatureName) in the Powershell cmdlet.",
				"To list all available features use the PowerShell command C(Get-WindowsOptionalFeature).",
			]
			type:     "list"
			required: true
		}
		state: {
			description: [
				"Whether to ensure the feature is absent or present on the system.",
			]
			type: "str"
			choices: ["absent", "present"]
			default: "present"
		}
		include_parent: {
			description: [
				"Whether to enable the parent feature and the parent's dependencies.",
			]
			type:    "bool"
			default: false
		}
		source: {
			description: [
				"Specify a source to install the feature from.",
				"Can either be C({driveletter}:\\sources\\sxs) or C(\\\\{IP}\\share\\sources\\sxs).",
			]
			type: "str"
		}
	}
	seealso: [{
		module: "win_chocolatey"
	}, {
		module: "win_feature"
	}, {
		module: "win_package"
	}]
	author: ["Carson Anderson (@rcanderson23)"]
}
