package ansible

module: puppet: {
	module:            "puppet"
	short_description: "Runs puppet"
	description: [
		"Runs I(puppet) agent or apply in a reliable manner.",
	]
	version_added: "2.0"
	options: {
		timeout: {
			description: [
				"How long to wait for I(puppet) to finish.",
			]
			type:    "str"
			default: "30m"
		}
		puppetmaster: {
			description: [
				"The hostname of the puppetmaster to contact.",
			]
			type: "str"
		}
		modulepath: {
			description: [
				"Path to an alternate location for puppet modules.",
			]
			type:          "str"
			version_added: "2.4"
		}
		manifest: {
			description: [
				"Path to the manifest file to run puppet apply on.",
			]
			type: "str"
		}
		noop: {
			description: [
				"Override puppet.conf noop mode.",
				"When C(yes), run Puppet agent with C(--noop) switch set.",
				"When C(no), run Puppet agent with C(--no-noop) switch set.",
				"When unset (default), use default or puppet.conf value if defined.",
			]
			type:          "bool"
			version_added: "2.8"
		}
		facts: {
			description: [
				"A dict of values to pass in as persistent external facter facts.",
			]
			type: "dict"
		}
		facter_basename: {
			description: [
				"Basename of the facter output file.",
			]
			type:    "str"
			default: "ansible"
		}
		environment: {
			description: [
				"Puppet environment to be used.",
			]
			type: "str"
		}
		logdest: {
			description: [
				"Where the puppet logs should go, if puppet apply is being used.",
				"C(all) will go to both C(stdout) and C(syslog).",
			]
			type: "str"
			choices: ["all", "stdout", "syslog"]
			default:       "stdout"
			version_added: "2.1"
		}
		certname: {
			description: [
				"The name to use when handling certificates.",
			]
			type:          "str"
			version_added: "2.1"
		}
		tags: {
			description: [
				"A list of puppet tags to be used.",
			]
			type:          "list"
			version_added: "2.1"
		}
		execute: {
			description: [
				"Execute a specific piece of Puppet code.",
				"It has no effect with a puppetmaster.",
			]
			type:          "str"
			version_added: "2.1"
		}
		use_srv_records: {
			description: [
				"Toggles use_srv_records flag",
			]
			type:          "bool"
			version_added: "2.9"
		}
		summarize: {
			description: [
				"Whether to print a transaction summary.",
			]
			type:          "bool"
			version_added: "2.7"
		}
		verbose: {
			description: [
				"Print extra information.",
			]
			type:          "bool"
			version_added: "2.7"
		}
		debug: {
			description: [
				"Enable full debugging.",
			]
			type:          "bool"
			version_added: "2.7"
		}
	}
	requirements: [
		"puppet",
	]
	author: ["Monty Taylor (@emonty)"]
}
