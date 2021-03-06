package ansible

module: crypttab: {
	module:            "crypttab"
	short_description: "Encrypted Linux block devices"
	description: [
		"Control Linux encrypted block devices that are set up during system boot in C(/etc/crypttab).",
	]
	version_added: "1.9"
	options: {
		name: {
			description: [
				"Name of the encrypted block device as it appears in the C(/etc/crypttab) file, or optionally prefixed with C(/dev/mapper/), as it appears in the filesystem. I(/dev/mapper/) will be stripped from I(name).",
			]

			type:     "str"
			required: true
		}
		state: {
			description: [
				"Use I(present) to add a line to C(/etc/crypttab) or update its definition if already present.",
				"Use I(absent) to remove a line with matching I(name).",
				"Use I(opts_present) to add options to those already present; options with different values will be updated.",
				"Use I(opts_absent) to remove options from the existing set.",
			]
			type:     "str"
			required: true
			choices: ["absent", "opts_absent", "opts_present", "present"]
		}
		backing_device: {
			description: [
				"Path to the underlying block device or file, or the UUID of a block-device prefixed with I(UUID=).",
			]

			type: "str"
		}
		password: {
			description: [
				"Encryption password, the path to a file containing the password, or C(-) or unset if the password should be entered at boot.",
			]

			type: "path"
		}
		opts: {
			description: [
				"A comma-delimited list of options. See C(crypttab(5) ) for details.",
			]
			type: "str"
		}
		path: {
			description: [
				"Path to file to use instead of C(/etc/crypttab).",
				"This might be useful in a chroot environment.",
			]
			type:    "path"
			default: "/etc/crypttab"
		}
	}
	author: ["Steve (@groks)"]
}
