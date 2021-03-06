package ansible

module: pn_admin_service: {
	module:            "pn_admin_service"
	author:            "Pluribus Networks (@rajaspachipulusu17)"
	version_added:     "2.8"
	short_description: "CLI command to modify admin-service"
	description: [
		"This module is used to modify services on the server-switch.",
	]
	options: {
		pn_cliswitch: {
			description: [
				"Target switch to run the CLI on.",
			]
			required: false
			type:     "str"
		}
		state: {
			description: [
				"State the action to perform. Use C(update) to modify the admin-service.",
			]
			required: true
			type:     "str"
			choices: ["update"]
		}
		pn_web: {
			description: [
				"Web (HTTP) to enable or disable.",
			]
			required: false
			type:     "bool"
		}
		pn_web_ssl: {
			description: [
				"Web SSL (HTTPS) to enable or disable.",
			]
			required: false
			type:     "bool"
		}
		pn_snmp: {
			description: [
				"Simple Network Monitoring Protocol (SNMP) to enable or disable.",
			]
			required: false
			type:     "bool"
		}
		pn_web_port: {
			description: [
				"Web (HTTP) port to enable or disable.",
			]
			required: false
			type:     "str"
		}
		pn_web_ssl_port: {
			description: [
				"Web SSL (HTTPS) port to enable or disable.",
			]
			required: false
			type:     "str"
		}
		pn_nfs: {
			description: [
				"Network File System (NFS) to enable or disable.",
			]
			required: false
			type:     "bool"
		}
		pn_ssh: {
			description: [
				"Secure Shell to enable or disable.",
			]
			required: false
			type:     "bool"
		}
		pn_web_log: {
			description: [
				"Web logging to enable or disable.",
			]
			required: false
			type:     "bool"
		}
		pn__if: {
			description: [
				"administrative service interface.",
			]
			required: false
			type:     "str"
			choices: ["mgmt", "data"]
		}
		pn_icmp: {
			description: [
				"Internet Message Control Protocol (ICMP) to enable or disable.",
			]
			required: false
			type:     "bool"
		}
		pn_net_api: {
			description: [
				"Netvisor API to enable or disable APIs.",
			]
			required: false
			type:     "bool"
		}
	}
}
