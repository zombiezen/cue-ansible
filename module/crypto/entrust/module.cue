package entrust

openssl_publickey :: {

	// Create a backup file including a timestamp so you can get the original public key back if you overwrote it with a different one by accident.

	backup?: bool

	// Should the key be regenerated even it it already exists.

	force?: bool

	// The format of the public key.

	format?: string

	// Name of the file in which the generated TLS/SSL public key will be written.

	path: string

	// The passphrase for the private key.

	privatekey_passphrase?: string

	// Path to the TLS/SSL private key from which to generate the public key.

	privatekey_path: string

	// Determines which crypto backend to use.
	// The default choice is C(auto), which tries to use C(cryptography) if available, and falls back to C(pyopenssl).
	// If set to C(pyopenssl), will try to use the L(pyOpenSSL,https://pypi.org/project/pyOpenSSL/) library.
	// If set to C(cryptography), will try to use the L(cryptography,https://cryptography.io/) library.

	select_crypto_backend?: string

	// Whether the public key should exist or not, taking action if the state is different from what is stated.

	state?: string
}

certificate_complete_chain :: {

	// A concatenated set of certificates in PEM format forming a chain.
	// The module will try to complete this chain.

	input_chain: string

	// A list of filenames or directories.
	// A filename is assumed to point to a file containing one or more certificates in PEM format. All certificates in this file will be added to the set of root certificates.
	// If a directory name is given, all files in the directory and its subdirectories will be scanned and tried to be parsed as concatenated certificates in PEM format.
	// Symbolic links will be followed.

	intermediate_certificates?: [...string]

	// A list of filenames or directories.
	// A filename is assumed to point to a file containing one or more certificates in PEM format. All certificates in this file will be added to the set of root certificates.
	// If a directory name is given, all files in the directory and its subdirectories will be scanned and tried to be parsed as concatenated certificates in PEM format.
	// Symbolic links will be followed.

	root_certificates: [...string]
}

openssl_privatekey :: {

	// The cipher to encrypt the private key. (Valid values can be found by running `openssl list -cipher-algorithms` or `openssl list-cipher-algorithms`, depending on your OpenSSL version.)
	// When using the C(cryptography) backend, use C(auto).

	cipher?: string

	// Name of the file in which the generated TLS/SSL private key will be written. It will have 0600 mode.

	path: string

	// Determines which crypto backend to use.
	// The default choice is C(auto), which tries to use C(cryptography) if available, and falls back to C(pyopenssl).
	// If set to C(pyopenssl), will try to use the L(pyOpenSSL,https://pypi.org/project/pyOpenSSL/) library.
	// If set to C(cryptography), will try to use the L(cryptography,https://cryptography.io/) library.
	// Please note that the C(pyopenssl) backend has been deprecated in Ansible 2.9, and will be removed in Ansible 2.13. From that point on, only the C(cryptography) backend will be available.

	select_crypto_backend?: string

	// Size (in bits) of the TLS/SSL key to generate.

	size?: int

	// Create a backup file including a timestamp so you can get the original private key back if you overwrote it with a new one by accident.

	backup?: bool

	// Note that not all curves are supported by all versions of C(cryptography).
	// For maximal interoperability, C(secp384r1) or C(secp256r1) should be used.
	// We use the curve names as defined in the L(IANA registry for TLS,https://www.iana.org/assignments/tls-parameters/tls-parameters.xhtml#tls-parameters-8).

	curve?: string

	// Should the key be regenerated even if it already exists.

	force?: bool

	// Determines which format the private key is written in. By default, PKCS1 (traditional OpenSSL format) is used for all keys which support it. Please note that not every key can be exported in any format.
	// The value C(auto) selects a fromat based on the key format. The value C(auto_ignore) does the same, but for existing private key files, it will not force a regenerate when its format is not the automatically selected one for generation.
	// Note that if the format for an existing private key mismatches, the key is *regenerated* by default. To change this behavior, use the I(format_mismatch) option.
	// The I(format) option is only supported by the C(cryptography) backend. The C(pyopenssl) backend will fail if a value different from C(auto_ignore) is used.

	format?: string

	// Determines behavior of the module if the format of a private key does not match the expected format, but all other parameters are as expected.
	// If set to C(regenerate) (default), generates a new private key.
	// If set to C(convert), the key will be converted to the new format instead.
	// Only supported by the C(cryptography) backend.

	format_mismatch?: string

	// The passphrase for the private key.

	passphrase?: string

	// Whether the private key should exist or not, taking action if the state is different from what is stated.

	state?: string

	// The algorithm used to generate the TLS/SSL private key.
	// Note that C(ECC), C(X25519), C(X448), C(Ed25519) and C(Ed448) require the C(cryptography) backend. C(X25519) needs cryptography 2.5 or newer, while C(X448), C(Ed25519) and C(Ed448) require cryptography 2.6 or newer. For C(ECC), the minimal cryptography version required depends on the I(curve) option.

	type?: string
}

