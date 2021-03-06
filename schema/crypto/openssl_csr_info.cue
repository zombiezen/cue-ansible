package ansible

module: openssl_csr_info: {
	module:            "openssl_csr_info"
	version_added:     "2.8"
	short_description: "Provide information of OpenSSL Certificate Signing Requests (CSR)"
	description: [
		"This module allows one to query information on OpenSSL Certificate Signing Requests (CSR).",
		"In case the CSR signature cannot be validated, the module will fail. In this case, all return variables are still returned.",
		"It uses the pyOpenSSL or cryptography python library to interact with OpenSSL. If both the cryptography and PyOpenSSL libraries are available (and meet the minimum version requirements) cryptography will be preferred as a backend over PyOpenSSL (unless the backend is forced with C(select_crypto_backend)). Please note that the PyOpenSSL backend was deprecated in Ansible 2.9 and will be removed in Ansible 2.13.",
	]

	requirements: [
		"PyOpenSSL >= 0.15 or cryptography >= 1.3",
	]
	author: [
		"Felix Fontein (@felixfontein)",
		"Yanis Guenane (@Spredzy)",
	]
	options: {
		path: {
			description: [
				"Remote absolute path where the CSR file is loaded from.",
			]
			type:     "path"
			required: true
		}

		select_crypto_backend: {
			description: [
				"Determines which crypto backend to use.",
				"The default choice is C(auto), which tries to use C(cryptography) if available, and falls back to C(pyopenssl).",
				"If set to C(pyopenssl), will try to use the L(pyOpenSSL,https://pypi.org/project/pyOpenSSL/) library.",
				"If set to C(cryptography), will try to use the L(cryptography,https://cryptography.io/) library.",
				"Please note that the C(pyopenssl) backend has been deprecated in Ansible 2.9, and will be removed in Ansible 2.13. From that point on, only the C(cryptography) backend will be available.",
			]

			type:    "str"
			default: "auto"
			choices: ["auto", "cryptography", "pyopenssl"]
		}
	}

	seealso: [{
		module: "openssl_csr"
	}]
}
