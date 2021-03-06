package ansible

module: openssh_keypair: {
	module:            "openssh_keypair"
	author:            "David Kainz (@lolcube)"
	version_added:     "2.8"
	short_description: "Generate OpenSSH private and public keys."
	description: [
		"This module allows one to (re)generate OpenSSH private and public keys. It uses ssh-keygen to generate keys. One can generate C(rsa), C(dsa), C(rsa1), C(ed25519) or C(ecdsa) private keys.",
	]

	requirements: [
		"ssh-keygen",
	]
	options: {
		state: {
			description: [
				"Whether the private and public keys should exist or not, taking action if the state is different from what is stated.",
			]
			type:    "str"
			default: "present"
			choices: ["present", "absent"]
		}
		size: {
			description: [
				"Specifies the number of bits in the private key to create. For RSA keys, the minimum size is 1024 bits and the default is 4096 bits. Generally, 2048 bits is considered sufficient.  DSA keys must be exactly 1024 bits as specified by FIPS 186-2. For ECDSA keys, size determines the key length by selecting from one of three elliptic curve sizes: 256, 384 or 521 bits. Attempting to use bit lengths other than these three values for ECDSA keys will cause this module to fail. Ed25519 keys have a fixed length and the size will be ignored.",
			]

			type: "int"
		}
		type: {
			description: [
				"The algorithm used to generate the SSH private key. C(rsa1) is for protocol version 1. C(rsa1) is deprecated and may not be supported by every version of ssh-keygen.",
			]

			type:    "str"
			default: "rsa"
			choices: ["rsa", "dsa", "rsa1", "ecdsa", "ed25519"]
		}
		force: {
			description: [
				"Should the key be regenerated even if it already exists",
			]
			type:    "bool"
			default: false
		}
		path: {
			description: [
				"Name of the files containing the public and private key. The file containing the public key will have the extension C(.pub).",
			]
			type:     "path"
			required: true
		}
		comment: {
			description: [
				"Provides a new comment to the public key. When checking if the key is in the correct state this will be ignored.",
			]
			type:          "str"
			version_added: "2.9"
		}
	}

	extends_documentation_fragment: "files"
}
