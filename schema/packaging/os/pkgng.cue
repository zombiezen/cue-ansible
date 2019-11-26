package ansible

module: pkgng: {
	module:            "pkgng"
	short_description: "Package manager for FreeBSD >= 9.0"
	description: [
		"Manage binary packages for FreeBSD using 'pkgng' which is available in versions after 9.0.",
	]
	version_added: "1.2"
	options: {
		name: {
			description: [
				"Name or list of names of packages to install/remove.",
			]
			required: true
		}
		state: {
			description: [
				"State of the package.",
				"Note: \"latest\" added in 2.7",
			]
			choices: ["present", "latest", "absent"]
			required: false
			default:  "present"
		}
		cached: {
			description: [
				"Use local package base instead of fetching an updated one.",
			]
			type:     "bool"
			required: false
			default:  false
		}
		annotation: {
			description: [
				"A comma-separated list of keyvalue-pairs of the form C(<+/-/:><key>[=<value>]). A C(+) denotes adding an annotation, a C(-) denotes removing an annotation, and C(:) denotes modifying an annotation. If setting or modifying annotations, a value must be provided.",
			]

			required:      false
			version_added: "1.6"
		}
		pkgsite: {
			description: [
				"For pkgng versions before 1.1.4, specify packagesite to use for downloading packages. If not specified, use settings from C(/usr/local/etc/pkg.conf).",
				"For newer pkgng versions, specify a the name of a repository configured in C(/usr/local/etc/pkg/repos).",
			]

			required: false
		}
		rootdir: {
			description: [
				"For pkgng versions 1.5 and later, pkg will install all packages within the specified root directory.",
				"Can not be used together with I(chroot) or I(jail) options.",
			]
			required: false
		}
		chroot: {
			version_added: "2.1"
			description: [
				"Pkg will chroot in the specified environment.",
				"Can not be used together with I(rootdir) or I(jail) options.",
			]
			required: false
		}
		jail: {
			version_added: "2.4"
			description: [
				"Pkg will execute in the given jail name or id.",
				"Can not be used together with I(chroot) or I(rootdir) options.",
			]
		}
		autoremove: {
			version_added: "2.2"
			description: [
				"Remove automatically installed packages which are no longer needed.",
			]
			required: false
			type:     "bool"
			default:  false
		}
	}
	author: "bleader (@bleader)"
	notes: [
		"When using pkgsite, be careful that already in cache packages won't be downloaded again.",
		"When used with a `loop:` each package will be processed individually, it is much more efficient to pass the list directly to the `name` option.",
	]
}