openssl_certificate :: {

	// The I(extended_key_usage) extension field must contain all these values.
	// This is only used by the C(assertonly) provider.
	// This option is deprecated since Ansible 2.9 and will be removed with the C(assertonly) provider in Ansible 2.13. For alternatives, see the example on replacing C(assertonly).

	extended_key_usage?: [...string]

	// The version of the certificate.
	// Nowadays it should almost always be 3.
	// This is only used by the C(assertonly) provider.
	// This option is deprecated since Ansible 2.9 and will be removed with the C(assertonly) provider in Ansible 2.13. For alternatives, see the example on replacing C(assertonly).

	version?: int

	// The path to the client certificate used to authenticate to the Entrust Certificate Services (ECS) API.
	// This is only used by the C(entrust) provider.
	// This is required if the provider is C(entrust).

	entrust_api_client_cert_path?: string

	// The point in time at which the certificate stops being valid.
	// Time can be specified either as relative time or as absolute timestamp.
	// Time will always be interpreted as UTC.
	// Valid format is C([+-]timespec | ASN.1 TIME) where timespec can be an integer + C([w | d | h | m | s]) (e.g. C(+32w1d2h).
	// Note that if using relative time this module is NOT idempotent.
	// If this value is not specified, the certificate will stop being valid 10 years from now.
	// This is only used by the C(selfsigned) provider.

	selfsigned_not_after?: string

	// The key/value pairs that must be present in the subject name field of the certificate.
	// If you need to specify more than one value with the same key, use a list as value.
	// This is only used by the C(assertonly) provider.
	// This option is deprecated since Ansible 2.9 and will be removed with the C(assertonly) provider in Ansible 2.13. For alternatives, see the example on replacing C(assertonly).

	subject?: {...}

	// A list of algorithms that you would accept the certificate to be signed with (e.g. ['sha256WithRSAEncryption', 'sha512WithRSAEncryption']).
	// This is only used by the C(assertonly) provider.
	// This option is deprecated since Ansible 2.9 and will be removed with the C(assertonly) provider in Ansible 2.13. For alternatives, see the example on replacing C(assertonly).

	signature_algorithms?: [...string]

	// The username for authentication to the Entrust Certificate Services (ECS) API.
	// This is only used by the C(entrust) provider.
	// This is required if the provider is C(entrust).

	entrust_api_user?: string

	// The certificate must expire at this point in time.
	// The timestamp is formatted as an ASN.1 TIME.
	// This is only used by the C(assertonly) provider.
	// This option is deprecated since Ansible 2.9 and will be removed with the C(assertonly) provider in Ansible 2.13. For alternatives, see the example on replacing C(assertonly).

	not_after?: string

	// Whether to create the Subject Key Identifier (SKI) from the public key.
	// A value of C(create_if_not_provided) (default) only creates a SKI when the CSR does not provide one.
	// A value of C(always_create) always creates a SKI. If the CSR provides one, that one is ignored.
	// A value of C(never_create) never creates a SKI. If the CSR provides one, that one is used.
	// This is only used by the C(selfsigned) provider.
	// Note that this is only supported if the C(cryptography) backend is used!

	selfsigned_create_subject_key_identifier?: string

	// The certificate must be invalid at this point in time.
	// The timestamp is formatted as an ASN.1 TIME.
	// This is only used by the C(assertonly) provider.
	// This option is deprecated since Ansible 2.9 and will be removed with the C(assertonly) provider in Ansible 2.13. For alternatives, see the example on replacing C(assertonly).

	invalid_at?: string

	// The certificate must start to become valid at this point in time.
	// The timestamp is formatted as an ASN.1 TIME.
	// This is only used by the C(assertonly) provider.
	// This option is deprecated since Ansible 2.9 and will be removed with the C(assertonly) provider in Ansible 2.13. For alternatives, see the example on replacing C(assertonly).

	not_before?: string

	// The point in time the certificate is valid from.
	// Time can be specified either as relative time or as absolute timestamp.
	// Time will always be interpreted as UTC.
	// Valid format is C([+-]timespec | ASN.1 TIME) where timespec can be an integer + C([w | d | h | m | s]) (e.g. C(+32w1d2h).
	// Note that if using relative time this module is NOT idempotent.
	// If this value is not specified, the certificate will start being valid from now.
	// This is only used by the C(ownca) provider.

	ownca_not_before?: string

	// The key/value pairs that must be present in the issuer name field of the certificate.
	// If you need to specify more than one value with the same key, use a list as value.
	// This is only used by the C(assertonly) provider.
	// This option is deprecated since Ansible 2.9 and will be removed with the C(assertonly) provider in Ansible 2.13. For alternatives, see the example on replacing C(assertonly).

	issuer?: {...}

	// The certificate must be valid at this point in time.
	// The timestamp is formatted as an ASN.1 TIME.
	// This is only used by the C(assertonly) provider.
	// This option is deprecated since Ansible 2.9 and will be removed with the C(assertonly) provider in Ansible 2.13. For alternatives, see the example on replacing C(assertonly).

	valid_at?: string

	// The key (password) for authentication to the Entrust Certificate Services (ECS) API.
	// This is only used by the C(entrust) provider.
	// This is required if the provider is C(entrust).

	entrust_api_key?: string

	// The point in time at which the certificate stops being valid.
	// Time can be specified either as relative time or as an absolute timestamp.
	// A valid absolute time format is C(ASN.1 TIME) such as C(2019-06-18).
	// A valid relative time format is C([+-]timespec) where timespec can be an integer + C([w | d | h | m | s]), such as C(+365d) or C(+32w1d2h)).
	// Time will always be interpreted as UTC.
	// Note that only the date (day, month, year) is supported for specifying the expiry date of the issued certificate.
	// The full date-time is adjusted to EST (GMT -5:00) before issuance, which may result in a certificate with an expiration date one day earlier than expected if a relative time is used.
	// The minimum certificate lifetime is 90 days, and maximum is three years.
	// If this value is not specified, the certificate will stop being valid 365 days the date of issue.
	// This is only used by the C(entrust) provider.

	entrust_not_after?: string

	// The email of the requester of the certificate (for tracking purposes).
	// This is only used by the C(entrust) provider.
	// This is required if the provider is C(entrust).

	entrust_requester_email?: string

	// The passphrase for the I(ownca_privatekey_path).
	// This is only used by the C(ownca) provider.

	ownca_privatekey_passphrase?: string

	// The version of the C(ownca) certificate.
	// Nowadays it should almost always be C(3).
	// This is only used by the C(ownca) provider.

	ownca_version?: int

	// Path to the Certificate Signing Request (CSR) used to generate this certificate.
	// This is not required in C(assertonly) mode.

	csr_path?: string

	// Specify the type of certificate requested.
	// This is only used by the C(entrust) provider.

	entrust_cert_type?: string

	// Name of the provider to use to generate/retrieve the OpenSSL certificate.
	// The C(assertonly) provider will not generate files and fail if the certificate file is missing.
	// The C(assertonly) provider has been deprecated in Ansible 2.9 and will be removed in Ansible 2.13. Please see the examples on how to emulate it with M(openssl_certificate_info), M(openssl_csr_info), M(openssl_privatekey_info) and M(assert).
	// The C(entrust) provider was added for Ansible 2.9 and requires credentials for the L(https://www.entrustdatacard.com/products/categories/ssl-certificates,Entrust Certificate Services) (ECS) API.

	provider: string

	// The digest algorithm to be used for the C(ownca) certificate.
	// This is only used by the C(ownca) provider.

	ownca_digest?: string

	// Whether the certificate should exist or not, taking action if the state is different from what is stated.

	state?: string

	// The I(subject_alt_name) extension field must contain these values.
	// This is only used by the C(assertonly) provider.
	// This option is deprecated since Ansible 2.9 and will be removed with the C(assertonly) provider in Ansible 2.13. For alternatives, see the example on replacing C(assertonly).

	subject_alt_name?: [...string]

	// The path to the ACME challenge directory that is served on U(http://<HOST>:80/.well-known/acme-challenge/)
	// This is only used by the C(acme) provider.

	acme_challenge_path?: string

	// Checks if the certificate is expired/not expired at the time the module is executed.
	// This is only used by the C(assertonly) provider.
	// This option is deprecated since Ansible 2.9 and will be removed with the C(assertonly) provider in Ansible 2.13. For alternatives, see the example on replacing C(assertonly).

	has_expired?: bool

	// Version of the C(selfsigned) certificate.
	// Nowadays it should almost always be C(3).
	// This is only used by the C(selfsigned) provider.

	selfsigned_version?: int

	// Include the intermediate certificate to the generated certificate
	// This is only used by the C(acme) provider.
	// Note that this is only available for older versions of C(acme-tiny). New versions include the chain automatically, and setting I(acme_chain) to C(yes) results in an error.

	acme_chain?: bool

	// The phone number of the requester of the certificate (for tracking purposes).
	// This is only used by the C(entrust) provider.
	// This is required if the provider is C(entrust).

	entrust_requester_phone?: string

	// Digest algorithm to be used when self-signing the certificate.
	// This is only used by the C(selfsigned) provider.

	selfsigned_digest?: string

	// The path to the specification file defining the Entrust Certificate Services (ECS) API configuration.
	// You can use this to keep a local copy of the specification to avoid downloading it every time the module is used.
	// This is only used by the C(entrust) provider.

	entrust_api_specification_path?: string

	// If set to C(yes), the I(subject) field must contain only these values.
	// This is only used by the C(assertonly) provider.
	// This option is deprecated since Ansible 2.9 and will be removed with the C(assertonly) provider in Ansible 2.13. For alternatives, see the example on replacing C(assertonly).

	subject_strict?: bool

	// The certificate must still be valid at this relative time offset from now.
	// Valid format is C([+-]timespec | number_of_seconds) where timespec can be an integer + C([w | d | h | m | s]) (e.g. C(+32w1d2h).
	// Note that if using this parameter, this module is NOT idempotent.
	// This is only used by the C(assertonly) provider.
	// This option is deprecated since Ansible 2.9 and will be removed with the C(assertonly) provider in Ansible 2.13. For alternatives, see the example on replacing C(assertonly).

	valid_in?: string

	// Create a backup file including a timestamp so you can get the original certificate back if you overwrote it with a new one by accident.
	// This is not used by the C(assertonly) provider.
	// This option is deprecated since Ansible 2.9 and will be removed with the C(assertonly) provider in Ansible 2.13. For alternatives, see the example on replacing C(assertonly).

	backup?: bool

	// If set to C(yes), the I(subject_alt_name) extension field must contain only these values.
	// This is only used by the C(assertonly) provider.
	// This option is deprecated since Ansible 2.9 and will be removed with the C(assertonly) provider in Ansible 2.13. For alternatives, see the example on replacing C(assertonly).

	subject_alt_name_strict?: bool

	// If set to C(yes), the I(extended_key_usage) extension field must contain only these values.
	// This is only used by the C(assertonly) provider.
	// This option is deprecated since Ansible 2.9 and will be removed with the C(assertonly) provider in Ansible 2.13. For alternatives, see the example on replacing C(assertonly).

	extended_key_usage_strict?: bool

	// Determines which crypto backend to use.
	// The default choice is C(auto), which tries to use C(cryptography) if available, and falls back to C(pyopenssl).
	// If set to C(pyopenssl), will try to use the L(pyOpenSSL,https://pypi.org/project/pyOpenSSL/) library.
	// If set to C(cryptography), will try to use the L(cryptography,https://cryptography.io/) library.
	// Please note that the C(pyopenssl) backend has been deprecated in Ansible 2.9, and will be removed in Ansible 2.13. From that point on, only the C(cryptography) backend will be available.

	select_crypto_backend?: string

	// The point in time the certificate is valid from.
	// Time can be specified either as relative time or as absolute timestamp.
	// Time will always be interpreted as UTC.
	// Valid format is C([+-]timespec | ASN.1 TIME) where timespec can be an integer + C([w | d | h | m | s]) (e.g. C(+32w1d2h).
	// Note that if using relative time this module is NOT idempotent.
	// If this value is not specified, the certificate will start being valid from now.
	// This is only used by the C(selfsigned) provider.

	selfsigned_not_before?: string

	// If set to C(yes), the I(key_usage) extension field must contain only these values.
	// This is only used by the C(assertonly) provider.
	// This option is deprecated since Ansible 2.9 and will be removed with the C(assertonly) provider in Ansible 2.13. For alternatives, see the example on replacing C(assertonly).

	key_usage_strict?: bool

	// The passphrase for the I(privatekey_path).
	// This is required if the private key is password protected.

	privatekey_passphrase?: string

	// The path to the private key of the client certificate used to authenticate to the Entrust Certificate Services (ECS) API.
	// This is only used by the C(entrust) provider.
	// This is required if the provider is C(entrust).

	entrust_api_client_cert_key_path?: string

	// The name of the requester of the certificate (for tracking purposes).
	// This is only used by the C(entrust) provider.
	// This is required if the provider is C(entrust).

	entrust_requester_name?: string

	// If set to C(yes), the I(issuer) field must contain only these values.
	// This is only used by the C(assertonly) provider.
	// This option is deprecated since Ansible 2.9 and will be removed with the C(assertonly) provider in Ansible 2.13. For alternatives, see the example on replacing C(assertonly).

	issuer_strict?: bool

	// Create a Authority Key Identifier from the CA's certificate. If the CSR provided a authority key identifier, it is ignored.
	// The Authority Key Identifier is generated from the CA certificate's Subject Key Identifier, if available. If it is not available, the CA certificate's public key will be used.
	// This is only used by the C(ownca) provider.
	// Note that this is only supported if the C(cryptography) backend is used!

	ownca_create_authority_key_identifier?: bool

	// The point in time at which the certificate stops being valid.
	// Time can be specified either as relative time or as absolute timestamp.
	// Time will always be interpreted as UTC.
	// Valid format is C([+-]timespec | ASN.1 TIME) where timespec can be an integer + C([w | d | h | m | s]) (e.g. C(+32w1d2h).
	// Note that if using relative time this module is NOT idempotent.
	// If this value is not specified, the certificate will stop being valid 10 years from now.
	// This is only used by the C(ownca) provider.

	ownca_not_after?: string

	// Remote absolute path of the CA (Certificate Authority) certificate.
	// This is only used by the C(ownca) provider.

	ownca_path?: string

	// Generate the certificate, even if it already exists.

	force?: bool

	// Whether to create the Subject Key Identifier (SKI) from the public key.
	// A value of C(create_if_not_provided) (default) only creates a SKI when the CSR does not provide one.
	// A value of C(always_create) always creates a SKI. If the CSR provides one, that one is ignored.
	// A value of C(never_create) never creates a SKI. If the CSR provides one, that one is used.
	// This is only used by the C(ownca) provider.
	// Note that this is only supported if the C(cryptography) backend is used!

	ownca_create_subject_key_identifier?: string

	// Path to the CA (Certificate Authority) private key to use when signing the certificate.
	// This is only used by the C(ownca) provider.

	ownca_privatekey_path?: string

	// The path to the accountkey for the C(acme) provider.
	// This is only used by the C(acme) provider.

	acme_accountkey_path?: string

	// Path to the private key to use when signing the certificate.

	privatekey_path?: string

	// Remote absolute path where the generated certificate file should be created or is already located.

	path: string

	// The I(key_usage) extension field must contain all these values.
	// This is only used by the C(assertonly) provider.
	// This option is deprecated since Ansible 2.9 and will be removed with the C(assertonly) provider in Ansible 2.13. For alternatives, see the example on replacing C(assertonly).

	key_usage?: [...string]
}

