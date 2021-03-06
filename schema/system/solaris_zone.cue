package ansible

module: solaris_zone: {
	module:            "solaris_zone"
	short_description: "Manage Solaris zones"
	description: [
		"Create, start, stop and delete Solaris zones.",
		"This module does not currently allow changing of options for a zone that is already been created.",
	]
	version_added: "2.0"
	author: [
		"Paul Markham (@pmarkham)",
	]
	requirements: [
		"Solaris 10 or 11",
	]
	options: {
		state: {
			description: [
				"C(present), configure and install the zone.",
				"C(installed), synonym for C(present).",
				"C(running), if the zone already exists, boot it, otherwise, configure and install the zone first, then boot it.",
				"C(started), synonym for C(running).",
				"C(stopped), shutdown a zone.",
				"C(absent), destroy the zone.",
				"C(configured), configure the ready so that it's to be attached.",
				"C(attached), attach a zone, but do not boot it.",
				"C(detached), shutdown and detach a zone",
			]
			type: "str"
			choices: ["absent", "attached", "configured", "detached", "installed", "present", "running", "started", "stopped"]
			default:  "present"
			required: true
		}
		name: {
			description: [
				"Zone name.",
			]
			type:     "str"
			required: true
		}
		path: {
			description: [
				"The path where the zone will be created. This is required when the zone is created, but not used otherwise.",
			]

			type: "str"
		}
		sparse: {
			description: [
				"Whether to create a sparse (C(true)) or whole root (C(false)) zone.",
			]
			type:    "bool"
			default: false
		}
		root_password: {
			description: [
				"The password hash for the root account. If not specified, the zone's root account will not have a password.",
			]

			type: "str"
		}
		config: {
			description: [
				"The zonecfg configuration commands for this zone. See zonecfg(1M) for the valid options and syntax. Typically this is a list of options separated by semi-colons or new lines, e.g. \"set auto-boot=true;add net;set physical=bge0;set address=10.1.1.1;end\"",
			]

			type:    "str"
			default: ""
		}
		create_options: {
			description: [
				"Extra options to the zonecfg(1M) create command.",
			]
			type:    "str"
			default: ""
		}
		install_options: {
			description: [
				"Extra options to the zoneadm(1M) install command. To automate Solaris 11 zone creation, use this to specify the profile XML file, e.g. install_options=\"-c sc_profile.xml\"",
			]

			type:    "str"
			default: ""
		}
		attach_options: {
			description: [
				"Extra options to the zoneadm attach command. For example, this can be used to specify whether a minimum or full update of packages is required and if any packages need to be deleted. For valid values, see zoneadm(1M)",
			]

			type:    "str"
			default: ""
		}
		timeout: {
			description: [
				"Timeout, in seconds, for zone to boot.",
			]
			type:    "int"
			default: 600
		}
	}
}
