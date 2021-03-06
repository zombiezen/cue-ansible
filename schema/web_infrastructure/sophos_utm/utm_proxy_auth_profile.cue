package ansible

module: utm_proxy_auth_profile: {
	module: "utm_proxy_auth_profile"

	author: [
		"Stephan Schwarz (@stearz)",
	]

	short_description: "create, update or destroy reverse_proxy auth_profile entry in Sophos UTM"

	description: [
		"Create, update or destroy a reverse_proxy auth_profile entry in SOPHOS UTM.",
		"This module needs to have the REST Ability of the UTM to be activated.",
	]

	version_added: "2.8"

	options: {
		name: {
			description: [
				"The name of the object. Will be used to identify the entry",
			]
			required: true
		}
		aaa: {
			description: [
				"List of references to utm_aaa objects (allowed users or groups)",
			]
			required: true
		}
		basic_prompt: {
			description: [
				"The message in the basic authentication prompt",
			]
			required: true
		}
		backend_mode: {
			description: [
				"Specifies if the backend server needs authentication ([Basic|None])",
			]
			default: "None"
			choices: [
				"Basic",
				"None",
			]
		}
		backend_strip_basic_auth: {
			description: [
				"Should the login data be stripped when proxying the request to the backend host",
			]
			type:    "bool"
			default: true
			choices: [
				true,
				false,
			]
		}
		backend_user_prefix: {
			description: [
				"Prefix string to prepend to the username for backend authentication",
			]
			default: ""
		}
		backend_user_suffix: {
			description: [
				"Suffix string to append to the username for backend authentication",
			]
			default: ""
		}
		comment: {
			description: [
				"Optional comment string",
			]
			default: ""
		}
		frontend_cookie: description: [
			"Frontend cookie name",
		]
		frontend_cookie_secret: description: [
			"Frontend cookie secret",
		]
		frontend_form: description: [
			"Frontend authentication form name",
		]
		frontend_form_template: {
			description: [
				"Frontend authentication form template",
			]
			default: ""
		}
		frontend_login: description: [
			"Frontend login name",
		]
		frontend_logout: description: [
			"Frontend logout name",
		]
		frontend_mode: {
			description: [
				"Frontend authentication mode (Form|Basic)",
			]
			default: "Basic"
			choices: [
				"Basic",
				"Form",
			]
		}
		frontend_realm: description: [
			"Frontend authentication realm",
		]
		frontend_session_allow_persistency: {
			description: [
				"Allow session persistency",
			]
			type:    "bool"
			default: false
			choices: [
				true,
				false,
			]
		}
		frontend_session_lifetime: {
			description: [
				"session lifetime",
			]
			required: true
		}
		frontend_session_lifetime_limited: {
			description: [
				"Specifies if limitation of session lifetime is active",
			]
			type:    "bool"
			default: true
			choices: [
				true,
				false,
			]
		}
		frontend_session_lifetime_scope: {
			description: [
				"scope for frontend_session_lifetime (days|hours|minutes)",
			]
			default: "hours"
			choices: [
				"days",
				"hours",
				"minutes",
			]
		}
		frontend_session_timeout: {
			description: [
				"session timeout",
			]
			required: true
		}
		frontend_session_timeout_enabled: {
			description: [
				"Specifies if session timeout is active",
			]
			type:    "bool"
			default: true
			choices: [
				true,
				false,
			]
		}
		frontend_session_timeout_scope: {
			description: [
				"scope for frontend_session_timeout (days|hours|minutes)",
			]
			default: "minutes"
			choices: [
				"days",
				"hours",
				"minutes",
			]
		}
		logout_delegation_urls: {
			description: [
				"List of logout URLs that logouts are delegated to",
			]
			default: []
		}
		logout_mode: {
			description: [
				"Mode of logout (None|Delegation)",
			]
			default: "None"
			choices: [
				"None",
				"Delegation",
			]
		}
		redirect_to_requested_url: {
			description: [
				"Should a redirect to the requested URL be made",
			]
			type:    "bool"
			default: false
			choices: [
				true,
				false,
			]
		}
	}

	extends_documentation_fragment: ["utm"]
}