openssl_csr :: {

	// The commonName field of the certificate signing request subject.

	common_name?: string

	// Should the OCSP Must Staple extension be considered as critical
	// Note that according to the RFC, this extension should not be marked as critical, as old clients not knowing about OCSP Must Staple are required to reject such certificates (see U(https://tools.ietf.org/html/rfc7633#section-4)).

	ocsp_must_staple_critical?: bool

	// The name of the file into which the generated OpenSSL certificate signing request will be written.

	path: string

	// The passphrase for the private key.
	// This is required if the private key is password protected.

	privatekey_passphrase?: string

	// Key/value pairs that will be present in the subject name field of the certificate signing request.
	// If you need to specify more than one value with the same key, use a list as value.

	subject?: {...}

	// SAN extension to attach to the certificate signing request.
	// This can either be a 'comma separated string' or a YAML list.
	// Values must be prefixed by their options. (i.e., C(email), C(URI), C(DNS), C(RID), C(IP), C(dirName), C(otherName) and the ones specific to your CA)
	// Note that if no SAN is specified, but a common name, the common name will be added as a SAN except if C(useCommonNameForSAN) is set to I(false).
	// More at U(https://tools.ietf.org/html/rfc5280#section-4.2.1.6).

	subject_alt_name?: [...string]

	// If set to C(yes), the module will fill the common name in for C(subject_alt_name) with C(DNS:) prefix if no SAN is specified.

	use_common_name_for_san?: bool

	// Should the basicConstraints extension be considered as critical.

	basic_constraints_critical?: bool

	// The digest used when signing the certificate signing request with the private key.

	digest?: string

	// Should the certificate signing request be forced regenerated by this ansible module.

	force?: bool

	// Indicates that the certificate should contain the OCSP Must Staple extension (U(https://tools.ietf.org/html/rfc7633)).

	ocsp_must_staple?: bool

	// Indicates basic constraints, such as if the certificate is a CA.

	basic_constraints?: [...string]

	// The organizationalUnitName field of the certificate signing request subject.

	organizational_unit_name?: string

	// Determines which crypto backend to use.
	// The default choice is C(auto), which tries to use C(cryptography) if available, and falls back to C(pyopenssl).
	// If set to C(pyopenssl), will try to use the L(pyOpenSSL,https://pypi.org/project/pyOpenSSL/) library.
	// If set to C(cryptography), will try to use the L(cryptography,https://cryptography.io/) library.
	// Please note that the C(pyopenssl) backend has been deprecated in Ansible 2.9, and will be removed in Ansible 2.13. From that point on, only the C(cryptography) backend will be available.

	select_crypto_backend?: string

	// The subject key identifier as a hex string, where two bytes are separated by colons.
	// Example: C(00:11:22:33:44:55:66:77:88:99:aa:bb:cc:dd:ee:ff:00:11:22:33)
	// Please note that commercial CAs ignore this value, respectively use a value of their own choice. Specifying this option is mostly useful for self-signed certificates or for own CAs.
	// Note that this option can only be used if I(create_subject_key_identifier) is C(no).
	// Note that this is only supported if the C(cryptography) backend is used!

	subject_key_identifier?: string

	// The organizationName field of the certificate signing request subject.

	organization_name?: string

	// Should the keyUsage extension be considered as critical.

	key_usage_critical?: bool

	// The localityName field of the certificate signing request subject.

	locality_name?: string

	// Whether the certificate signing request should exist or not, taking action if the state is different from what is stated.

	state?: string

	// Additional restrictions (e.g. client authentication, server authentication) on the allowed purposes for which the public key may be used.

	extended_key_usage?: [...string]

	// Should the extkeyUsage extension be considered as critical.

	extended_key_usage_critical?: bool

	// Create the Subject Key Identifier from the public key.
	// Please note that commercial CAs can ignore the value, respectively use a value of their own choice instead. Specifying this option is mostly useful for self-signed certificates or for own CAs.
	// Note that this is only supported if the C(cryptography) backend is used!

	create_subject_key_identifier?: bool

	// The authority cert serial number.
	// Note that this is only supported if the C(cryptography) backend is used!
	// Please note that commercial CAs ignore this value, respectively use a value of their own choice. Specifying this option is mostly useful for self-signed certificates or for own CAs.
	// The C(AuthorityKeyIdentifier) will only be added if at least one of I(authority_key_identifier), I(authority_cert_issuer) and I(authority_cert_serial_number) is specified.

	authority_cert_serial_number?: int

	// Create a backup file including a timestamp so you can get the original CSR back if you overwrote it with a new one by accident.

	backup?: bool

	// The emailAddress field of the certificate signing request subject.

	email_address?: string

	// The path to the private key to use when signing the certificate signing request.

	privatekey_path: string

	// Should the subjectAltName extension be considered as critical.

	subject_alt_name_critical?: bool

	// Names that will be present in the authority cert issuer field of the certificate signing request.
	// Values must be prefixed by their options. (i.e., C(email), C(URI), C(DNS), C(RID), C(IP), C(dirName), C(otherName) and the ones specific to your CA)
	// Example: C(DNS:ca.example.org)
	// If specified, I(authority_key_identifier) must also be specified.
	// Please note that commercial CAs ignore this value, respectively use a value of their own choice. Specifying this option is mostly useful for self-signed certificates or for own CAs.
	// Note that this is only supported if the C(cryptography) backend is used!
	// The C(AuthorityKeyIdentifier) will only be added if at least one of I(authority_key_identifier), I(authority_cert_issuer) and I(authority_cert_serial_number) is specified.

	authority_cert_issuer?: [...string]

	// This defines the purpose (e.g. encipherment, signature, certificate signing) of the key contained in the certificate.

	key_usage?: [...string]

	// The countryName field of the certificate signing request subject.

	country_name?: string

	// The stateOrProvinceName field of the certificate signing request subject.

	state_or_province_name?: string

	// The version of the certificate signing request.
	// The only allowed value according to L(RFC 2986,https://tools.ietf.org/html/rfc2986#section-4.1) is 1.
	// This option will no longer accept unsupported values from Ansible 2.14 on.

	version?: int

	// The authority key identifier as a hex string, where two bytes are separated by colons.
	// Example: C(00:11:22:33:44:55:66:77:88:99:aa:bb:cc:dd:ee:ff:00:11:22:33)
	// If specified, I(authority_cert_issuer) must also be specified.
	// Please note that commercial CAs ignore this value, respectively use a value of their own choice. Specifying this option is mostly useful for self-signed certificates or for own CAs.
	// Note that this is only supported if the C(cryptography) backend is used!
	// The C(AuthorityKeyIdentifier) will only be added if at least one of I(authority_key_identifier), I(authority_cert_issuer) and I(authority_cert_serial_number) is specified.

	authority_key_identifier?: string
}

