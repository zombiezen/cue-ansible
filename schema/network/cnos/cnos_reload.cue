package ansible

module: cnos_reload: {
	module:            "cnos_reload"
	author:            "Anil Kumar Muraleedharan (@amuraleedhar)"
	short_description: "Perform switch restart on devices running Lenovo CNOS"
	description: [
		"This module allows you to restart the switch using the current startup configuration. The module is usually invoked after the running configuration has been saved over the startup configuration. This module uses SSH to manage network device configuration. The results of the operation can be viewed in results directory.",
	]

	version_added:                  "2.3"
	extends_documentation_fragment: "cnos"
	options: {}
}
