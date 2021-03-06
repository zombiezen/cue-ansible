package ansible

module: fmgr_secprof_profile_group: {
	module:        "fmgr_secprof_profile_group"
	version_added: "2.8"
	notes: [
		"Full Documentation at U(https://ftnt-ansible-docs.readthedocs.io/en/latest/).",
	]
	author: [
		"Luke Weighall (@lweighall)",
		"Andrew Welsh (@Ghilli3)",
		"Jim Huber (@p4r4n0y1ng)",
	]
	short_description: "Manage security profiles within FortiManager"
	description: [
		"Manage security profile group which allows you to create a group of security profiles and apply that to a policy.",
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
				"Allows use of soft-adds instead of overwriting existing values.",
			]
			choices: ["add", "set", "delete", "update"]
			required: false
			default:  "add"
		}

		webfilter_profile: {
			type: "str"
			description: [
				"Name of an existing Web filter profile.",
			]
			required: false
		}

		waf_profile: {
			type: "str"
			description: [
				"Name of an existing Web application firewall profile.",
			]
			required: false
		}

		voip_profile: {
			type: "str"
			description: [
				"Name of an existing VoIP profile.",
			]
			required: false
		}

		ssl_ssh_profile: {
			type: "str"
			description: [
				"Name of an existing SSL SSH profile.",
			]
			required: false
		}

		ssh_filter_profile: {
			type: "str"
			description: [
				"Name of an existing SSH filter profile.",
			]
			required: false
		}

		spamfilter_profile: {
			type: "str"
			description: [
				"Name of an existing Spam filter profile.",
			]
			required: false
		}

		profile_protocol_options: {
			type: "str"
			description: [
				"Name of an existing Protocol options profile.",
			]
			required: false
		}

		name: {
			type: "str"
			description: [
				"Profile group name.",
			]
			required: false
		}

		mms_profile: {
			type: "str"
			description: [
				"Name of an existing MMS profile.",
			]
			required: false
		}

		ips_sensor: {
			type: "str"
			description: [
				"Name of an existing IPS sensor.",
			]
			required: false
		}

		icap_profile: {
			type: "str"
			description: [
				"Name of an existing ICAP profile.",
			]
			required: false
		}

		dnsfilter_profile: {
			type: "str"
			description: [
				"Name of an existing DNS filter profile.",
			]
			required: false
		}

		dlp_sensor: {
			type: "str"
			description: [
				"Name of an existing DLP sensor.",
			]
			required: false
		}

		av_profile: {
			type: "str"
			description: [
				"Name of an existing Antivirus profile.",
			]
			required: false
		}

		application_list: {
			type: "str"
			description: [
				"Name of an existing Application list.",
			]
			required: false
		}
	}
}