openssl_csr_info :: {

	// Remote absolute path where the CSR file is loaded from.

	path: string

	// Determines which crypto backend to use.
	// The default choice is C(auto), which tries to use C(cryptography) if available, and falls back to C(pyopenssl).
	// If set to C(pyopenssl), will try to use the L(pyOpenSSL,https://pypi.org/project/pyOpenSSL/) library.
	// If set to C(cryptography), will try to use the L(cryptography,https://cryptography.io/) library.
	// Please note that the C(pyopenssl) backend has been deprecated in Ansible 2.9, and will be removed in Ansible 2.13. From that point on, only the C(cryptography) backend will be available.

	select_crypto_backend?: string
}

openssl_dhparam :: {

	// Create a backup file including a timestamp so you can get the original DH params back if you overwrote them with new ones by accident.

	backup?: bool

	// Should the parameters be regenerated even it it already exists.

	force?: bool

	// Name of the file in which the generated parameters will be saved.

	path: string

	// Determines which crypto backend to use.
	// The default choice is C(auto), which tries to use C(cryptography) if available, and falls back to C(openssl).
	// If set to C(openssl), will try to use the OpenSSL C(openssl) executable.
	// If set to C(cryptography), will try to use the L(cryptography,https://cryptography.io/) library.

	select_crypto_backend?: string

	// Size (in bits) of the generated DH-params.

	size?: int

	// Whether the parameters should exist or not, taking action if the state is different from what is stated.

	state?: string
}

