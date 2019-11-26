package ansible

module: cpm_serial_port_info: {
	module:            "cpm_serial_port_info"
	version_added:     "2.9"
	author:            "Western Telematic Inc. (@wtinetworkgear)"
	short_description: "Get Serial port parameters in WTI OOB and PDU devices"
	description: [
		"Get Serial port parameters from WTI OOB and PDU devices",
	]
	options: {
		cpm_url: {
			description: [
				"This is the URL of the WTI device to send the module.",
			]
			required: true
		}
		cpm_username: {
			description: [
				"This is the Username of the WTI device to send the module.",
			]
			required: true
		}
		cpm_password: {
			description: [
				"This is the Password of the WTI device to send the module.",
			]
			required: true
		}
		use_https: {
			description: [
				"Designates to use an https connection or http connection.",
			]
			required: false
			type:     "bool"
			default:  true
		}
		validate_certs: {
			description: [
				"If false, SSL certificates will not be validated. This should only be used",
				"on personally controlled sites using self-signed certificates.",
			]
			required: false
			type:     "bool"
			default:  true
		}
		use_proxy: {
			description: "Flag to control if the lookup will observe HTTP proxy environment variables when present."
			required:    false
			type:        "bool"
			default:     false
		}
		port: {
			description: [
				"This is the serial port number that is getting retrieved. It can include a single port number, multiple port numbers separated by commas, a list of port numbers, or an '*' character for all ports.",
			]

			required: true
			type:     "list"
			default: ["*"]
		}
	}
	notes: ["Use C(groups/cpm) in C(module_defaults) to set common options used between CPM modules.)"]
}
