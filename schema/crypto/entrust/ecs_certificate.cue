package ansible

module: ecs_certificate: {
	module: "ecs_certificate"
	author: [
		"Chris Trufan (@ctrufan)",
	]
	version_added:     "2.9"
	short_description: "Request SSL/TLS certificates with the Entrust Certificate Services (ECS) API"
	description: [
		"Create, reissue, and renew certificates with the Entrust Certificate Services (ECS) API.",
		"Requires credentials for the L(Entrust Certificate Services,https://www.entrustdatacard.com/products/categories/ssl-certificates) (ECS) API.",
		"In order to request a certificate, the domain and organization used in the certificate signing request must be already validated in the ECS system. It is I(not) the responsibility of this module to perform those steps.",
	]

	notes: [
		"C(path) must be specified as the output location of the certificate.",
	]
	requirements: [
		"cryptography >= 1.6",
	]
	options: {
		backup: {
			description: [
				"Whether a backup should be made for the certificate in I(path).",
			]
			type:    "bool"
			default: false
		}
		force: {
			description: [
				"If force is used, a certificate is requested regardless of whether I(path) points to an existing valid certificate.",
				"If C(request_type=renew), a forced renew will fail if the certificate being renewed has been issued within the past 30 days, regardless of the value of I(remaining_days) or the return value of I(cert_days) - the ECS API does not support the \"renew\" operation for certificates that are not at least 30 days old.",
			]

			type:    "bool"
			default: false
		}
		path: {
			description: [
				"The destination path for the generated certificate as a PEM encoded cert.",
				"If the certificate at this location is not an Entrust issued certificate, a new certificate will always be requested even if the current certificate is technically valid.",
				"If there is already an Entrust certificate at this location, whether it is replaced is depends on the I(remaining_days) calculation.",
				"If an existing certificate is being replaced (see I(remaining_days), I(force), and I(tracking_id)), whether a new certificate is requested or the existing certificate is renewed or reissued is based on I(request_type).",
			]

			type:     "path"
			required: true
		}
		full_chain_path: {
			description: [
				"The destination path for the full certificate chain of the certificate, intermediates, and roots.",
			]
			type: "path"
		}
		csr: {
			description: [
				"Base-64 encoded Certificate Signing Request (CSR). I(csr) is accepted with or without PEM formatting around the Base-64 string.",
				"If no I(csr) is provided when C(request_type=reissue) or C(request_type=renew), the certificate will be generated with the same public key as the certificate being renewed or reissued.",
				"If I(subject_alt_name) is specified, it will override the subject alternate names in the CSR.",
				"If I(eku) is specified, it will override the extended key usage in the CSR.",
				"If I(ou) is specified, it will override the organizational units \"ou=\" present in the subject distinguished name of the CSR, if any.",
				"The organization \"O=\" field from the CSR will not be used. It will be replaced in the issued certificate by I(org) if present, and if not present, the organization tied to I(client_id).",
			]

			type: "str"
		}
		tracking_id: {
			description: [
				"The tracking ID of the certificate to reissue or renew.",
				"I(tracking_id) is invalid if C(request_type=new) or C(request_type=validate_only).",
				"If there is a certificate present in I(path) and it is an ECS certificate, I(tracking_id) will be ignored.",
				"If there is no certificate present in I(path) or there is but it is from another provider, the certificate represented by I(tracking_id) will be renewed or reissued and saved to I(path).",
				"If there is no certificate present in I(path) and the I(force) and I(remaining_days) parameters do not indicate a new certificate is needed, the certificate referenced by I(tracking_id) certificate will be saved to I(path).",
				"This can be used when a known certificate is not currently present on a server, but you want to renew or reissue it to be managed by an ansible playbook. For example, if you specify C(request_type=renew), I(tracking_id) of an issued certificate, and I(path) to a file that does not exist, the first run of a task will download the certificate specified by I(tracking_id) (assuming it is still valid). Future runs of the task will (if applicable - see I(force) and I(remaining_days)) renew the certificate now present in I(path).",
			]

			type: "int"
		}
		remaining_days: {
			description: [
				"The number of days the certificate must have left being valid. If C(cert_days < remaining_days) then a new certificate will be obtained using I(request_type).",
				"If C(request_type=renew), a renewal will fail if the certificate being renewed has been issued within the past 30 days, so do not set a I(remaining_days) value that is within 30 days of the full lifetime of the certificate being acted upon. (e.g. if you are requesting Certificates with a 90 day lifetime, do not set remaining_days to a value C(60) or higher).",
				"The I(force) option may be used to ensure that a new certificate is always obtained.",
			]
			type:    "int"
			default: 30
		}
		request_type: {
			description: [
				"The operation performed if I(tracking_id) references a valid certificate to reissue, or there is already a certificate present in I(path) but either I(force) is specified or C(cert_days < remaining_days).",
				"Specifying C(request_type=validate_only) means the request will be validated against the ECS API, but no certificate will be issued.",
				"Specifying C(request_type=new) means a certificate request will always be submitted and a new certificate issued.",
				"Specifying C(request_type=renew) means that an existing certificate (specified by I(tracking_id) if present, otherwise I(path)) will be renewed. If there is no certificate to renew, a new certificate is requested.",
				"Specifying C(request_type=reissue) means that an existing certificate (specified by I(tracking_id) if present, otherwise I(path)) will be reissued. If there is no certificate to reissue, a new certificate is requested.",
				"If a certificate was issued within the past 30 days, the 'renew' operation is not a valid operation and will fail.",
				"Note that C(reissue) is an operation that will result in the revocation of the certificate that is reissued, be cautious with it's use.",
				"I(check_mode) is only supported if C(request_type=new)",
				"For example, setting C(request_type=renew) and C(remaining_days=30) and pointing to the same certificate on multiple playbook runs means that on the first run new certificate will be requested. It will then be left along on future runs until it is within 30 days of expiry, then the ECS \"renew\" operation will be performed.",
			]

			type: "str"
			choices: ["new", "renew", "reissue", "validate_only"]
			default: "new"
		}
		cert_type: {
			description: [
				"Specify the type of certificate requested.",
				"If a certificate is being reissued or renewed, this parameter is ignored, and the C(cert_type) of the initial certificate is used.",
			]
			type: "str"
			choices: [
				"STANDARD_SSL",
				"ADVANTAGE_SSL",
				"UC_SSL",
				"EV_SSL",
				"WILDCARD_SSL",
				"PRIVATE_SSL",
				"PD_SSL",
				"CODE_SIGNING",
				"EV_CODE_SIGNING",
				"CDS_INDIVIDUAL",
				"CDS_GROUP",
				"CDS_ENT_LITE",
				"CDS_ENT_PRO",
				"SMIME_ENT",
			]
		}
		subject_alt_name: {
			description: [
				"The subject alternative name identifiers, as an array of values (applies to I(cert_type) with a value of C(STANDARD_SSL), C(ADVANTAGE_SSL), C(UC_SSL), C(EV_SSL), C(WILDCARD_SSL), C(PRIVATE_SSL), and C(PD_SSL)).",
				"If you are requesting a new SSL certificate, and you pass a I(subject_alt_name) parameter, any SAN names in the CSR are ignored. If no subjectAltName parameter is passed, the SAN names in the CSR are used.",
				"See I(request_type) to understand more about SANs during reissues and renewals.",
				"In the case of certificates of type C(STANDARD_SSL) certificates, if the CN of the certificate is <domain>.<tld> only the www.<domain>.<tld> value is accepted. If the CN of the certificate is www.<domain>.<tld> only the <domain>.<tld> value is accepted.",
			]

			type:     "list"
			elements: "str"
		}
		eku: {
			description: [
				"If specified, overrides the key usage in the I(csr).",
			]
			type: "str"
			choices: ["SERVER_AUTH", "CLIENT_AUTH", "SERVER_AND_CLIENT_AUTH"]
		}
		ct_log: {
			description: [
				"In compliance with browser requirements, this certificate may be posted to the Certificate Transparency (CT) logs. This is a best practice technique that helps domain owners monitor certificates issued to their domains. Note that not all certificates are eligible for CT logging.",
				"If I(ct_log) is not specified, the certificate uses the account default.",
				"If I(ct_log) is specified and the account settings allow it, I(ct_log) overrides the account default.",
				"If I(ct_log) is set to C(false), but the account settings are set to \"always log\", the certificate generation will fail.",
			]
			type: "bool"
		}
		client_id: {
			description: [
				"The client ID to submit the Certificate Signing Request under.",
				"If no client ID is specified, the certificate will be submitted under the primary client with ID of 1.",
				"When using a client other than the primary client, the I(org) parameter cannot be specified.",
				"The issued certificate will have an organization value in the subject distinguished name represented by the client.",
			]
			type:    "int"
			default: 1
		}
		org: {
			description: [
				"Organization \"O=\" to include in the certificate.",
				"If I(org) is not specified, the organization from the client represented by I(client_id) is used.",
				"Unless the I(cert_type) is C(PD_SSL), this field may not be specified if the value of I(client_id) is not \"1\" (the primary client). non-primary clients, certificates may only be issued with the organization of that client.",
			]

			type: "str"
		}
		ou: {
			description: [
				"Organizational unit \"OU=\" to include in the certificate.",
				"I(ou) behavior is dependent on whether organizational units are enabled for your account. If organizational unit support is disabled for your account, organizational units from the I(csr) and the I(ou) parameter are ignored.",
				"If both I(csr) and I(ou) are specified, the value in I(ou) will override the OU fields present in the subject distinguished name in the I(csr)",
				"If neither I(csr) nor I(ou) are specified for a renew or reissue operation, the OU fields in the initial certificate are reused.",
				"An invalid OU from I(csr) is ignored, but any invalid organizational units in I(ou) will result in an error indicating \"Unapproved OU\". The I(ou) parameter can be used to force failure if an unapproved organizational unit is provided.",
				"A maximum of one OU may be specified for current products. Multiple OUs are reserved for future products.",
			]
			type:     "list"
			elements: "str"
		}
		end_user_key_storage_agreement: {
			description: [
				"The end user of the Code Signing certificate must generate and store the private key for this request on cryptographically secure hardware to be compliant with the Entrust CSP and Subscription agreement. If requesting a certificate of type C(CODE_SIGNING) or C(EV_CODE_SIGNING), you must set I(end_user_key_storage_agreement) to true if and only if you acknowledge that you will inform the user of this requirement.",
				"Applicable only to I(cert_type) of values C(CODE_SIGNING) and C(EV_CODE_SIGNING).",
			]
			type: "bool"
		}
		tracking_info: {
			description: "Free form tracking information to attach to the record for the certificate."
			type:        "str"
		}
		requester_name: {
			description: "The requester name to associate with certificate tracking information."
			type:        "str"
			required:    true
		}
		requester_email: {
			description: "The requester email to associate with certificate tracking information and receive delivery and expiry notices for the certificate."
			type:        "str"
			required:    true
		}
		requester_phone: {
			description: "The requester phone number to associate with certificate tracking information."
			type:        "str"
			required:    true
		}
		additional_emails: {
			description: "A list of additional email addresses to receive the delivery notice and expiry notification for the certificate."
			type:        "list"
			elements:    "str"
		}
		custom_fields: {
			description: [
				"Mapping of custom fields to associate with the certificate request and certificate.",
				"Only supported if custom fields are enabled for your account.",
				"Each custom field specified must be a custom field you have defined for your account.",
			]
			type: "dict"
			suboptions: {
				text1: {
					description: "Custom text field (maximum 500 characters)"
					type:        "str"
				}
				text2: {
					description: "Custom text field (maximum 500 characters)"
					type:        "str"
				}
				text3: {
					description: "Custom text field (maximum 500 characters)"
					type:        "str"
				}
				text4: {
					description: "Custom text field (maximum 500 characters)"
					type:        "str"
				}
				text5: {
					description: "Custom text field (maximum 500 characters)"
					type:        "str"
				}
				text6: {
					description: "Custom text field (maximum 500 characters)"
					type:        "str"
				}
				text7: {
					description: "Custom text field (maximum 500 characters)"
					type:        "str"
				}
				text8: {
					description: "Custom text field (maximum 500 characters)"
					type:        "str"
				}
				text9: {
					description: "Custom text field (maximum 500 characters)"
					type:        "str"
				}
				text10: {
					description: "Custom text field (maximum 500 characters)"
					type:        "str"
				}
				text11: {
					description: "Custom text field (maximum 500 characters)"
					type:        "str"
				}
				text12: {
					description: "Custom text field (maximum 500 characters)"
					type:        "str"
				}
				text13: {
					description: "Custom text field (maximum 500 characters)"
					type:        "str"
				}
				text14: {
					description: "Custom text field (maximum 500 characters)"
					type:        "str"
				}
				text15: {
					description: "Custom text field (maximum 500 characters)"
					type:        "str"
				}
				number1: {
					description: "Custom number field."
					type:        "float"
				}
				number2: {
					description: "Custom number field."
					type:        "float"
				}
				number3: {
					description: "Custom number field."
					type:        "float"
				}
				number4: {
					description: "Custom number field."
					type:        "float"
				}
				number5: {
					description: "Custom number field."
					type:        "float"
				}
				date1: {
					description: "Custom date field."
					type:        "str"
				}
				date2: {
					description: "Custom date field."
					type:        "str"
				}
				date3: {
					description: "Custom date field."
					type:        "str"
				}
				date4: {
					description: "Custom date field."
					type:        "str"
				}
				date5: {
					description: "Custom date field."
					type:        "str"
				}
				email1: {
					description: "Custom email field."
					type:        "str"
				}
				email2: {
					description: "Custom email field."
					type:        "str"
				}
				email3: {
					description: "Custom email field."
					type:        "str"
				}
				email4: {
					description: "Custom email field."
					type:        "str"
				}
				email5: {
					description: "Custom email field."
					type:        "str"
				}
				dropdown1: {
					description: "Custom dropdown field."
					type:        "str"
				}
				dropdown2: {
					description: "Custom dropdown field."
					type:        "str"
				}
				dropdown3: {
					description: "Custom dropdown field."
					type:        "str"
				}
				dropdown4: {
					description: "Custom dropdown field."
					type:        "str"
				}
				dropdown5: {
					description: "Custom dropdown field."
					type:        "str"
				}
			}
		}
		cert_expiry: {
			description: [
				"The date the certificate should be set to expire, in RFC3339 compliant date or date-time format. For example, C(2020-02-23), C(2020-02-23T15:00:00.05Z).",
				"I(cert_expiry) is only supported for requests of C(request_type=new) or C(request_type=renew). If C(request_type=reissue), I(cert_expiry) will be used for the first certificate issuance, but subsequent issuances will have the same expiry as the initial certificate.",
				"A reissued certificate will always have the same expiry as the original certificate.",
				"Note that only the date (day, month, year) is supported for specifying the expiry date. If you choose to specify an expiry time with the expiry date, the time will be adjusted to Eastern Standard Time (EST). This could have the unintended effect of moving your expiry date to the previous day.",
				"Applies only to accounts with a pooling inventory model.",
				"Only one of I(cert_expiry) or I(cert_lifetime) may be specified.",
			]
			type: "str"
		}
		cert_lifetime: {
			description: [
				"The lifetime of the certificate.",
				"Applies to all certificates for accounts with a non-pooling inventory model.",
				"I(cert_lifetime) is only supported for requests of C(request_type=new) or C(request_type=renew). If C(request_type=reissue), I(cert_lifetime) will be used for the first certificate issuance, but subsequent issuances will have the same expiry as the initial certificate.",
				"Applies to certificates of I(cert_type)=C(CDS_INDIVIDUAL, CDS_GROUP, CDS_ENT_LITE, CDS_ENT_PRO, SMIME_ENT) for accounts with a pooling inventory model.",
				"C(P1Y) is a certificate with a 1 year lifetime.",
				"C(P2Y) is a certificate with a 2 year lifetime.",
				"C(P3Y) is a certificate with a 3 year lifetime.",
				"Only one of I(cert_expiry) or I(cert_lifetime) may be specified.",
			]
			type: "str"
			choices: ["P1Y", "P2Y", "P3Y"]
		}
	}
	seealso: [{
		module:      "openssl_privatekey"
		description: "Can be used to create private keys (both for certificates and accounts)."
	}, {
		module:      "openssl_csr"
		description: "Can be used to create a Certificate Signing Request (CSR)."
	}]
	extends_documentation_fragment: ["ecs_credential"]
}