ecs_certificate :: {

	// The date the certificate should be set to expire, in RFC3339 compliant date or date-time format. For example, C(2020-02-23), C(2020-02-23T15:00:00.05Z).
	// I(cert_expiry) is only supported for requests of C(request_type=new) or C(request_type=renew). If C(request_type=reissue), I(cert_expiry) will be used for the first certificate issuance, but subsequent issuances will have the same expiry as the initial certificate.
	// A reissued certificate will always have the same expiry as the original certificate.
	// Note that only the date (day, month, year) is supported for specifying the expiry date. If you choose to specify an expiry time with the expiry date, the time will be adjusted to Eastern Standard Time (EST). This could have the unintended effect of moving your expiry date to the previous day.
	// Applies only to accounts with a pooling inventory model.
	// Only one of I(cert_expiry) or I(cert_lifetime) may be specified.

	cert_expiry?: string

	// Mapping of custom fields to associate with the certificate request and certificate.
	// Only supported if custom fields are enabled for your account.
	// Each custom field specified must be a custom field you have defined for your account.

	custom_fields?: {...}

	// The destination path for the full certificate chain of the certificate, intermediates, and roots.

	full_chain_path?: string

	// Organization "O=" to include in the certificate.
	// If I(org) is not specified, the organization from the client represented by I(client_id) is used.
	// Unless the I(cert_type) is C(PD_SSL), this field may not be specified if the value of I(client_id) is not "1" (the primary client). non-primary clients, certificates may only be issued with the organization of that client.

	org?: string

	// Free form tracking information to attach to the record for the certificate.

	tracking_info?: string

	// Specify the type of certificate requested.
	// If a certificate is being reissued or renewed, this parameter is ignored, and the C(cert_type) of the initial certificate is used.

	cert_type?: string

	// Base-64 encoded Certificate Signing Request (CSR). I(csr) is accepted with or without PEM formatting around the Base-64 string.
	// If no I(csr) is provided when C(request_type=reissue) or C(request_type=renew), the certificate will be generated with the same public key as the certificate being renewed or reissued.
	// If I(subject_alt_name) is specified, it will override the subject alternate names in the CSR.
	// If I(eku) is specified, it will override the extended key usage in the CSR.
	// If I(ou) is specified, it will override the organizational units "ou=" present in the subject distinguished name of the CSR, if any.
	// The organization "O=" field from the CSR will not be used. It will be replaced in the issued certificate by I(org) if present, and if not present, the organization tied to I(client_id).

	csr?: string

	// If specified, overrides the key usage in the I(csr).

	eku?: string

	// The requester email to associate with certificate tracking information and receive delivery and expiry notices for the certificate.

	requester_email: string

	// Whether a backup should be made for the certificate in I(path).

	backup?: bool

	// The lifetime of the certificate.
	// Applies to all certificates for accounts with a non-pooling inventory model.
	// I(cert_lifetime) is only supported for requests of C(request_type=new) or C(request_type=renew). If C(request_type=reissue), I(cert_lifetime) will be used for the first certificate issuance, but subsequent issuances will have the same expiry as the initial certificate.
	// Applies to certificates of I(cert_type)=C(CDS_INDIVIDUAL, CDS_GROUP, CDS_ENT_LITE, CDS_ENT_PRO, SMIME_ENT) for accounts with a pooling inventory model.
	// C(P1Y) is a certificate with a 1 year lifetime.
	// C(P2Y) is a certificate with a 2 year lifetime.
	// C(P3Y) is a certificate with a 3 year lifetime.
	// Only one of I(cert_expiry) or I(cert_lifetime) may be specified.

	cert_lifetime?: string

	// The client ID to submit the Certificate Signing Request under.
	// If no client ID is specified, the certificate will be submitted under the primary client with ID of 1.
	// When using a client other than the primary client, the I(org) parameter cannot be specified.
	// The issued certificate will have an organization value in the subject distinguished name represented by the client.

	client_id?: int

	// The end user of the Code Signing certificate must generate and store the private key for this request on cryptographically secure hardware to be compliant with the Entrust CSP and Subscription agreement. If requesting a certificate of type C(CODE_SIGNING) or C(EV_CODE_SIGNING), you must set I(end_user_key_storage_agreement) to true if and only if you acknowledge that you will inform the user of this requirement.
	// Applicable only to I(cert_type) of values C(CODE_SIGNING) and C(EV_CODE_SIGNING).

	end_user_key_storage_agreement?: bool

	// The destination path for the generated certificate as a PEM encoded cert.
	// If the certificate at this location is not an Entrust issued certificate, a new certificate will always be requested even if the current certificate is technically valid.
	// If there is already an Entrust certificate at this location, whether it is replaced is depends on the I(remaining_days) calculation.
	// If an existing certificate is being replaced (see I(remaining_days), I(force), and I(tracking_id)), whether a new certificate is requested or the existing certificate is renewed or reissued is based on I(request_type).

	path: string

	// The number of days the certificate must have left being valid. If C(cert_days < remaining_days) then a new certificate will be obtained using I(request_type).
	// If C(request_type=renew), a renewal will fail if the certificate being renewed has been issued within the past 30 days, so do not set a I(remaining_days) value that is within 30 days of the full lifetime of the certificate being acted upon. (e.g. if you are requesting Certificates with a 90 day lifetime, do not set remaining_days to a value C(60) or higher).
	// The I(force) option may be used to ensure that a new certificate is always obtained.

	remaining_days?: int

	// The operation performed if I(tracking_id) references a valid certificate to reissue, or there is already a certificate present in I(path) but either I(force) is specified or C(cert_days < remaining_days).
	// Specifying C(request_type=validate_only) means the request will be validated against the ECS API, but no certificate will be issued.
	// Specifying C(request_type=new) means a certificate request will always be submitted and a new certificate issued.
	// Specifying C(request_type=renew) means that an existing certificate (specified by I(tracking_id) if present, otherwise I(path)) will be renewed. If there is no certificate to renew, a new certificate is requested.
	// Specifying C(request_type=reissue) means that an existing certificate (specified by I(tracking_id) if present, otherwise I(path)) will be reissued. If there is no certificate to reissue, a new certificate is requested.
	// If a certificate was issued within the past 30 days, the 'renew' operation is not a valid operation and will fail.
	// Note that C(reissue) is an operation that will result in the revocation of the certificate that is reissued, be cautious with it's use.
	// I(check_mode) is only supported if C(request_type=new)
	// For example, setting C(request_type=renew) and C(remaining_days=30) and pointing to the same certificate on multiple playbook runs means that on the first run new certificate will be requested. It will then be left along on future runs until it is within 30 days of expiry, then the ECS "renew" operation will be performed.

	request_type?: string

	// The requester phone number to associate with certificate tracking information.

	requester_phone: string

	// The subject alternative name identifiers, as an array of values (applies to I(cert_type) with a value of C(STANDARD_SSL), C(ADVANTAGE_SSL), C(UC_SSL), C(EV_SSL), C(WILDCARD_SSL), C(PRIVATE_SSL), and C(PD_SSL)).
	// If you are requesting a new SSL certificate, and you pass a I(subject_alt_name) parameter, any SAN names in the CSR are ignored. If no subjectAltName parameter is passed, the SAN names in the CSR are used.
	// See I(request_type) to understand more about SANs during reissues and renewals.
	// In the case of certificates of type C(STANDARD_SSL) certificates, if the CN of the certificate is <domain>.<tld> only the www.<domain>.<tld> value is accepted. If the CN of the certificate is www.<domain>.<tld> only the <domain>.<tld> value is accepted.

	subject_alt_name?: [...string]

	// The tracking ID of the certificate to reissue or renew.
	// I(tracking_id) is invalid if C(request_type=new) or C(request_type=validate_only).
	// If there is a certificate present in I(path) and it is an ECS certificate, I(tracking_id) will be ignored.
	// If there is no certificate present in I(path) or there is but it is from another provider, the certificate represented by I(tracking_id) will be renewed or reissued and saved to I(path).
	// If there is no certificate present in I(path) and the I(force) and I(remaining_days) parameters do not indicate a new certificate is needed, the certificate referenced by I(tracking_id) certificate will be saved to I(path).
	// This can be used when a known certificate is not currently present on a server, but you want to renew or reissue it to be managed by an ansible playbook. For example, if you specify C(request_type=renew), I(tracking_id) of an issued certificate, and I(path) to a file that does not exist, the first run of a task will download the certificate specified by I(tracking_id) (assuming it is still valid). Future runs of the task will (if applicable - see I(force) and I(remaining_days)) renew the certificate now present in I(path).

	tracking_id?: int

	// A list of additional email addresses to receive the delivery notice and expiry notification for the certificate.

	additional_emails?: [...string]

	// In compliance with browser requirements, this certificate may be posted to the Certificate Transparency (CT) logs. This is a best practice technique that helps domain owners monitor certificates issued to their domains. Note that not all certificates are eligible for CT logging.
	// If I(ct_log) is not specified, the certificate uses the account default.
	// If I(ct_log) is specified and the account settings allow it, I(ct_log) overrides the account default.
	// If I(ct_log) is set to C(false), but the account settings are set to "always log", the certificate generation will fail.

	ct_log?: bool

	// If force is used, a certificate is requested regardless of whether I(path) points to an existing valid certificate.
	// If C(request_type=renew), a forced renew will fail if the certificate being renewed has been issued within the past 30 days, regardless of the value of I(remaining_days) or the return value of I(cert_days) - the ECS API does not support the "renew" operation for certificates that are not at least 30 days old.

	force?: bool

	// Organizational unit "OU=" to include in the certificate.
	// I(ou) behavior is dependent on whether organizational units are enabled for your account. If organizational unit support is disabled for your account, organizational units from the I(csr) and the I(ou) parameter are ignored.
	// If both I(csr) and I(ou) are specified, the value in I(ou) will override the OU fields present in the subject distinguished name in the I(csr)
	// If neither I(csr) nor I(ou) are specified for a renew or reissue operation, the OU fields in the initial certificate are reused.
	// An invalid OU from I(csr) is ignored, but any invalid organizational units in I(ou) will result in an error indicating "Unapproved OU". The I(ou) parameter can be used to force failure if an unapproved organizational unit is provided.
	// A maximum of one OU may be specified for current products. Multiple OUs are reserved for future products.

	ou?: [...string]

	// The requester name to associate with certificate tracking information.

	requester_name: string
}

