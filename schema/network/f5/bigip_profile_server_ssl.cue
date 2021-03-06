package ansible

module: bigip_profile_server_ssl: {
	module:            "bigip_profile_server_ssl"
	short_description: "Manages server SSL profiles on a BIG-IP"
	description: [
		"Manages server SSL profiles on a BIG-IP.",
	]
	version_added: 2.8
	options: {
		name: {
			description: [
				"Specifies the name of the profile.",
			]
			type:     "str"
			required: true
		}
		parent: {
			description: [
				"The parent template of this monitor template. Once this value has been set, it cannot be changed.",
			]

			type:    "str"
			default: "/Common/serverssl"
		}
		ciphers: {
			description: [
				"Specifies the list of ciphers that the system supports. When creating a new profile, the default cipher list is provided by the parent profile.",
			]

			type: "str"
		}
		secure_renegotiation: {
			description: [
				"Specifies the method of secure renegotiations for SSL connections. When creating a new profile, the setting is provided by the parent profile.",
				"When C(request) is set the system request secure renegotation of SSL connections.",
				"C(require) is a default setting and when set the system permits initial SSL handshakes from clients but terminates renegotiations from unpatched clients.",
				"The C(require-strict) setting the system requires strict renegotiation of SSL connections. In this mode the system refuses connections to insecure servers, and terminates existing SSL connections to insecure servers.",
			]

			type: "str"
			choices: [
				"require",
				"require-strict",
				"request",
			]
		}
		server_name: {
			description: [
				"Specifies the fully qualified DNS hostname of the server used in Server Name Indication communications. When creating a new profile, the setting is provided by the parent profile.",
			]

			type: "str"
		}
		sni_default: {
			description: [
				"Indicates that the system uses this profile as the default SSL profile when there is no match to the server name, or when the client provides no SNI extension support.",
				"When creating a new profile, the setting is provided by the parent profile.",
				"There can be only one SSL profile with this setting enabled.",
			]
			type: "bool"
		}
		sni_require: {
			description: [
				"Requires that the network peers also provide SNI support, setting only takes effect when C(sni_default) is C(yes).",
				"When creating a new profile, the setting is provided by the parent profile.",
			]
			type: "bool"
		}
		server_certificate: {
			description: [
				"Specifies the way the system handles server certificates.",
				"When C(ignore), specifies that the system ignores certificates from server systems.",
				"When C(require), specifies that the system requires a server to present a valid certificate.",
			]

			type: "str"
			choices: [
				"ignore",
				"require",
			]
		}
		certificate: {
			description: [
				"Specifies the name of the certificate that the system uses for server-side SSL processing.",
			]

			type: "str"
		}
		key: {
			description: [
				"Specifies the file name of the SSL key.",
			]
			type: "str"
		}
		chain: {
			description: [
				"Specifies the certificates-key chain to associate with the SSL profile.",
			]
			type: "str"
		}
		passphrase: {
			description: [
				"Specifies a passphrase used to encrypt the key.",
			]
			type: "str"
		}
		update_password: {
			description: [
				"C(always) will allow to update passwords if the user chooses to do so. C(on_create) will only set the password for newly created profiles.",
			]

			type: "str"
			choices: [
				"always",
				"on_create",
			]
			default: "always"
		}
		ocsp_profile: {
			description: [
				"Specifies the name of the OCSP profile for purpose of validating status of server certificate.",
			]

			type: "str"
		}
		partition: {
			description: [
				"Device partition to manage resources on.",
			]
			type:    "str"
			default: "Common"
		}
		state: {
			description: [
				"When C(present), ensures that the profile exists.",
				"When C(absent), ensures the profile is removed.",
			]
			type: "str"
			choices: [
				"present",
				"absent",
			]
			default: "present"
		}
	}
	extends_documentation_fragment: "f5"
	author: ["Tim Rupp (@caphrim007)"]
}
