package ansible

module: win_shell: {
	module:            "win_shell"
	short_description: "Execute shell commands on target hosts"
	version_added:     2.2
	description: [
		"The C(win_shell) module takes the command name followed by a list of space-delimited arguments. It is similar to the M(win_command) module, but runs the command via a shell (defaults to PowerShell) on the target host.",
		"For non-Windows targets, use the M(shell) module instead.",
	]
	options: {
		free_form: {
			description: [
				"The C(win_shell) module takes a free form command to run.",
				"There is no parameter actually named 'free form'. See the examples!",
			]
			type:     "str"
			required: true
		}
		creates: {
			description: [
				"A path or path filter pattern; when the referenced path exists on the target host, the task will be skipped.",
			]
			type: "path"
		}
		removes: {
			description: [
				"A path or path filter pattern; when the referenced path B(does not) exist on the target host, the task will be skipped.",
			]
			type: "path"
		}
		chdir: {
			description: [
				"Set the specified path as the current working directory before executing a command",
			]
			type: "path"
		}
		executable: {
			description: [
				"Change the shell used to execute the command (eg, C(cmd)).",
				"The target shell must accept a C(/c) parameter followed by the raw command line to be executed.",
			]
			type: "path"
		}
		stdin: {
			description: [
				"Set the stdin of the command directly to the specified value.",
			]
			type:          "str"
			version_added: "2.5"
		}
		no_profile: {
			description: [
				"Do not load the user profile before running a command. This is only valid when using PowerShell as the executable.",
			]

			type:          "bool"
			default:       false
			version_added: "2.8"
		}
		output_encoding_override: {
			description: [
				"This option overrides the encoding of stdout/stderr output.",
				"You can use this option when you need to run a command which ignore the console's codepage.",
				"You should only need to use this option in very rare circumstances.",
				"This value can be any valid encoding C(Name) based on the output of C([System.Text.Encoding]::GetEncodings()). See U(https://docs.microsoft.com/dotnet/api/system.text.encoding.getencodings).",
			]

			type:          "str"
			version_added: "2.10"
		}
	}
	notes: [
		"If you want to run an executable securely and predictably, it may be better to use the M(win_command) module instead. Best practices when writing playbooks will follow the trend of using M(win_command) unless C(win_shell) is explicitly required. When running ad-hoc commands, use your best judgement.",
		"WinRM will not return from a command execution until all child processes created have exited. Thus, it is not possible to use C(win_shell) to spawn long-running child or background processes. Consider creating a Windows service for managing background processes.",
	]

	seealso: [{
		module: "psexec"
	}, {
		module: "raw"
	}, {
		module: "script"
	}, {
		module: "shell"
	}, {
		module: "win_command"
	}, {
		module: "win_psexec"
	}]
	author: ["Matt Davis (@nitzmahone)"]
}
