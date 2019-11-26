package ansible

module: win_http_proxy: {
	module:            "win_http_proxy"
	version_added:     "2.8"
	short_description: "Manages proxy settings for WinHTTP"
	description: [
		"Used to set, remove, or import proxy settings for Windows HTTP Services C(WinHTTP).",
		"WinHTTP is a framework used by applications or services, typically .NET applications or non-interactive services, to make web requests.",
	]

	options: {
		bypass: {
			description: [
				"A list of hosts that will bypass the set proxy when being accessed.",
				"Use C(<local>) to match hostnames that are not fully qualified domain names. This is useful when needing to connect to intranet sites using just the hostname.",
				"Omit, set to null or an empty string/list to remove the bypass list.",
				"If this is set then I(proxy) must also be set.",
			]
			type: "list"
		}
		proxy: description: [
			"A string or dict that specifies the proxy to be set.",
			"If setting a string, should be in the form C(hostname), C(hostname:port), or C(protocol=hostname:port).",
			"If the port is undefined, the default port for the protocol in use is used.",
			"If setting a dict, the keys should be the protocol and the values should be the hostname and/or port for that protocol.",
			"Valid protocols are C(http), C(https), C(ftp), and C(socks).",
			"Omit, set to null or an empty string to remove the proxy settings.",
		]
		source: {
			description: [
				"Instead of manually specifying the I(proxy) and/or I(bypass), set this to import the proxy from a set source like Internet Explorer.",
				"Using C(ie) will import the Internet Explorer proxy settings for the current active network connection of the current user.",
				"Only IE's proxy URL and bypass list will be imported into WinHTTP.",
				"This is like running C(netsh winhttp import proxy source=ie).",
				"The value is imported when the module runs and will not automatically be updated if the IE configuration changes in the future. The module will have to be run again to sync the latest changes.",
			]

			choices: [
				"ie",
			]
			type: "str"
		}
	}
	notes: [
		"This is not the same as the proxy settings set in Internet Explorer, also known as C(WinINet); use the M(win_inet_proxy) module to manage that instead.",
		"These settings are set system wide and not per user, it will require Administrative privileges to run.",
	]

	seealso: [{
		module: "win_inet_proxy"
	}]
	author: ["Jordan Borean (@jborean93)"]
}