openssh_cert :: {

	// Certificates may be limited to be valid for a set of principal (user/host) names. By default, generated certificates are valid for all users or hosts.

	principals?: [...string]

	// Specify the certificate serial number. The serial number is logged by the server when the certificate is used for authentication. The certificate serial number may be used in a KeyRevocationList. The serial number may be omitted for checks, but must be specified again for a new certificate. Note: The default value set by ssh-keygen is 0.

	serial_number?: int

	// The path to the private openssh key that is used for signing the public key in order to generate the certificate.

	signing_key: string

	// Whether the host or user certificate should exist or not, taking action if the state is different from what is stated.

	state?: string

	// Whether the module should generate a host or a user certificate.

	type: string

	// Should the certificate be regenerated even if it already exists and is valid.

	force?: bool

	// Specify the key identity when signing a public key. The identifier that is logged by the server when the certificate is used for authentication.

	identifier?: string

	// Specify certificate options when signing a key. The option that are valid for user certificates are:
	// C(clear): Clear all enabled permissions.  This is useful for clearing the default set of permissions so permissions may be added individually.
	// C(force-command=command): Forces the execution of command instead of any shell or command specified by the user when the certificate is used for authentication.
	// C(no-agent-forwarding): Disable ssh-agent forwarding (permitted by default).
	// C(no-port-forwarding): Disable port forwarding (permitted by default).
	// C(no-pty Disable): PTY allocation (permitted by default).
	// C(no-user-rc): Disable execution of C(~/.ssh/rc) by sshd (permitted by default).
	// C(no-x11-forwarding): Disable X11 forwarding (permitted by default)
	// C(permit-agent-forwarding): Allows ssh-agent forwarding.
	// C(permit-port-forwarding): Allows port forwarding.
	// C(permit-pty): Allows PTY allocation.
	// C(permit-user-rc): Allows execution of C(~/.ssh/rc) by sshd.
	// C(permit-x11-forwarding): Allows X11 forwarding.
	// C(source-address=address_list): Restrict the source addresses from which the certificate is considered valid. The C(address_list) is a comma-separated list of one or more address/netmask pairs in CIDR format.
	// At present, no options are valid for host keys.

	options?: [...string]

	// Check if the certificate is valid at a certain point in time. If it is not the certificate will be regenerated. Time will always be interpreted as UTC. Mainly to be used with relative timespec for I(valid_from) and / or I(valid_to). Note that if using relative time this module is NOT idempotent.

	valid_at?: string

	// The point in time the certificate is valid from. Time can be specified either as relative time or as absolute timestamp. Time will always be interpreted as UTC. Valid formats are: C([+-]timespec | YYYY-MM-DD | YYYY-MM-DDTHH:MM:SS | YYYY-MM-DD HH:MM:SS | always) where timespec can be an integer + C([w | d | h | m | s]) (e.g. C(+32w1d2h). Note that if using relative time this module is NOT idempotent.

	valid_from: string

	// Path of the file containing the certificate.

	path: string

	// The path to the public key that will be signed with the signing key in order to generate the certificate.

	public_key: string

	// The point in time the certificate is valid to. Time can be specified either as relative time or as absolute timestamp. Time will always be interpreted as UTC. Valid formats are: C([+-]timespec | YYYY-MM-DD | YYYY-MM-DDTHH:MM:SS | YYYY-MM-DD HH:MM:SS | forever) where timespec can be an integer + C([w | d | h | m | s]) (e.g. C(+32w1d2h). Note that if using relative time this module is NOT idempotent.

	valid_to: string
}

