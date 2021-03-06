package ansible

module: idrac_server_config_profile: {
	module:            "idrac_server_config_profile"
	short_description: "Export or Import iDRAC Server Configuration Profile (SCP)."
	version_added:     "2.8"
	description: [
		"Export the Server Configuration Profile (SCP) from the iDRAC or Import from a network share or a local file.",
	]
	options: {
		idrac_ip: {
			description: "iDRAC IP Address."
			type:        "str"
			required:    true
		}
		idrac_user: {
			description: "iDRAC username."
			type:        "str"
			required:    true
		}
		idrac_password: {
			description: "iDRAC user password."
			type:        "str"
			required:    true
			aliases: ["idrac_pwd"]
		}
		idrac_port: {
			description: "iDRAC port."
			type:        "int"
			default:     443
		}
		command: {
			description: [
				"If C(import), will perform SCP import operations.",
				"If C(export), will perform SCP export operations.",
			]
			choices: ["import", "export"]
			default: "export"
		}
		job_wait: {
			description: "Whether to wait for job completion or not."
			type:        "bool"
			required:    true
		}
		share_name: {
			description: "CIFS or NFS Network Share or a local path."
			type:        "str"
			required:    true
		}
		share_user: {
			description: "Network share user in the format 'user@domain' or 'domain\\\\user' if user is part of a domain else 'user'. This option is mandatory for CIFS Network Share."

			type: "str"
		}
		share_password: {
			description: "Network share user password. This option is mandatory for CIFS Network Share."
			type:        "str"
			aliases: ["share_pwd"]
		}
		scp_file: {
			description: "Server Configuration Profile file name. This option is mandatory for C(import) command."
			type:        "str"
		}
		scp_components: {
			description: [
				"If C(ALL), this module will import all components configurations from SCP file.",
				"If C(IDRAC), this module will import iDRAC configuration from SCP file.",
				"If C(BIOS), this module will import BIOS configuration from SCP file.",
				"If C(NIC), this module will import NIC configuration from SCP file.",
				"If C(RAID), this module will import RAID configuration from SCP file.",
			]
			choices: ["ALL", "IDRAC", "BIOS", "NIC", "RAID"]
			default: "ALL"
		}
		shutdown_type: {
			description: [
				"This option is applicable for C(import) command.",
				"If C(Graceful), it gracefully shuts down the server.",
				"If C(Forced),  it forcefully shuts down the server.",
				"If C(NoReboot), it does not reboot the server.",
			]
			choices: ["Graceful", "Forced", "NoReboot"]
			default: "Graceful"
		}
		end_host_power_state: {
			description: [
				"This option is applicable for C(import) command.",
				"If C(On), End host power state is on.",
				"If C(Off), End host power state is off.",
			]
			choices: ["On", "Off"]
			default: "On"
		}
		export_format: {
			description: "Specify the output file format. This option is applicable for C(export) command."
			choices: ["JSON", "XML"]
			default: "XML"
		}
		export_use: {
			description: "Specify the type of server configuration profile (SCP) to be exported. This option is applicable for C(export) command."

			choices: ["Default", "Clone", "Replace"]
			default: "Default"
		}
	}

	requirements: [
		"omsdk",
		"python >= 2.7.5",
	]
	author: "Jagadeesh N V(@jagadeeshnv)"
}
