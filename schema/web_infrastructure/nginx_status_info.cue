package ansible

module: nginx_status_info: {
	module:            "nginx_status_info"
	short_description: "Retrieve information on nginx status."
	description: [
		"Gathers information from nginx from an URL having C(stub_status) enabled.",
	]
	version_added: "2.9"
	author:        "René Moser (@resmo)"
	options: {
		url: {
			type: "str"
			description: ["URL of the nginx status."]
			required: true
		}
		timeout: {
			type: "int"
			description: ["HTTP connection timeout in seconds."]
			required: false
			default:  10
		}
	}

	notes: ["See U(http://nginx.org/en/docs/http/ngx_http_stub_status_module.html) for more information."]
}