openssl_pkcs12 :: {

	// Number of times to repeat the MAC step.

	maciter_size?: int

	// Passphrase source to decrypt any input private keys with.

	privatekey_passphrase?: string

	// The path to read certificates and private keys from.
	// Must be in PEM format.

	certificate_path?: string

	// List of other certificates to include. Pre 2.8 this parameter was called C(ca_certificates)

	other_certificates?: [...string]

	// File to read private key from.

	privatekey_path?: string

	// C(export) or C(parse) a PKCS#12.

	action?: string

	// Number of times to repeat the encryption step.

	iter_size?: int

	// The PKCS#12 password.

	passphrase?: string

	// Filename to write the PKCS#12 file to.

	path: string

	// Create a backup file including a timestamp so you can get the original output file back if you overwrote it with a new one by accident.

	backup?: bool

	// Specifies the friendly name for the certificate and private key.

	friendly_name?: string

	// PKCS#12 file path to parse.

	src?: string

	// Whether the file should exist or not. All parameters except C(path) are ignored when state is C(absent).

	state?: string

	// Should the file be regenerated even if it already exists.

	force?: bool
}

ecs_domain :: {

	// The verification method to be used to prove control of the domain.
	// If C(verification_method=email) and the value I(verification_email) is specified, that value is used for the email validation. If I(verification_email) is not provided, the first value present in WHOIS data will be used. An email will be sent to the address in I(verification_email) with instructions on how to verify control of the domain.
	// If C(verification_method=dns), the value I(dns_contents) must be stored in location I(dns_location), with a DNS record type of I(verification_dns_record_type). To prove domain ownership, update your DNS records so the text string returned by I(dns_contents) is available at I(dns_location).
	// If C(verification_method=web_server), the contents of return value I(file_contents) must be made available on a web server accessible at location I(file_location).
	// If C(verification_method=manual), the domain will be validated with a manual process. This is not recommended.

	verification_method: string

	// The client ID to request the domain be associated with.
	// If no client ID is specified, the domain will be added under the primary client with ID of 1.

	client_id?: int

	// The domain name to be verified or reverified.

	domain_name: string

	// Email address to be used to verify domain ownership.
	// Email address must be either an email address present in the WHOIS data for I(domain_name), or one of the following constructed emails: admin@I(domain_name), administrator@I(domain_name), webmaster@I(domain_name), hostmaster@I(domain_name), postmaster@I(domain_name)
	// Note that if I(domain_name) includes subdomains, the top level domain should be used. For example, if requesting validation of example1.ansible.com, or test.example2.ansible.com, and you want to use the "admin" preconstructed name, the email address should be admin@ansible.com.
	// If using the email values from the WHOIS data for the domain or it's top level namespace, they must be exact matches.
	// If C(verification_method=email) but I(verification_email) is not provided, the first email address found in WHOIS data for the domain will be used.
	// To verify domain ownership, domain owner must follow the instructions in the email they receive.
	// Only allowed if C(verification_method=email)

	verification_email?: string
}

