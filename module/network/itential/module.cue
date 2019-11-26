package itential

iap_start_workflow :: {

	// Provide the port number for the Itential Automation Platform

	iap_port: string

	// Token key generated by iap_token module for the Itential Automation Platform

	token_key: string

	// If C(no), SSL certificates for the target url will not be validated. This should only be used on personally controlled sites using self-signed certificates.

	validate_certs?: bool

	// Provide the values to the job variables

	variables: {...}

	// Provide the workflow name

	workflow_name: string

	// Provide the description for the workflow

	description: string

	// Use HTTPS to connect
	// By default using http

	https?: bool

	// Provide the fqdn for the Itential Automation Platform

	iap_fqdn: string
}

iap_token :: {

	// Provide the password for the Itential Automation Platform

	password: string

	// Provide the username for the Itential Automation Platform

	username: string

	// If C(no), SSL certificates for the target url will not be validated. This should only be used on personally controlled sites using self-signed certificates.

	validate_certs?: bool

	// Use HTTPS to connect
	// By default using http

	https?: bool

	// Provide the fqdn or ip-address for the Itential Automation Platform

	iap_fqdn: string

	// Provide the port number for the Itential Automation Platform

	iap_port: string
}
