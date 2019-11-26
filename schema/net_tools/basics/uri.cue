package ansible

module: uri: {
	module:            "uri"
	short_description: "Interacts with webservices"
	description: [
		"Interacts with HTTP and HTTPS web services and supports Digest, Basic and WSSE HTTP authentication mechanisms.",
		"For Windows targets, use the M(win_uri) module instead.",
	]
	version_added: "1.1"
	options: {
		url: {
			description: [
				"HTTP or HTTPS URL in the form (http|https)://host.domain[:port]/path",
			]
			type:     "str"
			required: true
		}
		dest: {
			description: [
				"A path of where to download the file to (if desired). If I(dest) is a directory, the basename of the file on the remote server will be used.",
			]

			type: "path"
		}
		url_username: {
			description: [
				"A username for the module to use for Digest, Basic or WSSE authentication.",
			]
			type: "str"
			aliases: ["user"]
		}
		url_password: {
			description: [
				"A password for the module to use for Digest, Basic or WSSE authentication.",
			]
			type: "str"
			aliases: ["password"]
		}
		body: {
			description: [
				"The body of the http request/response to the web service. If C(body_format) is set to 'json' it will take an already formatted JSON string or convert a data structure into JSON. If C(body_format) is set to 'form-urlencoded' it will convert a dictionary or list of tuples into an 'application/x-www-form-urlencoded' string. (Added in v2.7)",
			]

			type: "raw"
		}
		body_format: {
			description: [
				"The serialization format of the body. When set to C(json) or C(form-urlencoded), encodes the body argument, if needed, and automatically sets the Content-Type header accordingly. As of C(2.3) it is possible to override the `Content-Type` header, when set to C(json) or C(form-urlencoded) via the I(headers) option.",
			]

			type: "str"
			choices: ["form-urlencoded", "json", "raw"]
			default:       "raw"
			version_added: "2.0"
		}
		method: {
			description: [
				"The HTTP method of the request or response.",
				"In more recent versions we do not restrict the method at the module level anymore but it still must be a valid method accepted by the service handling the request.",
			]

			type:    "str"
			default: "GET"
		}
		return_content: {
			description: [
				"Whether or not to return the body of the response as a \"content\" key in the dictionary result.",
				"Independently of this option, if the reported Content-type is \"application/json\", then the JSON is always loaded into a key called C(json) in the dictionary results.",
			]

			type:    "bool"
			default: false
		}
		force_basic_auth: {
			description: [
				"Force the sending of the Basic authentication header upon initial request.",
				"The library used by the uri module only sends authentication information when a webservice responds to an initial request with a 401 status. Since some basic auth services do not properly send a 401, logins will fail.",
			]

			type:    "bool"
			default: false
		}
		follow_redirects: {
			description: [
				"Whether or not the URI module should follow redirects. C(all) will follow all redirects. C(safe) will follow only \"safe\" redirects, where \"safe\" means that the client is only doing a GET or HEAD on the URI to which it is being redirected. C(none) will not follow any redirects. Note that C(yes) and C(no) choices are accepted for backwards compatibility, where C(yes) is the equivalent of C(all) and C(no) is the equivalent of C(safe). C(yes) and C(no) are deprecated and will be removed in some future version of Ansible.",
			]

			type: "str"
			choices: ["all", "no", "none", "safe", "urllib2", "yes"]
			default: "safe"
		}
		creates: {
			description: [
				"A filename, when it already exists, this step will not be run.",
			]
			type: "path"
		}
		removes: {
			description: [
				"A filename, when it does not exist, this step will not be run.",
			]
			type: "path"
		}
		status_code: {
			description: [
				"A list of valid, numeric, HTTP status codes that signifies success of the request.",
			]
			type: "list"
			default: [200]
		}
		timeout: {
			description: [
				"The socket level timeout in seconds",
			]
			type:    "int"
			default: 30
		}
		headers: {
			description: [
				"Add custom HTTP headers to a request in the format of a YAML hash. As of C(2.3) supplying C(Content-Type) here will override the header generated by supplying C(json) or C(form-urlencoded) for I(body_format).",
			]

			type:          "dict"
			version_added: "2.1"
		}
		validate_certs: {
			description: [
				"If C(no), SSL certificates will not be validated.",
				"This should only set to C(no) used on personally controlled sites using self-signed certificates.",
				"Prior to 1.9.2 the code defaulted to C(no).",
			]
			type:          "bool"
			default:       true
			version_added: "1.9.2"
		}
		client_cert: {
			description: [
				"PEM formatted certificate chain file to be used for SSL client authentication.",
				"This file can also include the key as well, and if the key is included, I(client_key) is not required",
			]
			type:          "path"
			version_added: "2.4"
		}
		client_key: {
			description: [
				"PEM formatted file that contains your private key to be used for SSL client authentication.",
				"If I(client_cert) contains both the certificate and key, this option is not required.",
			]
			type:          "path"
			version_added: "2.4"
		}
		src: {
			description: [
				"Path to file to be submitted to the remote server.",
				"Cannot be used with I(body).",
			]
			type:          "path"
			version_added: "2.7"
		}
		remote_src: {
			description: [
				"If C(no), the module will search for src on originating/master machine.",
				"If C(yes) the module will use the C(src) path on the remote/target machine.",
			]
			type:          "bool"
			default:       false
			version_added: "2.7"
		}
		force: {
			description: [
				"If C(yes) do not get a cached copy.",
				"Alias C(thirsty) has been deprecated and will be removed in 2.13.",
			]
			type:    "bool"
			default: false
			aliases: ["thirsty"]
		}
		use_proxy: {
			description: [
				"If C(no), it will not use a proxy, even if one is defined in an environment variable on the target hosts.",
			]
			type:    "bool"
			default: true
		}
		unix_socket: {
			description: [
				"Path to Unix domain socket to use for connection",
			]
			version_added: "2.8"
		}
		http_agent: {
			description: [
				"Header to identify as, generally appears in web server logs.",
			]
			type:    "str"
			default: "ansible-httpget"
		}
	}
	notes: [
		"The dependency on httplib2 was removed in Ansible 2.1.",
		"The module returns all the HTTP headers in lower-case.",
		"For Windows targets, use the M(win_uri) module instead.",
	]
	seealso: [{
		module: "get_url"
	}, {
		module: "win_uri"
	}]
	author: [
		"Romeo Theriault (@romeotheriault)",
	]
	extends_documentation_fragment: "files"
}
