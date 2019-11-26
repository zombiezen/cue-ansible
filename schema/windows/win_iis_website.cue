package ansible

module: win_iis_website: {
	module:            "win_iis_website"
	version_added:     "2.0"
	short_description: "Configures a IIS Web site"
	description: [
		"Creates, Removes and configures a IIS Web site.",
	]
	options: {
		name: {
			description: [
				"Names of web site.",
			]
			type:     "str"
			required: true
		}
		site_id: {
			description: [
				"Explicitly set the IIS numeric ID for a site.",
				"Note that this value cannot be changed after the website has been created.",
			]
			type:          "str"
			version_added: "2.1"
		}
		state: {
			description: [
				"State of the web site",
			]
			type: "str"
			choices: ["absent", "started", "stopped", "restarted"]
		}
		physical_path: {
			description: [
				"The physical path on the remote host to use for the new site.",
				"The specified folder must already exist.",
			]
			type: "str"
		}
		application_pool: {
			description: [
				"The application pool in which the new site executes.",
			]
			type: "str"
		}
		port: {
			description: [
				"The port to bind to / use for the new site.",
			]
			type: "int"
		}
		ip: {
			description: [
				"The IP address to bind to / use for the new site.",
			]
			type: "str"
		}
		hostname: {
			description: [
				"The host header to bind to / use for the new site.",
			]
			type: "str"
		}
		ssl: {
			description: [
				"Enables HTTPS binding on the site..",
			]
			type: "str"
		}
		parameters: {
			description: [
				"Custom site Parameters from string where properties are separated by a pipe and property name/values by colon Ex. \"foo:1|bar:2\"",
			]
			type: "str"
		}
	}
	seealso: [{
		module: "win_iis_virtualdirectory"
	}, {
		module: "win_iis_webapplication"
	}, {
		module: "win_iis_webapppool"
	}, {
		module: "win_iis_webbinding"
	}]
	author: ["Henrik Wallström (@henrikwallstrom)"]
}
