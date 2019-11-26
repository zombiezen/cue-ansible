package ansible

module: win_domain: {
	module:            "win_domain"
	short_description: "Ensures the existence of a Windows domain"
	version_added:     2.3
	description: [
		"Ensure that the domain named by C(dns_domain_name) exists and is reachable.",
		"If the domain is not reachable, the domain is created in a new forest on the target Windows Server 2012R2+ host.",
		"This module may require subsequent use of the M(win_reboot) action if changes are made.",
	]
	options: {
		dns_domain_name: {
			description: [
				"The DNS name of the domain which should exist and be reachable or reside on the target Windows host.",
			]
			type:     "str"
			required: true
		}
		domain_netbios_name: {
			description: [
				"The NetBIOS name for the root domain in the new forest.",
				"For NetBIOS names to be valid for use with this parameter they must be single label names of 15 characters or less, if not it will fail.",
				"If this parameter is not set, then the default is automatically computed from the value of the I(domain_name) parameter.",
			]
			type:          "str"
			version_added: "2.6"
		}
		safe_mode_password: {
			description: [
				"Safe mode password for the domain controller.",
			]
			type:     "str"
			required: true
		}
		database_path: {
			description: [
				"The path to a directory on a fixed disk of the Windows host where the domain database will be created.",
				"If not set then the default path is C(%SYSTEMROOT%\\NTDS).",
			]
			type:          "path"
			version_added: "2.5"
		}
		sysvol_path: {
			description: [
				"The path to a directory on a fixed disk of the Windows host where the Sysvol file will be created.",
				"If not set then the default path is C(%SYSTEMROOT%\\SYSVOL).",
			]
			type:          "path"
			version_added: "2.5"
		}
		create_dns_delegation: {
			description: [
				"Whether to create a DNS delegation that references the new DNS server that you install along with the domain controller.",
				"Valid for Active Directory-integrated DNS only.",
				"The default is computed automatically based on the environment.",
			]
			type:          "bool"
			version_added: "2.8"
		}
		domain_mode: {
			description: [
				"Specifies the domain functional level of the first domain in the creation of a new forest.",
				"The domain functional level cannot be lower than the forest functional level, but it can be higher.",
				"The default is automatically computed and set.",
			]
			type: "str"
			choices: ["Win2003", "Win2008", "Win2008R2", "Win2012", "Win2012R2", "WinThreshold"]
			version_added: "2.8"
		}
		forest_mode: {
			description: [
				"Specifies the forest functional level for the new forest.",
				"The default forest functional level in Windows Server is typically the same as the version you are running.",
			]
			//    - Beware that the default forest functional level in Windows Server 2008 R2 when you create a new forest is C(Win2003).
			type: "str"
			choices: ["Win2003", "Win2008", "Win2008R2", "Win2012", "Win2012R2", "WinThreshold"]
			version_added: "2.8"
		}
		install_dns: {
			description: [
				"Whether to install the DNS service when creating the domain controller.",
			]
			type:          "bool"
			default:       true
			version_added: "2.10"
		}
	}
	seealso: [{
		module: "win_domain_controller"
	}, {
		module: "win_domain_computer"
	}, {
		module: "win_domain_group"
	}, {
		module: "win_domain_membership"
	}, {
		module: "win_domain_user"
	}]
	author: ["Matt Davis (@nitzmahone)"]
}
