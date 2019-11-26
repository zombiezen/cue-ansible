package ansible

module: cnos_showrun: {
	module:            "cnos_showrun"
	author:            "Anil Kumar Muraleedharan (@amuraleedhar)"
	short_description: "Collect the current running configuration on devices running on CNOS"
	description: [
		"This module allows you to view the switch running configuration. It executes the display running-config CLI command on a switch and returns a file containing the current running configuration of the target network device. This module uses SSH to manage network device configuration. The results of the operation will be placed in a directory named 'results' that must be created by the user in their local directory to where the playbook is run.",
	]

	version_added:                  "2.3"
	extends_documentation_fragment: "cnos"
	options: {}
}
