package ansible

module: runit: {
	module: "runit"
	author: [
		"James Sumners (@jsumners)",
	]
	version_added:     "2.3"
	short_description: "Manage runit services"
	description: [
		"Controls runit services on remote hosts using the sv utility.",
	]
	options: {
		name: {
			description: [
				"Name of the service to manage.",
			]
			type:     "str"
			required: true
		}
		state: {
			description: [
				"C(started)/C(stopped) are idempotent actions that will not run commands unless necessary.  C(restarted) will always bounce the service (sv restart) and C(killed) will always bounce the service (sv force-stop). C(reloaded) will send a HUP (sv reload). C(once) will run a normally downed sv once (sv once), not really an idempotent operation.",
			]

			type: "str"
			choices: ["killed", "once", "reloaded", "restarted", "started", "stopped"]
		}
		enabled: {
			description: [
				"Whether the service is enabled or not, if disabled it also implies stopped.",
			]
			type: "bool"
		}
		service_dir: {
			description: [
				"directory runsv watches for services",
			]
			type:    "str"
			default: "/var/service"
		}
		service_src: {
			description: [
				"directory where services are defined, the source of symlinks to service_dir.",
			]
			type:    "str"
			default: "/etc/sv"
		}
	}
}
