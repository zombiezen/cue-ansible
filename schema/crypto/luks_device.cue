package ansible

module: luks_device: {
	module: "luks_device"

	short_description: "Manage encrypted (LUKS) devices"

	version_added: "2.8"

	description: [
		"Module manages L(LUKS,https://en.wikipedia.org/wiki/Linux_Unified_Key_Setup) on given device. Supports creating, destroying, opening and closing of LUKS container and adding or removing new keys.",
	]

	options: {
		device: {
			description: [
				"Device to work with (e.g. C(/dev/sda1)). Needed in most cases. Can be omitted only when I(state=closed) together with I(name) is provided.",
			]

			type: "str"
		}
		state: {
			description: [
				"Desired state of the LUKS container. Based on its value creates, destroys, opens or closes the LUKS container on a given device.",
				"I(present) will create LUKS container unless already present. Requires I(device) and I(keyfile) options to be provided.",
				"I(absent) will remove existing LUKS container if it exists. Requires I(device) or I(name) to be specified.",
				"I(opened) will unlock the LUKS container. If it does not exist it will be created first. Requires I(device) and I(keyfile) to be specified. Use the I(name) option to set the name of the opened container. Otherwise the name will be generated automatically and returned as a part of the result.",
				"I(closed) will lock the LUKS container. However if the container does not exist it will be created. Requires I(device) and I(keyfile) options to be provided. If container does already exist I(device) or I(name) will suffice.",
			]

			type:    "str"
			default: "present"
			choices: ["present", "absent", "opened", "closed"]
		}
		name: {
			description: [
				"Sets container name when I(state=opened). Can be used instead of I(device) when closing the existing container (i.e. when I(state=closed)).",
			]

			type: "str"
		}
		keyfile: {
			description: [
				"Used to unlock the container and needed for most of the operations. Parameter value is the path to the keyfile with the passphrase.",
				"BEWARE that working with keyfiles in plaintext is dangerous. Make sure that they are protected.",
			]

			type: "path"
		}
		keysize: {
			description: [
				"Sets the key size only if LUKS container does not exist.",
			]
			type:          "int"
			version_added: "2.10"
		}
		new_keyfile: {
			description: [
				"Adds additional key to given container on I(device). Needs I(keyfile) option for authorization. LUKS container supports up to 8 keys. Parameter value is the path to the keyfile with the passphrase.",
				"NOTE that adding additional keys is I(not idempotent). A new keyslot will be used even if another keyslot already exists for this keyfile.",
				"BEWARE that working with keyfiles in plaintext is dangerous. Make sure that they are protected.",
			]

			type: "path"
		}
		remove_keyfile: {
			description: [
				"Removes given key from the container on I(device). Does not remove the keyfile from filesystem. Parameter value is the path to the keyfile with the passphrase.",
				"NOTE that removing keys is I(not idempotent). Trying to remove a key which no longer exists results in an error.",
				"NOTE that to remove the last key from a LUKS container, the I(force_remove_last_key) option must be set to C(yes).",
				"BEWARE that working with keyfiles in plaintext is dangerous. Make sure that they are protected.",
			]

			type: "path"
		}
		force_remove_last_key: {
			description: [
				"If set to C(yes), allows removing the last key from a container.",
				"BEWARE that when the last key has been removed from a container, the container can no longer be opened!",
			]

			type:    "bool"
			default: false
		}
		label: {
			description: [
				"This option allow the user to create a LUKS2 format container with label support, respectively to identify the container by label on later usages.",
				"Will only be used on container creation, or when I(device) is not specified.",
				"This cannot be specified if I(type) is set to C(luks1).",
			]
			type:          "str"
			version_added: "2.10"
		}
		uuid: {
			description: [
				"With this option user can identify the LUKS container by UUID.",
				"Will only be used when I(device) and I(label) are not specified.",
			]
			type:          "str"
			version_added: "2.10"
		}
		type: {
			description: [
				"This option allow the user explicit define the format of LUKS container that wants to work with. Options are C(luks1) or C(luks2)",
			]

			type: "str"
			choices: ["luks1", "luks2"]
			version_added: "2.10"
		}
	}

	requirements: [
		"cryptsetup",
		"wipefs (when I(state) is C(absent))",
		"lsblk",
		"blkid (when I(label) or I(uuid) options are used)",
	]

	author: "Jan Pokorny (@japokorn)"
}
