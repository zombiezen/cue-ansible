package ansible

module: fmgr_secprof_web: {
	module:        "fmgr_secprof_web"
	version_added: "2.8"
	notes: [
		"Full Documentation at U(https://ftnt-ansible-docs.readthedocs.io/en/latest/).",
	]
	author: [
		"Luke Weighall (@lweighall)",
		"Andrew Welsh (@Ghilli3)",
		"Jim Huber (@p4r4n0y1ng)",
	]
	short_description: "Manage web filter security profiles in FortiManager"
	description: [
		"Manage web filter security profiles in FortiManager through playbooks using the FMG API",
	]

	options: {
		adom: {
			description: [
				"The ADOM the configuration should belong to.",
			]
			required: false
			default:  "root"
		}

		mode: {
			description: [
				"Sets one of three modes for managing the object.",
				"Allows use of soft-adds instead of overwriting existing values",
			]
			choices: ["add", "set", "delete", "update"]
			required: false
			default:  "add"
		}

		youtube_channel_status: {
			description: [
				"YouTube channel filter status.",
				"choice | disable | Disable YouTube channel filter.",
				"choice | blacklist | Block matches.",
				"choice | whitelist | Allow matches.",
			]
			required: false
			choices: ["disable", "blacklist", "whitelist"]
		}

		wisp_servers: {
			description: [
				"WISP servers.",
			]
			required: false
		}

		wisp_algorithm: {
			description: [
				"WISP server selection algorithm.",
				"choice | auto-learning | Select the lightest loading healthy server.",
				"choice | primary-secondary | Select the first healthy server in order.",
				"choice | round-robin | Select the next healthy server.",
			]
			required: false
			choices: ["auto-learning", "primary-secondary", "round-robin"]
		}

		wisp: {
			description: [
				"Enable/disable web proxy WISP.",
				"choice | disable | Disable web proxy WISP.",
				"choice | enable | Enable web proxy WISP.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		web_url_log: {
			description: [
				"Enable/disable logging URL filtering.",
				"choice | disable | Disable setting.",
				"choice | enable | Enable setting.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		web_invalid_domain_log: {
			description: [
				"Enable/disable logging invalid domain names.",
				"choice | disable | Disable setting.",
				"choice | enable | Enable setting.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		web_ftgd_quota_usage: {
			description: [
				"Enable/disable logging daily quota usage.",
				"choice | disable | Disable setting.",
				"choice | enable | Enable setting.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		web_ftgd_err_log: {
			description: [
				"Enable/disable logging rating errors.",
				"choice | disable | Disable setting.",
				"choice | enable | Enable setting.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		web_filter_vbs_log: {
			description: [
				"Enable/disable logging VBS scripts.",
				"choice | disable | Disable setting.",
				"choice | enable | Enable setting.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		web_filter_unknown_log: {
			description: [
				"Enable/disable logging unknown scripts.",
				"choice | disable | Disable setting.",
				"choice | enable | Enable setting.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		web_filter_referer_log: {
			description: [
				"Enable/disable logging referrers.",
				"choice | disable | Disable setting.",
				"choice | enable | Enable setting.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		web_filter_jscript_log: {
			description: [
				"Enable/disable logging JScripts.",
				"choice | disable | Disable setting.",
				"choice | enable | Enable setting.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		web_filter_js_log: {
			description: [
				"Enable/disable logging Java scripts.",
				"choice | disable | Disable setting.",
				"choice | enable | Enable setting.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		web_filter_cookie_removal_log: {
			description: [
				"Enable/disable logging blocked cookies.",
				"choice | disable | Disable setting.",
				"choice | enable | Enable setting.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		web_filter_cookie_log: {
			description: [
				"Enable/disable logging cookie filtering.",
				"choice | disable | Disable setting.",
				"choice | enable | Enable setting.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		web_filter_command_block_log: {
			description: [
				"Enable/disable logging blocked commands.",
				"choice | disable | Disable setting.",
				"choice | enable | Enable setting.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		web_filter_applet_log: {
			description: [
				"Enable/disable logging Java applets.",
				"choice | disable | Disable setting.",
				"choice | enable | Enable setting.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		web_filter_activex_log: {
			description: [
				"Enable/disable logging ActiveX.",
				"choice | disable | Disable setting.",
				"choice | enable | Enable setting.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		web_extended_all_action_log: {
			description: [
				"Enable/disable extended any filter action logging for web filtering.",
				"choice | disable | Disable setting.",
				"choice | enable | Enable setting.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		web_content_log: {
			description: [
				"Enable/disable logging logging blocked web content.",
				"choice | disable | Disable setting.",
				"choice | enable | Enable setting.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		replacemsg_group: {
			description: [
				"Replacement message group.",
			]
			required: false
		}

		post_action: {
			description: [
				"Action taken for HTTP POST traffic.",
				"choice | normal | Normal, POST requests are allowed.",
				"choice | block | POST requests are blocked.",
			]
			required: false
			choices: ["normal", "block"]
		}

		ovrd_perm: {
			description: [
				"FLAG Based Options. Specify multiple in list form.",
				"flag | bannedword-override | Banned word override.",
				"flag | urlfilter-override | URL filter override.",
				"flag | fortiguard-wf-override | FortiGuard Web Filter override.",
				"flag | contenttype-check-override | Content-type header override.",
			]
			required: false
			choices: [
				"bannedword-override",
				"urlfilter-override",
				"fortiguard-wf-override",
				"contenttype-check-override",
			]
		}

		options: {
			description: [
				"FLAG Based Options. Specify multiple in list form.",
				"flag | block-invalid-url | Block sessions contained an invalid domain name.",
				"flag | jscript | Javascript block.",
				"flag | js | JS block.",
				"flag | vbs | VB script block.",
				"flag | unknown | Unknown script block.",
				"flag | wf-referer | Referring block.",
				"flag | intrinsic | Intrinsic script block.",
				"flag | wf-cookie | Cookie block.",
				"flag | per-user-bwl | Per-user black/white list filter",
				"flag | activexfilter | ActiveX filter.",
				"flag | cookiefilter | Cookie filter.",
				"flag | javafilter | Java applet filter.",
			]
			required: false
			choices: [
				"block-invalid-url",
				"jscript",
				"js",
				"vbs",
				"unknown",
				"wf-referer",
				"intrinsic",
				"wf-cookie",
				"per-user-bwl",
				"activexfilter",
				"cookiefilter",
				"javafilter",
			]
		}

		name: {
			description: [
				"Profile name.",
			]
			required: false
		}

		log_all_url: {
			description: [
				"Enable/disable logging all URLs visited.",
				"choice | disable | Disable setting.",
				"choice | enable | Enable setting.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		inspection_mode: {
			description: [
				"Web filtering inspection mode.",
				"choice | proxy | Proxy.",
				"choice | flow-based | Flow based.",
			]
			required: false
			choices: ["proxy", "flow-based"]
		}

		https_replacemsg: {
			description: [
				"Enable replacement messages for HTTPS.",
				"choice | disable | Disable setting.",
				"choice | enable | Enable setting.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		extended_log: {
			description: [
				"Enable/disable extended logging for web filtering.",
				"choice | disable | Disable setting.",
				"choice | enable | Enable setting.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		comment: {
			description: [
				"Optional comments.",
			]
			required: false
		}

		ftgd_wf: {
			description: [
				"EXPERTS ONLY! KNOWLEDGE OF FMGR JSON API IS REQUIRED!",
				"List of multiple child objects to be added. Expects a list of dictionaries.",
				"Dictionaries must use FortiManager API parameters, not the ansible ones listed below.",
				"If submitted, all other prefixed sub-parameters ARE IGNORED.",
				"This object is MUTUALLY EXCLUSIVE with its options.",
				"We expect that you know what you are doing with these list parameters, and are leveraging the JSON API Guide.",
				"WHEN IN DOUBT, USE THE SUB OPTIONS BELOW INSTEAD TO CREATE OBJECTS WITH MULTIPLE TASKS",
			]
			required: false
		}

		ftgd_wf_exempt_quota: {
			description: [
				"Do not stop quota for these categories.",
			]
			required: false
		}

		ftgd_wf_max_quota_timeout: {
			description: [
				"Maximum FortiGuard quota used by single page view in seconds (excludes streams).",
			]
			required: false
		}

		ftgd_wf_options: {
			description: [
				"Options for FortiGuard Web Filter.",
				"FLAG Based Options. Specify multiple in list form.",
				"flag | error-allow | Allow web pages with a rating error to pass through.",
				"flag | rate-server-ip | Rate the server IP in addition to the domain name.",
				"flag | connect-request-bypass | Bypass connection which has CONNECT request.",
				"flag | ftgd-disable | Disable FortiGuard scanning.",
			]
			required: false
			choices: ["error-allow", "rate-server-ip", "connect-request-bypass", "ftgd-disable"]
		}

		ftgd_wf_ovrd: {
			description: [
				"Allow web filter profile overrides.",
			]
			required: false
		}

		ftgd_wf_rate_crl_urls: {
			description: [
				"Enable/disable rating CRL by URL.",
				"choice | disable | Disable rating CRL by URL.",
				"choice | enable | Enable rating CRL by URL.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		ftgd_wf_rate_css_urls: {
			description: [
				"Enable/disable rating CSS by URL.",
				"choice | disable | Disable rating CSS by URL.",
				"choice | enable | Enable rating CSS by URL.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		ftgd_wf_rate_image_urls: {
			description: [
				"Enable/disable rating images by URL.",
				"choice | disable | Disable rating images by URL (blocked images are replaced with blanks).",
				"choice | enable | Enable rating images by URL (blocked images are replaced with blanks).",
			]
			required: false
			choices: ["disable", "enable"]
		}

		ftgd_wf_rate_javascript_urls: {
			description: [
				"Enable/disable rating JavaScript by URL.",
				"choice | disable | Disable rating JavaScript by URL.",
				"choice | enable | Enable rating JavaScript by URL.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		ftgd_wf_filters_action: {
			description: [
				"Action to take for matches.",
				"choice | block | Block access.",
				"choice | monitor | Allow access while logging the action.",
				"choice | warning | Allow access after warning the user.",
				"choice | authenticate | Authenticate user before allowing access.",
			]
			required: false
			choices: ["block", "monitor", "warning", "authenticate"]
		}

		ftgd_wf_filters_auth_usr_grp: {
			description: [
				"Groups with permission to authenticate.",
			]
			required: false
		}

		ftgd_wf_filters_category: {
			description: [
				"Categories and groups the filter examines.",
			]
			required: false
		}

		ftgd_wf_filters_log: {
			description: [
				"Enable/disable logging.",
				"choice | disable | Disable setting.",
				"choice | enable | Enable setting.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		ftgd_wf_filters_override_replacemsg: {
			description: [
				"Override replacement message.",
			]
			required: false
		}

		ftgd_wf_filters_warn_duration: {
			description: [
				"Duration of warnings.",
			]
			required: false
		}

		ftgd_wf_filters_warning_duration_type: {
			description: [
				"Re-display warning after closing browser or after a timeout.",
				"choice | session | After session ends.",
				"choice | timeout | After timeout occurs.",
			]
			required: false
			choices: ["session", "timeout"]
		}

		ftgd_wf_filters_warning_prompt: {
			description: [
				"Warning prompts in each category or each domain.",
				"choice | per-domain | Per-domain warnings.",
				"choice | per-category | Per-category warnings.",
			]
			required: false
			choices: ["per-domain", "per-category"]
		}

		ftgd_wf_quota_category: {
			description: [
				"FortiGuard categories to apply quota to (category action must be set to monitor).",
			]
			required: false
		}

		ftgd_wf_quota_duration: {
			description: [
				"Duration of quota.",
			]
			required: false
		}

		ftgd_wf_quota_override_replacemsg: {
			description: [
				"Override replacement message.",
			]
			required: false
		}

		ftgd_wf_quota_type: {
			description: [
				"Quota type.",
				"choice | time | Use a time-based quota.",
				"choice | traffic | Use a traffic-based quota.",
			]
			required: false
			choices: ["time", "traffic"]
		}

		ftgd_wf_quota_unit: {
			description: [
				"Traffic quota unit of measurement.",
				"choice | B | Quota in bytes.",
				"choice | KB | Quota in kilobytes.",
				"choice | MB | Quota in megabytes.",
				"choice | GB | Quota in gigabytes.",
			]
			required: false
			choices: ["B", "KB", "MB", "GB"]
		}

		ftgd_wf_quota_value: {
			description: [
				"Traffic quota value.",
			]
			required: false
		}

		override: {
			description: [
				"EXPERTS ONLY! KNOWLEDGE OF FMGR JSON API IS REQUIRED!",
				"List of multiple child objects to be added. Expects a list of dictionaries.",
				"Dictionaries must use FortiManager API parameters, not the ansible ones listed below.",
				"If submitted, all other prefixed sub-parameters ARE IGNORED.",
				"This object is MUTUALLY EXCLUSIVE with its options.",
				"We expect that you know what you are doing with these list parameters, and are leveraging the JSON API Guide.",
				"WHEN IN DOUBT, USE THE SUB OPTIONS BELOW INSTEAD TO CREATE OBJECTS WITH MULTIPLE TASKS",
			]
			required: false
		}

		override_ovrd_cookie: {
			description: [
				"Allow/deny browser-based (cookie) overrides.",
				"choice | deny | Deny browser-based (cookie) override.",
				"choice | allow | Allow browser-based (cookie) override.",
			]
			required: false
			choices: ["deny", "allow"]
		}

		override_ovrd_dur: {
			description: [
				"Override duration.",
			]
			required: false
		}

		override_ovrd_dur_mode: {
			description: [
				"Override duration mode.",
				"choice | constant | Constant mode.",
				"choice | ask | Prompt for duration when initiating an override.",
			]
			required: false
			choices: ["constant", "ask"]
		}

		override_ovrd_scope: {
			description: [
				"Override scope.",
				"choice | user | Override for the user.",
				"choice | user-group | Override for the user's group.",
				"choice | ip | Override for the initiating IP.",
				"choice | ask | Prompt for scope when initiating an override.",
				"choice | browser | Create browser-based (cookie) override.",
			]
			required: false
			choices: ["user", "user-group", "ip", "ask", "browser"]
		}

		override_ovrd_user_group: {
			description: [
				"User groups with permission to use the override.",
			]
			required: false
		}

		override_profile: {
			description: [
				"Web filter profile with permission to create overrides.",
			]
			required: false
		}

		override_profile_attribute: {
			description: [
				"Profile attribute to retrieve from the RADIUS server.",
				"choice | User-Name | Use this attribute.",
				"choice | NAS-IP-Address | Use this attribute.",
				"choice | Framed-IP-Address | Use this attribute.",
				"choice | Framed-IP-Netmask | Use this attribute.",
				"choice | Filter-Id | Use this attribute.",
				"choice | Login-IP-Host | Use this attribute.",
				"choice | Reply-Message | Use this attribute.",
				"choice | Callback-Number | Use this attribute.",
				"choice | Callback-Id | Use this attribute.",
				"choice | Framed-Route | Use this attribute.",
				"choice | Framed-IPX-Network | Use this attribute.",
				"choice | Class | Use this attribute.",
				"choice | Called-Station-Id | Use this attribute.",
				"choice | Calling-Station-Id | Use this attribute.",
				"choice | NAS-Identifier | Use this attribute.",
				"choice | Proxy-State | Use this attribute.",
				"choice | Login-LAT-Service | Use this attribute.",
				"choice | Login-LAT-Node | Use this attribute.",
				"choice | Login-LAT-Group | Use this attribute.",
				"choice | Framed-AppleTalk-Zone | Use this attribute.",
				"choice | Acct-Session-Id | Use this attribute.",
				"choice | Acct-Multi-Session-Id | Use this attribute.",
			]
			required: false
			choices: [
				"User-Name",
				"NAS-IP-Address",
				"Framed-IP-Address",
				"Framed-IP-Netmask",
				"Filter-Id",
				"Login-IP-Host",
				"Reply-Message",
				"Callback-Number",
				"Callback-Id",
				"Framed-Route",
				"Framed-IPX-Network",
				"Class",
				"Called-Station-Id",
				"Calling-Station-Id",
				"NAS-Identifier",
				"Proxy-State",
				"Login-LAT-Service",
				"Login-LAT-Node",
				"Login-LAT-Group",
				"Framed-AppleTalk-Zone",
				"Acct-Session-Id",
				"Acct-Multi-Session-Id",
			]
		}

		override_profile_type: {
			description: [
				"Override profile type.",
				"choice | list | Profile chosen from list.",
				"choice | radius | Profile determined by RADIUS server.",
			]
			required: false
			choices: ["list", "radius"]
		}

		url_extraction: {
			description: [
				"EXPERTS ONLY! KNOWLEDGE OF FMGR JSON API IS REQUIRED!",
				"List of multiple child objects to be added. Expects a list of dictionaries.",
				"Dictionaries must use FortiManager API parameters, not the ansible ones listed below.",
				"If submitted, all other prefixed sub-parameters ARE IGNORED.",
				"This object is MUTUALLY EXCLUSIVE with its options.",
				"We expect that you know what you are doing with these list parameters, and are leveraging the JSON API Guide.",
				"WHEN IN DOUBT, USE THE SUB OPTIONS BELOW INSTEAD TO CREATE OBJECTS WITH MULTIPLE TASKS",
			]
			required: false
		}

		url_extraction_redirect_header: {
			description: [
				"HTTP header name to use for client redirect on blocked requests",
			]
			required: false
		}

		url_extraction_redirect_no_content: {
			description: [
				"Enable / Disable empty message-body entity in HTTP response",
				"choice | disable | Disable setting.",
				"choice | enable | Enable setting.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		url_extraction_redirect_url: {
			description: [
				"HTTP header value to use for client redirect on blocked requests",
			]
			required: false
		}

		url_extraction_server_fqdn: {
			description: [
				"URL extraction server FQDN (fully qualified domain name)",
			]
			required: false
		}

		url_extraction_status: {
			description: [
				"Enable URL Extraction",
				"choice | disable | Disable setting.",
				"choice | enable | Enable setting.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		web: {
			description: [
				"EXPERTS ONLY! KNOWLEDGE OF FMGR JSON API IS REQUIRED!",
				"List of multiple child objects to be added. Expects a list of dictionaries.",
				"Dictionaries must use FortiManager API parameters, not the ansible ones listed below.",
				"If submitted, all other prefixed sub-parameters ARE IGNORED.",
				"This object is MUTUALLY EXCLUSIVE with its options.",
				"We expect that you know what you are doing with these list parameters, and are leveraging the JSON API Guide.",
				"WHEN IN DOUBT, USE THE SUB OPTIONS BELOW INSTEAD TO CREATE OBJECTS WITH MULTIPLE TASKS",
			]
			required: false
		}

		web_blacklist: {
			description: [
				"Enable/disable automatic addition of URLs detected by FortiSandbox to blacklist.",
				"choice | disable | Disable setting.",
				"choice | enable | Enable setting.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		web_bword_table: {
			description: [
				"Banned word table ID.",
			]
			required: false
		}

		web_bword_threshold: {
			description: [
				"Banned word score threshold.",
			]
			required: false
		}

		web_content_header_list: {
			description: [
				"Content header list.",
			]
			required: false
		}

		web_keyword_match: {
			description: [
				"Search keywords to log when match is found.",
			]
			required: false
		}

		web_log_search: {
			description: [
				"Enable/disable logging all search phrases.",
				"choice | disable | Disable setting.",
				"choice | enable | Enable setting.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		web_safe_search: {
			description: [
				"Safe search type.",
				"FLAG Based Options. Specify multiple in list form.",
				"flag | url | Insert safe search string into URL.",
				"flag | header | Insert safe search header.",
			]
			required: false
			choices: ["url", "header"]
		}

		web_urlfilter_table: {
			description: [
				"URL filter table ID.",
			]
			required: false
		}

		web_whitelist: {
			description: [
				"FortiGuard whitelist settings.",
				"FLAG Based Options. Specify multiple in list form.",
				"flag | exempt-av | Exempt antivirus.",
				"flag | exempt-webcontent | Exempt web content.",
				"flag | exempt-activex-java-cookie | Exempt ActiveX-JAVA-Cookie.",
				"flag | exempt-dlp | Exempt DLP.",
				"flag | exempt-rangeblock | Exempt RangeBlock.",
				"flag | extended-log-others | Support extended log.",
			]
			required: false
			choices: [
				"exempt-av",
				"exempt-webcontent",
				"exempt-activex-java-cookie",
				"exempt-dlp",
				"exempt-rangeblock",
				"extended-log-others",
			]
		}

		web_youtube_restrict: {
			description: [
				"YouTube EDU filter level.",
				"choice | strict | Strict access for YouTube.",
				"choice | none | Full access for YouTube.",
				"choice | moderate | Moderate access for YouTube.",
			]
			required: false
			choices: ["strict", "none", "moderate"]
		}

		youtube_channel_filter: {
			description: [
				"EXPERTS ONLY! KNOWLEDGE OF FMGR JSON API IS REQUIRED!",
				"List of multiple child objects to be added. Expects a list of dictionaries.",
				"Dictionaries must use FortiManager API parameters, not the ansible ones listed below.",
				"If submitted, all other prefixed sub-parameters ARE IGNORED.",
				"This object is MUTUALLY EXCLUSIVE with its options.",
				"We expect that you know what you are doing with these list parameters, and are leveraging the JSON API Guide.",
				"WHEN IN DOUBT, USE THE SUB OPTIONS BELOW INSTEAD TO CREATE OBJECTS WITH MULTIPLE TASKS",
			]
			required: false
		}

		youtube_channel_filter_channel_id: {
			description: [
				"YouTube channel ID to be filtered.",
			]
			required: false
		}

		youtube_channel_filter_comment: {
			description: [
				"Comment.",
			]
			required: false
		}
	}
}
