package ansible

module: junos_package: {
	module:            "junos_package"
	version_added:     "2.1"
	author:            "Peter Sprygada (@privateip)"
	short_description: "Installs packages on remote devices running Junos"
	description: [
		"This module can install new and updated packages on remote devices running Junos.  The module will compare the specified package with the one running on the remote device and install the specified version if there is a mismatch",
	]

	extends_documentation_fragment: "junos"
	options: {
		src: {
			description: [
				"The I(src) argument specifies the path to the source package to be installed on the remote device in the advent of a version mismatch. The I(src) argument can be either a localized path or a full path to the package file to install.",
			]

			required: true
			aliases: ["package"]
		}
		version: description: [
			"The I(version) argument can be used to explicitly specify the version of the package that should be installed on the remote device.  If the I(version) argument is not specified, then the version is extracts from the I(src) filename.",
		]

		reboot: {
			description: [
				"In order for a package to take effect, the remote device must be restarted.  When enabled, this argument will instruct the module to reboot the device once the updated package has been installed. If disabled or the remote package does not need to be changed, the device will not be started.",
			]

			type:    "bool"
			default: "yes"
		}
		no_copy: {
			description: [
				"The I(no_copy) argument is responsible for instructing the remote device on where to install the package from.  When enabled, the package is transferred to the remote device prior to installing.",
			]

			type:    "bool"
			default: "no"
		}
		validate: {
			description: [
				"The I(validate) argument is responsible for instructing the remote device to skip checking the current device configuration compatibility with the package being installed. When set to false validation is not performed.",
			]

			version_added: 2.5
			type:          "bool"
			default:       "yes"
		}
		force: {
			description: [
				"The I(force) argument instructs the module to bypass the package version check and install the packaged identified in I(src) on the remote device.",
			]

			type:    "bool"
			default: "no"
		}
		force_host: {
			description: [
				"The I(force_host) argument controls the way software package or bundle is added on remote JUNOS host and is applicable for JUNOS QFX5100 device. If the value is set to C(True) it will ignore any warnings while adding the host software package or bundle.",
			]

			type:          "bool"
			default:       false
			version_added: 2.8
		}
		issu: {
			description: [
				"The I(issu) argument is a boolean flag when set to C(True) allows unified in-service software upgrade (ISSU) feature which enables you to upgrade between two different Junos OS releases with no disruption on the control plane and with minimal disruption of traffic.",
			]

			type:          "bool"
			default:       false
			version_added: 2.8
		}
	}
	requirements: [
		"junos-eznc",
		"ncclient (>=v0.5.2)",
	]
	notes: [
		"This module requires the netconf system service be enabled on the remote device being managed.",
		"Tested against vSRX JUNOS version 15.1X49-D15.4, vqfx-10000 JUNOS Version 15.1X53-D60.4.",
		"Works with C(local) connections only.",
	]
}