openssh_keypair :: {

	// Provides a new comment to the public key. When checking if the key is in the correct state this will be ignored.

	comment?: string

	// Should the key be regenerated even if it already exists

	force?: bool

	// Name of the files containing the public and private key. The file containing the public key will have the extension C(.pub).

	path: string

	// Specifies the number of bits in the private key to create. For RSA keys, the minimum size is 1024 bits and the default is 4096 bits. Generally, 2048 bits is considered sufficient.  DSA keys must be exactly 1024 bits as specified by FIPS 186-2. For ECDSA keys, size determines the key length by selecting from one of three elliptic curve sizes: 256, 384 or 521 bits. Attempting to use bit lengths other than these three values for ECDSA keys will cause this module to fail. Ed25519 keys have a fixed length and the size will be ignored.

	size?: int

	// Whether the private and public keys should exist or not, taking action if the state is different from what is stated.

	state?: string

	// The algorithm used to generate the SSH private key. C(rsa1) is for protocol version 1. C(rsa1) is deprecated and may not be supported by every version of ssh-keygen.

	type?: string
}

openssl_certificate_info :: {

	// Remote absolute path where the certificate file is loaded from.

	path: string

	// Determines which crypto backend to use.
	// The default choice is C(auto), which tries to use C(cryptography) if available, and falls back to C(pyopenssl).
	// If set to C(pyopenssl), will try to use the L(pyOpenSSL,https://pypi.org/project/pyOpenSSL/) library.
	// If set to C(cryptography), will try to use the L(cryptography,https://cryptography.io/) library.
	// Please note that the C(pyopenssl) backend has been deprecated in Ansible 2.9, and will be removed in Ansible 2.13. From that point on, only the C(cryptography) backend will be available.

	select_crypto_backend?: string

	// A dict of names mapping to time specifications. Every time specified here will be checked whether the certificate is valid at this point. See the C(valid_at) return value for informations on the result.
	// Time can be specified either as relative time or as absolute timestamp.
	// Time will always be interpreted as UTC.
	// Valid format is C([+-]timespec | ASN.1 TIME) where timespec can be an integer + C([w | d | h | m | s]) (e.g. C(+32w1d2h), and ASN.1 TIME (i.e. pattern C(YYYYMMDDHHMMSSZ)). Note that all timestamps will be treated as being in UTC.

	valid_at?: {...}
}

openssl_privatekey_info :: {

	// The passphrase for the private key.

	passphrase?: string

	// Remote absolute path where the private key file is loaded from.

	path: string

	// Whether to return private key data.
	// Only set this to C(yes) when you want private information about this key to leave the remote machine.
	// WARNING: you have to make sure that private key data isn't accidentally logged!

	return_private_key_data?: bool

	// Determines which crypto backend to use.
	// The default choice is C(auto), which tries to use C(cryptography) if available, and falls back to C(pyopenssl).
	// If set to C(pyopenssl), will try to use the L(pyOpenSSL,https://pypi.org/project/pyOpenSSL/) library.
	// If set to C(cryptography), will try to use the L(cryptography,https://cryptography.io/) library.
	// Please note that the C(pyopenssl) backend has been deprecated in Ansible 2.9, and will be removed in Ansible 2.13. From that point on, only the C(cryptography) backend will be available.

	select_crypto_backend?: string
}

get_certificate :: {

	// The port to connect to

	port: int

	// Proxy host used when get a certificate.

	proxy_host?: string

	// Proxy port used when get a certificate.

	proxy_port?: int

	// Determines which crypto backend to use.
	// The default choice is C(auto), which tries to use C(cryptography) if available, and falls back to C(pyopenssl).
	// If set to C(pyopenssl), will try to use the L(pyOpenSSL,https://pypi.org/project/pyOpenSSL/) library.
	// If set to C(cryptography), will try to use the L(cryptography,https://cryptography.io/) library.

	select_crypto_backend?: string

	// The timeout in seconds

	timeout?: int

	// A PEM file containing one or more root certificates; if present, the cert will be validated against these root certs.
	// Note that this only validates the certificate is signed by the chain; not that the cert is valid for the host presenting it.

	ca_cert?: string

	// The host to get the cert for (IP is fine)

	host: string
}

luks_device :: {

	// Removes given key from the container on I(device). Does not remove the keyfile from filesystem. Parameter value is the path to the keyfile with the passphrase.
	// NOTE that removing keys is I(not idempotent). Trying to remove a key which no longer exists results in an error.
	// NOTE that to remove the last key from a LUKS container, the I(force_remove_last_key) option must be set to C(yes).
	// BEWARE that working with keyfiles in plaintext is dangerous. Make sure that they are protected.

	remove_keyfile?: string

	// Desired state of the LUKS container. Based on its value creates, destroys, opens or closes the LUKS container on a given device.
	// I(present) will create LUKS container unless already present. Requires I(device) and I(keyfile) options to be provided.
	// I(absent) will remove existing LUKS container if it exists. Requires I(device) or I(name) to be specified.
	// I(opened) will unlock the LUKS container. If it does not exist it will be created first. Requires I(device) and I(keyfile) to be specified. Use the I(name) option to set the name of the opened container. Otherwise the name will be generated automatically and returned as a part of the result.
	// I(closed) will lock the LUKS container. However if the container does not exist it will be created. Requires I(device) and I(keyfile) options to be provided. If container does already exist I(device) or I(name) will suffice.

	state?: string

	// With this option user can identify the LUKS container by UUID.
	// Will only be used when I(device) and I(label) are not specified.

	uuid?: string

	// Device to work with (e.g. C(/dev/sda1)). Needed in most cases. Can be omitted only when I(state=closed) together with I(name) is provided.

	device?: string

	// If set to C(yes), allows removing the last key from a container.
	// BEWARE that when the last key has been removed from a container, the container can no longer be opened!

	force_remove_last_key?: bool

	// Used to unlock the container and needed for most of the operations. Parameter value is the path to the keyfile with the passphrase.
	// BEWARE that working with keyfiles in plaintext is dangerous. Make sure that they are protected.

	keyfile?: string

	// This option allow the user to create a LUKS2 format container with label support, respectively to identify the container by label on later usages.
	// Will only be used on container creation, or when I(device) is not specified.
	// This cannot be specified if I(type) is set to C(luks1).

	label?: string

	// Sets the key size only if LUKS container does not exist.

	keysize?: int

	// Sets container name when I(state=opened). Can be used instead of I(device) when closing the existing container (i.e. when I(state=closed)).

	name?: string

	// Adds additional key to given container on I(device). Needs I(keyfile) option for authorization. LUKS container supports up to 8 keys. Parameter value is the path to the keyfile with the passphrase.
	// NOTE that adding additional keys is I(not idempotent). A new keyslot will be used even if another keyslot already exists for this keyfile.
	// BEWARE that working with keyfiles in plaintext is dangerous. Make sure that they are protected.

	new_keyfile?: string

	// This option allow the user explicit define the format of LUKS container that wants to work with. Options are C(luks1) or C(luks2)

	type?: string
}
