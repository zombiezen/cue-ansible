package ansible

module: nxos_logging: {
	module:            "nxos_logging"
	version_added:     "2.4"
	author:            "Trishna Guha (@trishnaguha)"
	short_description: "Manage logging on network devices"
	description: [
		"This module provides declarative management of logging on Cisco NX-OS devices.",
	]

	options: {
		dest: {
			description: [
				"Destination of the logs.",
			]
			choices: ["console", "logfile", "module", "monitor", "server"]
		}
		remote_server: {
			description: [
				"Hostname or IP Address for remote logging (when dest is 'server').",
			]
			version_added: "2.7"
		}
		use_vrf: {
			description: [
				"VRF to be used while configuring remote logging (when dest is 'server').",
			]
			version_added: "2.7"
		}
		interface: {
			description: [
				"Interface to be used while configuring source-interface for logging (e.g., 'Ethernet1/2', 'mgmt0')",
			]
			version_added: "2.7"
		}
		name: description: [
			"If value of C(dest) is I(logfile) it indicates file-name.",
		]
		facility: description: [
			"Facility name for logging.",
		]
		dest_level: {
			description: [
				"Set logging severity levels.",
			]
			aliases: ["level"]
		}
		facility_level: description: [
			"Set logging severity levels for facility based log messages.",
		]
		aggregate: description: "List of logging definitions."
		state: {
			description: [
				"State of the logging configuration.",
			]
			default: "present"
			choices: ["present", "absent"]
		}
		event: {
			description: [
				"Link/trunk enable/default interface configuration logging",
			]
			choices: ["link-enable", "link-default", "trunk-enable", "trunk-default"]
			version_added: "2.8"
		}
		interface_message: {
			description: [
				"Add interface description to interface syslogs. Does not work with version 6.0 images using nxapi as a transport.",
			]

			choices: ["add-interface-description"]
			version_added: "2.8"
		}
		file_size: {
			description: [
				"Set logfile size",
			]
			version_added: "2.8"
		}
		facility_link_status: {
			description: [
				"Set logging facility ethpm link status. Not idempotent with version 6.0 images.",
			]

			choices: ["link-down-notif", "link-down-error", "link-up-notif", "link-up-error"]
			version_added: "2.8"
		}
		timestamp: {
			description: [
				"Set logging timestamp format",
			]
			choices: ["microseconds", "milliseconds", "seconds"]
			version_added: "2.8"
		}
		purge: {
			description: [
				"Remove any switch logging configuration that does not match what has been configured Not supported for ansible_connection local. All nxos_logging tasks must use the same ansible_connection type.",
			]

			type:          "bool"
			default:       false
			version_added: "2.8"
		}
	}
	extends_documentation_fragment: "nxos"
}
