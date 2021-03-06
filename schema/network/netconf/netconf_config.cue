package ansible

module: netconf_config: {
	module:            "netconf_config"
	version_added:     "2.2"
	author:            "Leandro Lisboa Penz (@lpenz)"
	short_description: "netconf device configuration"
	description: [
		"Netconf is a network management protocol developed and standardized by the IETF. It is documented in RFC 6241.",
		"This module allows the user to send a configuration XML file to a netconf device, and detects if there was a configuration change.",
	]

	extends_documentation_fragment: [
		"netconf",
		"network_agnostic",
	]
	options: {
		content: {
			description: [
				"The configuration data as defined by the device's data models, the value can be either in xml string format or text format. The format of the configuration should be supported by remote Netconf server",
			]

			aliases: ["xml"]
		}
		target: {
			description:
				"Name of the configuration datastore to be edited. - auto, uses candidate and fallback to running - candidate, edit <candidate/> datastore and then commit - running, edit <running/> datastore directly"

			default:       "auto"
			version_added: "2.4"
			aliases: ["datastore"]
		}
		source_datastore: {
			description: [
				"Name of the configuration datastore to use as the source to copy the configuration to the datastore mentioned by C(target) option. The values can be either I(running), I(candidate), I(startup) or a remote URL",
			]

			version_added: "2.7"
			aliases: ["source"]
		}
		format: {
			description: [
				"The format of the configuration provided as value of C(content). Accepted values are I(xml) and I(text) and the given configuration format should be supported by remote Netconf server.",
			]

			default: "xml"
			choices: ["xml", "text"]
			version_added: "2.7"
		}
		lock: {
			description: [
				"Instructs the module to explicitly lock the datastore specified as C(target). By setting the option value I(always) is will explicitly lock the datastore mentioned in C(target) option. It the value is I(never) it will not lock the C(target) datastore. The value I(if-supported) lock the C(target) datastore only if it is supported by the remote Netconf server.",
			]

			default: "always"
			choices: ["never", "always", "if-supported"]
			version_added: "2.7"
		}
		default_operation: {
			description: [
				"The default operation for <edit-config> rpc, valid values are I(merge), I(replace) and I(none). If the default value is merge, the configuration data in the C(content) option is merged at the corresponding level in the C(target) datastore. If the value is replace the data in the C(content) option completely replaces the configuration in the C(target) datastore. If the value is none the C(target) datastore is unaffected by the configuration in the config option, unless and until the incoming configuration data uses the C(operation) operation to request a different operation.",
			]

			choices: ["merge", "replace", "none"]
			version_added: "2.7"
		}
		confirm: {
			description: [
				"This argument will configure a timeout value for the commit to be confirmed before it is automatically rolled back. If the C(confirm_commit) argument is set to False, this argument is silently ignored. If the value of this argument is set to 0, the commit is confirmed immediately. The remote host MUST support :candidate and :confirmed-commit capability for this option to .",
			]

			default:       0
			version_added: "2.7"
		}
		confirm_commit: {
			description: [
				"This argument will execute commit operation on remote device. It can be used to confirm a previous commit.",
			]
			type:          "bool"
			default:       "no"
			version_added: "2.7"
		}
		error_option: {
			description: [
				"This option controls the netconf server action after an error occurs while editing the configuration.",
				"If I(error_option=stop-on-error), abort the config edit on first error.",
				"If I(error_option=continue-on-error), continue to process configuration data on error. The error is recorded and negative response is generated if any errors occur.",
				"If I(error_option=rollback-on-error), rollback to the original configuration if any error occurs. This requires the remote Netconf server to support the I(error_option=rollback-on-error) capability.",
			]

			default: "stop-on-error"
			choices: ["stop-on-error", "continue-on-error", "rollback-on-error"]
			version_added: "2.7"
		}
		save: {
			description: [
				"The C(save) argument instructs the module to save the configuration in C(target) datastore to the startup-config if changed and if :startup capability is supported by Netconf server.",
			]

			default:       false
			version_added: "2.4"
			type:          "bool"
		}
		backup: {
			description: [
				"This argument will cause the module to create a full backup of the current C(running-config) from the remote device before any changes are made. If the C(backup_options) value is not given, the backup file is written to the C(backup) folder in the playbook root directory or role root directory, if playbook is part of an ansible role. If the directory does not exist, it is created.",
			]

			type:          "bool"
			default:       "no"
			version_added: "2.7"
		}
		delete: {
			description: [
				"It instructs the module to delete the configuration from value mentioned in C(target) datastore.",
			]
			type:          "bool"
			default:       "no"
			version_added: "2.7"
		}
		commit: {
			description: [
				"This boolean flag controls if the configuration changes should be committed or not after editing the candidate datastore. This option is supported only if remote Netconf server supports :candidate capability. If the value is set to I(False) commit won't be issued after edit-config operation and user needs to handle commit or discard-changes explicitly.",
			]

			type:          "bool"
			default:       true
			version_added: "2.7"
		}
		validate: {
			description: [
				"This boolean flag if set validates the content of datastore given in C(target) option. For this option to work remote Netconf server should support :validate capability.",
			]

			type:          "bool"
			default:       false
			version_added: "2.7"
		}
		src: {
			description: [
				"Specifies the source path to the xml file that contains the configuration or configuration template to load. The path to the source file can either be the full path on the Ansible control host or a relative path from the playbook or role root directory. This argument is mutually exclusive with I(xml).",
			]

			version_added: "2.4"
		}
		backup_options: {
			description: [
				"This is a dict object containing configurable options related to backup file path. The value of this option is read only when C(backup) is set to I(yes), if C(backup) is set to I(no) this option will be silently ignored.",
			]

			suboptions: {
				filename: description: [
					"The filename to be used to store the backup configuration. If the the filename is not given it will be generated based on the hostname, current time and date in format defined by <hostname>_config.<current-date>@<current-time>",
				]

				dir_path: {
					description: [
						"This option provides the path ending with directory name in which the backup configuration file will be stored. If the directory does not exist it will be first created and the filename is either the value of C(filename) or default filename as described in C(filename) options description. If the path value is not given in that case a I(backup) directory will be created in the current working directory and backup configuration will be copied in C(filename) within I(backup) directory.",
					]

					type: "path"
				}
			}
			type:          "dict"
			version_added: "2.8"
		}
		get_filter: {
			description: [
				"This argument specifies the XML string which acts as a filter to restrict the portions of the data retrieved from the remote device when comparing the before and after state of the device following calls to edit_config. When not specified, the entire configuration or state data is returned for comparison depending on the value of C(source) option. The C(get_filter) value can be either XML string or XPath, if the filter is in XPath format the NETCONF server running on remote host should support xpath capability else it will result in an error.",
			]

			version_added: "2.10"
		}
	}
	requirements: [
		"ncclient",
	]
	notes: [
		"This module requires the netconf system service be enabled on the remote device being managed.",
		"This module supports devices with and without the candidate and confirmed-commit capabilities. It will always use the safer feature.",
		"This module supports the use of connection=netconf",
	]
}
