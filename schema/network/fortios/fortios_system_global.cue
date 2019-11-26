package ansible

module: fortios_system_global: {
	module:            "fortios_system_global"
	short_description: "Configure global attributes in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify system feature and global category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
	]

	version_added: "2.8"
	author: [
		"Miguel Angel Munoz (@mamunozgonzalez)",
		"Nicolas Thomas (@thomnico)",
	]
	notes: [
		"Requires fortiosapi library developed by Fortinet",
		"Run as a local_action in your playbook",
	]
	requirements: [
		"fortiosapi>=0.9.8",
	]
	options: {
		host: {
			description: [
				"FortiOS or FortiGate IP address.",
			]
			type:     "str"
			required: false
		}
		username: {
			description: [
				"FortiOS or FortiGate username.",
			]
			type:     "str"
			required: false
		}
		password: {
			description: [
				"FortiOS or FortiGate password.",
			]
			type:    "str"
			default: ""
		}
		vdom: {
			description: [
				"Virtual domain, among those defined previously. A vdom is a virtual instance of the FortiGate that can be configured and used as a different unit.",
			]

			type:    "str"
			default: "root"
		}
		https: {
			description: [
				"Indicates if the requests towards FortiGate must use HTTPS protocol.",
			]
			type:    "bool"
			default: true
		}
		ssl_verify: {
			description: [
				"Ensures FortiGate certificate must be verified by a proper CA.",
			]
			type:          "bool"
			default:       true
			version_added: 2.9
		}
		system_global: {
			description: [
				"Configure global attributes.",
			]
			default: null
			type:    "dict"
			suboptions: {
				admin_concurrent: {
					description: [
						"Enable/disable concurrent administrator logins. (Use policy-auth-concurrent for firewall authenticated users.)",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				admin_console_timeout: {
					description: [
						"Console login timeout that overrides the admintimeout value. (15 - 300 seconds) (15 seconds to 5 minutes). 0 the default, disables this timeout.",
					]

					type: "int"
				}
				admin_https_pki_required: {
					description: [
						"Enable/disable admin login method. Enable to force administrators to provide a valid certificate to log in if PKI is enabled. Disable to allow administrators to log in with a certificate or password.",
					]

					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				admin_https_ssl_versions: {
					description: [
						"Allowed TLS versions for web administration.",
					]
					type: "list"
					choices: [
						"tlsv1-0",
						"tlsv1-1",
						"tlsv1-2",
					]
				}
				admin_lockout_duration: {
					description: [
						"Amount of time in seconds that an administrator account is locked out after reaching the admin-lockout-threshold for repeated failed login attempts.",
					]

					type: "int"
				}
				admin_lockout_threshold: {
					description: [
						"Number of failed login attempts before an administrator account is locked out for the admin-lockout-duration.",
					]
					type: "int"
				}
				admin_login_max: {
					description: [
						"Maximum number of administrators who can be logged in at the same time (1 - 100)",
					]
					type: "int"
				}
				admin_maintainer: {
					description: [
						"Enable/disable maintainer administrator login. When enabled, the maintainer account can be used to log in from the console after a hard reboot. The password is \"bcpb\" followed by the FortiGate unit serial number. You have limited time to complete this login.",
					]

					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				admin_port: {
					description: [
						"Administrative access port for HTTP. (1 - 65535).",
					]
					type: "int"
				}
				admin_restrict_local: {
					description: [
						"Enable/disable local admin authentication restriction when remote authenticator is up and running.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				admin_scp: {
					description: [
						"Enable/disable using SCP to download the system configuration. You can use SCP as an alternative method for backing up the configuration.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				admin_server_cert: {
					description: [
						"Server certificate that the FortiGate uses for HTTPS administrative connections. Source certificate.local.name.",
					]
					type: "str"
				}
				admin_sport: {
					description: [
						"Administrative access port for HTTPS. (1 - 65535).",
					]
					type: "int"
				}
				admin_ssh_grace_time: {
					description: [
						"Maximum time in seconds permitted between making an SSH connection to the FortiGate unit and authenticating (10 - 3600 sec (1 hour)).",
					]
					type: "int"
				}
				admin_ssh_password: {
					description: [
						"Enable/disable password authentication for SSH admin access.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				admin_ssh_port: {
					description: [
						"Administrative access port for SSH. (1 - 65535).",
					]
					type: "int"
				}
				admin_ssh_v1: {
					description: [
						"Enable/disable SSH v1 compatibility.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				admin_telnet_port: {
					description: [
						"Administrative access port for TELNET. (1 - 65535).",
					]
					type: "int"
				}
				admintimeout: {
					description: [
						"Number of minutes before an idle administrator session times out (5 - 480 minutes (8 hours)). A shorter idle timeout is more secure.",
					]
					type: "int"
				}
				alias: {
					description: [
						"Alias for your FortiGate unit.",
					]
					type: "str"
				}
				allow_traffic_redirect: {
					description: [
						"Disable to allow traffic to be routed back on a different interface.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				anti_replay: {
					description: [
						"Level of checking for packet replay and TCP sequence checking.",
					]
					type: "str"
					choices: [
						"disable",
						"loose",
						"strict",
					]
				}
				arp_max_entry: {
					description: [
						"Maximum number of dynamically learned MAC addresses that can be added to the ARP table (131072 - 2147483647).",
					]
					type: "int"
				}
				asymroute: {
					description: [
						"Enable/disable asymmetric route.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				auth_cert: {
					description: [
						"Server certificate that the FortiGate uses for HTTPS firewall authentication connections. Source certificate.local.name.",
					]
					type: "str"
				}
				auth_http_port: {
					description: [
						"User authentication HTTP port. (1 - 65535).",
					]
					type: "int"
				}
				auth_https_port: {
					description: [
						"User authentication HTTPS port. (1 - 65535).",
					]
					type: "int"
				}
				auth_keepalive: {
					description: [
						"Enable to prevent user authentication sessions from timing out when idle.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				auth_session_limit: {
					description: [
						"Action to take when the number of allowed user authenticated sessions is reached.",
					]
					type: "str"
					choices: [
						"block-new",
						"logout-inactive",
					]
				}
				auto_auth_extension_device: {
					description: [
						"Enable/disable automatic authorization of dedicated Fortinet extension devices.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				av_affinity: {
					description: [
						"Affinity setting for AV scanning (hexadecimal value up to 256 bits in the format of xxxxxxxxxxxxxxxx).",
					]
					type: "str"
				}
				av_failopen: {
					description: [
						"Set the action to take if the FortiGate is running low on memory or the proxy connection limit has been reached.",
					]
					type: "str"
					choices: [
						"pass",
						false,
						"one-shot",
					]
				}
				av_failopen_session: {
					description: [
						"When enabled and a proxy for a protocol runs out of room in its session table, that protocol goes into failopen mode and enacts the action specified by av-failopen.",
					]

					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				batch_cmdb: {
					description: [
						"Enable/disable batch mode, allowing you to enter a series of CLI commands that will execute as a group once they are loaded.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				block_session_timer: {
					description: [
						"Duration in seconds for blocked sessions (1 - 300 sec  (5 minutes)).",
					]
					type: "int"
				}
				br_fdb_max_entry: {
					description: [
						"Maximum number of bridge forwarding database (FDB) entries.",
					]
					type: "int"
				}
				cert_chain_max: {
					description: [
						"Maximum number of certificates that can be traversed in a certificate chain.",
					]
					type: "int"
				}
				cfg_revert_timeout: {
					description: [
						"Time-out for reverting to the last saved configuration.",
					]
					type: "int"
				}
				cfg_save: {
					description: [
						"Configuration file save mode for CLI changes.",
					]
					type: "str"
					choices: [
						"automatic",
						"manual",
						"revert",
					]
				}
				check_protocol_header: {
					description: [
						"Level of checking performed on protocol headers. Strict checking is more thorough but may affect performance. Loose checking is ok in most cases.",
					]

					type: "str"
					choices: [
						"loose",
						"strict",
					]
				}
				check_reset_range: {
					description: [
						"Configure ICMP error message verification. You can either apply strict RST range checking or disable it.",
					]
					type: "str"
					choices: [
						"strict",
						"disable",
					]
				}
				cli_audit_log: {
					description: [
						"Enable/disable CLI audit log.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				clt_cert_req: {
					description: [
						"Enable/disable requiring administrators to have a client certificate to log into the GUI using HTTPS.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				compliance_check: {
					description: [
						"Enable/disable global PCI DSS compliance check.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				compliance_check_time: {
					description: [
						"Time of day to run scheduled PCI DSS compliance checks.",
					]
					type: "str"
				}
				cpu_use_threshold: {
					description: [
						"Threshold at which CPU usage is reported. (% of total CPU).",
					]
					type: "int"
				}
				csr_ca_attribute: {
					description: [
						"Enable/disable the CA attribute in certificates. Some CA servers reject CSRs that have the CA attribute.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				daily_restart: {
					description: [
						"Enable/disable daily restart of FortiGate unit. Use the restart-time option to set the time of day for the restart.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				device_identification_active_scan_delay: {
					description: [
						"Number of seconds to passively scan a device before performing an active scan. (20 - 3600 sec, (20 sec to 1 hour)).",
					]
					type: "int"
				}
				device_idle_timeout: {
					description: [
						"Time in seconds that a device must be idle to automatically log the device user out. (30 - 31536000 sec (30 sec to 1 year)).",
					]
					type: "int"
				}
				dh_params: {
					description: [
						"Number of bits to use in the Diffie-Hellman exchange for HTTPS/SSH protocols.",
					]
					type: "str"
					choices: [
						1024,
						1536,
						2048,
						3072,
						4096,
						6144,
						8192,
					]
				}
				dnsproxy_worker_count: {
					description: [
						"DNS proxy worker count.",
					]
					type: "int"
				}
				dst: {
					description: [
						"Enable/disable daylight saving time.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				endpoint_control_fds_access: {
					description: [
						"Enable/disable access to the FortiGuard network for non-compliant endpoints.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				endpoint_control_portal_port: {
					description: [
						"Endpoint control portal port (1 - 65535).",
					]
					type: "int"
				}
				failtime: {
					description: [
						"Fail-time for server lost.",
					]
					type: "int"
				}
				fds_statistics: {
					description: [
						"Enable/disable sending IPS, Application Control, and AntiVirus data to FortiGuard. This data is used to improve FortiGuard services and is not shared with external parties and is protected by Fortinet's privacy policy.",
					]

					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				fds_statistics_period: {
					description: [
						"FortiGuard statistics collection period in minutes. (1 - 1440 min (1 min to 24 hours)).",
					]
					type: "int"
				}
				fgd_alert_subscription: {
					description: [
						"Type of alert to retrieve from FortiGuard.",
					]
					type: "str"
					choices: [
						"advisory",
						"latest-threat",
						"latest-virus",
						"latest-attack",
						"new-antivirus-db",
						"new-attack-db",
					]
				}
				fortiextender: {
					description: [
						"Enable/disable FortiExtender.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				fortiextender_data_port: {
					description: [
						"FortiExtender data port (1024 - 49150).",
					]
					type: "int"
				}
				fortiextender_vlan_mode: {
					description: [
						"Enable/disable FortiExtender VLAN mode.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				fortiservice_port: {
					description: [
						"FortiService port (1 - 65535). Used by FortiClient endpoint compliance. Older versions of FortiClient used a different port.",
					]
					type: "int"
				}
				gui_certificates: {
					description: [
						"Enable/disable the System > Certificate GUI page, allowing you to add and configure certificates from the GUI.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				gui_custom_language: {
					description: [
						"Enable/disable custom languages in GUI.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				gui_date_format: {
					description: [
						"Default date format used throughout GUI.",
					]
					type: "str"
					choices: [
						"yyyy/MM/dd",
						"dd/MM/yyyy",
						"MM/dd/yyyy",
						"yyyy-MM-dd",
						"dd-MM-yyyy",
						"MM-dd-yyyy",
					]
				}
				gui_device_latitude: {
					description: [
						"Add the latitude of the location of this FortiGate to position it on the Threat Map.",
					]
					type: "str"
				}
				gui_device_longitude: {
					description: [
						"Add the longitude of the location of this FortiGate to position it on the Threat Map.",
					]
					type: "str"
				}
				gui_display_hostname: {
					description: [
						"Enable/disable displaying the FortiGate's hostname on the GUI login page.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				gui_ipv6: {
					description: [
						"Enable/disable IPv6 settings on the GUI.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				gui_lines_per_page: {
					description: [
						"Number of lines to display per page for web administration.",
					]
					type: "int"
				}
				gui_theme: {
					description: [
						"Color scheme for the administration GUI.",
					]
					type: "str"
					choices: [
						"green",
						"red",
						"blue",
						"melongene",
						"mariner",
					]
				}
				gui_wireless_opensecurity: {
					description: [
						"Enable/disable wireless open security option on the GUI.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				honor_df: {
					description: [
						"Enable/disable honoring of Don't-Fragment (DF) flag.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				hostname: {
					description: [
						"FortiGate unit's hostname. Most models will truncate names longer than 24 characters. Some models support hostnames up to 35 characters.",
					]
					type: "str"
				}
				igmp_state_limit: {
					description: [
						"Maximum number of IGMP memberships (96 - 64000).",
					]
					type: "int"
				}
				interval: {
					description: [
						"Dead gateway detection interval.",
					]
					type: "int"
				}
				ip_src_port_range: {
					description: [
						"IP source port range used for traffic originating from the FortiGate unit.",
					]
					type: "str"
				}
				ips_affinity: {
					description: [
						"Affinity setting for IPS (hexadecimal value up to 256 bits in the format of xxxxxxxxxxxxxxxx; allowed CPUs must be less than total number of IPS engine daemons).",
					]

					type: "str"
				}
				ipsec_asic_offload: {
					description: [
						"Enable/disable ASIC offloading (hardware acceleration) for IPsec VPN traffic. Hardware acceleration can offload IPsec VPN sessions and accelerate encryption and decryption.",
					]

					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				ipsec_hmac_offload: {
					description: [
						"Enable/disable offloading (hardware acceleration) of HMAC processing for IPsec VPN.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				ipsec_soft_dec_async: {
					description: [
						"Enable/disable software decryption asynchronization (using multiple CPUs to do decryption) for IPsec VPN traffic.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				ipv6_accept_dad: {
					description: [
						"Enable/disable acceptance of IPv6 Duplicate Address Detection (DAD).",
					]
					type: "int"
				}
				ipv6_allow_anycast_probe: {
					description: [
						"Enable/disable IPv6 address probe through Anycast.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				language: {
					description: [
						"GUI display language.",
					]
					type: "str"
					choices: [
						"english",
						"french",
						"spanish",
						"portuguese",
						"japanese",
						"trach",
						"simch",
						"korean",
					]
				}
				ldapconntimeout: {
					description: [
						"Global timeout for connections with remote LDAP servers in milliseconds (1 - 300000).",
					]
					type: "int"
				}
				lldp_transmission: {
					description: [
						"Enable/disable Link Layer Discovery Protocol (LLDP) transmission.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				log_ssl_connection: {
					description: [
						"Enable/disable logging of SSL connection events.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				log_uuid: {
					description: [
						"Whether UUIDs are added to traffic logs. You can disable UUIDs, add firewall policy UUIDs to traffic logs, or add all UUIDs to traffic logs.",
					]

					type: "str"
					choices: [
						"disable",
						"policy-only",
						"extended",
					]
				}
				login_timestamp: {
					description: [
						"Enable/disable login time recording.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				long_vdom_name: {
					description: [
						"Enable/disable long VDOM name support.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				management_vdom: {
					description: [
						"Management virtual domain name. Source system.vdom.name.",
					]
					type: "str"
				}
				max_dlpstat_memory: {
					description: [
						"Maximum DLP stat memory (0 - 4294967295).",
					]
					type: "int"
				}
				max_route_cache_size: {
					description: [
						"Maximum number of IP route cache entries (0 - 2147483647).",
					]
					type: "int"
				}
				mc_ttl_notchange: {
					description: [
						"Enable/disable no modification of multicast TTL.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				memory_use_threshold_extreme: {
					description: [
						"Threshold at which memory usage is considered extreme (new sessions are dropped) (% of total RAM).",
					]
					type: "int"
				}
				memory_use_threshold_green: {
					description: [
						"Threshold at which memory usage forces the FortiGate to exit conserve mode (% of total RAM).",
					]
					type: "int"
				}
				memory_use_threshold_red: {
					description: [
						"Threshold at which memory usage forces the FortiGate to enter conserve mode (% of total RAM).",
					]
					type: "int"
				}
				miglog_affinity: {
					description: [
						"Affinity setting for logging (64-bit hexadecimal value in the format of xxxxxxxxxxxxxxxx).",
					]
					type: "str"
				}
				miglogd_children: {
					description: [
						"Number of logging (miglogd) processes to be allowed to run. Higher number can reduce performance; lower number can slow log processing time. No logs will be dropped or lost if the number is changed.",
					]

					type: "int"
				}
				multi_factor_authentication: {
					description: [
						"Enforce all login methods to require an additional authentication factor .",
					]
					type: "str"
					choices: [
						"optional",
						"mandatory",
					]
				}
				multicast_forward: {
					description: [
						"Enable/disable multicast forwarding.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				ndp_max_entry: {
					description: [
						"Maximum number of NDP table entries (set to 65,536 or higher; if set to 0, kernel holds 65,536 entries).",
					]
					type: "int"
				}
				per_user_bwl: {
					description: [
						"Enable/disable per-user black/white list filter.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				policy_auth_concurrent: {
					description: [
						"Number of concurrent firewall use logins from the same user (1 - 100).",
					]
					type: "int"
				}
				post_login_banner: {
					description: [
						"Enable/disable displaying the administrator access disclaimer message after an administrator successfully logs in.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				pre_login_banner: {
					description: [
						"Enable/disable displaying the administrator access disclaimer message on the login page before an administrator logs in.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				private_data_encryption: {
					description: [
						"Enable/disable private data encryption using an AES 128-bit key.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				proxy_auth_lifetime: {
					description: [
						"Enable/disable authenticated users lifetime control.  This is a cap on the total time a proxy user can be authenticated for after which re-authentication will take place.",
					]

					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				proxy_auth_lifetime_timeout: {
					description: [
						"Lifetime timeout in minutes for authenticated users (5  - 65535 min).",
					]
					type: "int"
				}
				proxy_auth_timeout: {
					description: [
						"Authentication timeout in minutes for authenticated users (1 - 300 min).",
					]
					type: "int"
				}
				proxy_cipher_hardware_acceleration: {
					description: [
						"Enable/disable using content processor (CP8 or CP9) hardware acceleration to encrypt and decrypt IPsec and SSL traffic.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				proxy_kxp_hardware_acceleration: {
					description: [
						"Enable/disable using the content processor to accelerate KXP traffic.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				proxy_re_authentication_mode: {
					description: [
						"Control if users must re-authenticate after a session is closed, traffic has been idle, or from the point at which the user was first created.",
					]

					type: "str"
					choices: [
						"session",
						"traffic",
						"absolute",
					]
				}
				proxy_worker_count: {
					description: [
						"Proxy worker count.",
					]
					type: "int"
				}
				radius_port: {
					description: [
						"RADIUS service port number.",
					]
					type: "int"
				}
				reboot_upon_config_restore: {
					description: [
						"Enable/disable reboot of system upon restoring configuration.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				refresh: {
					description: [
						"Statistics refresh interval in GUI.",
					]
					type: "int"
				}
				remoteauthtimeout: {
					description: [
						"Number of seconds that the FortiGate waits for responses from remote RADIUS, LDAP, or TACACS+ authentication servers. (0-300 sec).",
					]
					type: "int"
				}
				reset_sessionless_tcp: {
					description: [
						"Action to perform if the FortiGate receives a TCP packet but cannot find a corresponding session in its session table. NAT/Route mode only.",
					]

					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				restart_time: {
					description: [
						"Daily restart time (hh:mm).",
					]
					type: "str"
				}
				revision_backup_on_logout: {
					description: [
						"Enable/disable back-up of the latest configuration revision when an administrator logs out of the CLI or GUI.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				revision_image_auto_backup: {
					description: [
						"Enable/disable back-up of the latest configuration revision after the firmware is upgraded.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				scanunit_count: {
					description: [
						"Number of scanunits. The range and the default depend on the number of CPUs. Only available on FortiGate units with multiple CPUs.",
					]
					type: "int"
				}
				security_rating_result_submission: {
					description: [
						"Enable/disable the submission of Security Rating results to FortiGuard.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				security_rating_run_on_schedule: {
					description: [
						"Enable/disable scheduled runs of Security Rating.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				send_pmtu_icmp: {
					description: [
						"Enable/disable sending of path maximum transmission unit (PMTU) - ICMP destination unreachable packet and to support PMTUD protocol on your network to reduce fragmentation of packets.",
					]

					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				snat_route_change: {
					description: [
						"Enable/disable the ability to change the static NAT route.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				special_file_23_support: {
					description: [
						"Enable/disable IPS detection of HIBUN format files when using Data Leak Protection.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				ssd_trim_date: {
					description: [
						"Date within a month to run ssd trim.",
					]
					type: "int"
				}
				ssd_trim_freq: {
					description: [
						"How often to run SSD Trim . SSD Trim prevents SSD drive data loss by finding and isolating errors.",
					]
					type: "str"
					choices: [
						"never",
						"hourly",
						"daily",
						"weekly",
						"monthly",
					]
				}
				ssd_trim_hour: {
					description: [
						"Hour of the day on which to run SSD Trim (0 - 23).",
					]
					type: "int"
				}
				ssd_trim_min: {
					description: [
						"Minute of the hour on which to run SSD Trim (0 - 59, 60 for random).",
					]
					type: "int"
				}
				ssd_trim_weekday: {
					description: [
						"Day of week to run SSD Trim.",
					]
					type: "str"
					choices: [
						"sunday",
						"monday",
						"tuesday",
						"wednesday",
						"thursday",
						"friday",
						"saturday",
					]
				}
				ssh_cbc_cipher: {
					description: [
						"Enable/disable CBC cipher for SSH access.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				ssh_hmac_md5: {
					description: [
						"Enable/disable HMAC-MD5 for SSH access.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				ssh_kex_sha1: {
					description: [
						"Enable/disable SHA1 key exchange for SSH access.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				ssl_min_proto_version: {
					description: [
						"Minimum supported protocol version for SSL/TLS connections .",
					]
					type: "str"
					choices: [
						"SSLv3",
						"TLSv1",
						"TLSv1-1",
						"TLSv1-2",
					]
				}
				ssl_static_key_ciphers: {
					description: [
						"Enable/disable static key ciphers in SSL/TLS connections (e.g. AES128-SHA, AES256-SHA, AES128-SHA256, AES256-SHA256).",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				sslvpn_cipher_hardware_acceleration: {
					description: [
						"Enable/disable SSL VPN hardware acceleration.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				sslvpn_kxp_hardware_acceleration: {
					description: [
						"Enable/disable SSL VPN KXP hardware acceleration.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				sslvpn_max_worker_count: {
					description: [
						"Maximum number of SSL VPN processes. Upper limit for this value is the number of CPUs and depends on the model.",
					]
					type: "int"
				}
				sslvpn_plugin_version_check: {
					description: [
						"Enable/disable checking browser's plugin version by SSL VPN.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				strict_dirty_session_check: {
					description: [
						"Enable to check the session against the original policy when revalidating. This can prevent dropping of redirected sessions when web-filtering and authentication are enabled together. If this option is enabled, the FortiGate unit deletes a session if a routing or policy change causes the session to no longer match the policy that originally allowed the session.",
					]

					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				strong_crypto: {
					description: [
						"Enable to use strong encryption and only allow strong ciphers (AES, 3DES) and digest (SHA1) for HTTPS/SSH/TLS/SSL functions.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				switch_controller: {
					description: [
						"Enable/disable switch controller feature. Switch controller allows you to manage FortiSwitch from the FortiGate itself.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				switch_controller_reserved_network: {
					description: [
						"Enable reserved network subnet for controlled switches. This is available when the switch controller is enabled.",
					]
					type: "str"
				}
				sys_perf_log_interval: {
					description: [
						"Time in minutes between updates of performance statistics logging. (1 - 15 min).",
					]
					type: "int"
				}
				tcp_halfclose_timer: {
					description: [
						"Number of seconds the FortiGate unit should wait to close a session after one peer has sent a FIN packet but the other has not responded (1 - 86400 sec (1 day)).",
					]

					type: "int"
				}
				tcp_halfopen_timer: {
					description: [
						"Number of seconds the FortiGate unit should wait to close a session after one peer has sent an open session packet but the other has not responded (1 - 86400 sec (1 day)).",
					]

					type: "int"
				}
				tcp_option: {
					description: [
						"Enable SACK, timestamp and MSS TCP options.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				tcp_timewait_timer: {
					description: [
						"Length of the TCP TIME-WAIT state in seconds.",
					]
					type: "int"
				}
				tftp: {
					description: [
						"Enable/disable TFTP.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				timezone: {
					description: [
						"Number corresponding to your time zone from 00 to 86. Enter set timezone ? to view the list of time zones and the numbers that represent them.",
					]

					type: "str"
					choices: [
						0o1,
						0o2,
						0o3,
						0o4,
						0o5,
						81,
						0o6,
						0o7,
						08,
						09,
						10,
						11,
						12,
						13,
						74,
						14,
						77,
						15,
						87,
						16,
						17,
						18,
						19,
						20,
						75,
						21,
						22,
						23,
						24,
						80,
						79,
						25,
						26,
						27,
						28,
						78,
						29,
						30,
						31,
						32,
						33,
						34,
						35,
						36,
						37,
						38,
						83,
						84,
						40,
						85,
						41,
						42,
						43,
						39,
						44,
						46,
						47,
						51,
						48,
						45,
						49,
						50,
						52,
						53,
						54,
						55,
						56,
						57,
						58,
						59,
						60,
						62,
						63,
						61,
						64,
						65,
						66,
						67,
						68,
						69,
						70,
						71,
						72,
						0o0,
						82,
						73,
						86,
						76,
					]
				}
				tp_mc_skip_policy: {
					description: [
						"Enable/disable skip policy check and allow multicast through.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				traffic_priority: {
					description: [
						"Choose Type of Service (ToS) or Differentiated Services Code Point (DSCP) for traffic prioritization in traffic shaping.",
					]
					type: "str"
					choices: [
						"tos",
						"dscp",
					]
				}
				traffic_priority_level: {
					description: [
						"Default system-wide level of priority for traffic prioritization.",
					]
					type: "str"
					choices: [
						"low",
						"medium",
						"high",
					]
				}
				two_factor_email_expiry: {
					description: [
						"Email-based two-factor authentication session timeout (30 - 300 seconds (5 minutes)).",
					]
					type: "int"
				}
				two_factor_fac_expiry: {
					description: [
						"FortiAuthenticator token authentication session timeout (10 - 3600 seconds (1 hour)).",
					]
					type: "int"
				}
				two_factor_ftk_expiry: {
					description: [
						"FortiToken authentication session timeout (60 - 600 sec (10 minutes)).",
					]
					type: "int"
				}
				two_factor_ftm_expiry: {
					description: [
						"FortiToken Mobile session timeout (1 - 168 hours (7 days)).",
					]
					type: "int"
				}
				two_factor_sms_expiry: {
					description: [
						"SMS-based two-factor authentication session timeout (30 - 300 sec).",
					]
					type: "int"
				}
				udp_idle_timer: {
					description: [
						"UDP connection session timeout. This command can be useful in managing CPU and memory resources (1 - 86400 seconds (1 day)).",
					]
					type: "int"
				}
				user_server_cert: {
					description: [
						"Certificate to use for https user authentication. Source certificate.local.name.",
					]
					type: "str"
				}
				vdom_admin: {
					description: [
						"Enable/disable support for multiple virtual domains (VDOMs).",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				vip_arp_range: {
					description: [
						"Controls the number of ARPs that the FortiGate sends for a Virtual IP (VIP) address range.",
					]
					type: "str"
					choices: [
						"unlimited",
						"restricted",
					]
				}
				virtual_server_count: {
					description: [
						"Maximum number of virtual server processes to create. The maximum is the number of CPU cores. This is not available on single-core CPUs.",
					]
					type: "int"
				}
				virtual_server_hardware_acceleration: {
					description: [
						"Enable/disable virtual server hardware acceleration.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				wad_affinity: {
					description: [
						"Affinity setting for wad (hexadecimal value up to 256 bits in the format of xxxxxxxxxxxxxxxx).",
					]
					type: "str"
				}
				wad_csvc_cs_count: {
					description: [
						"Number of concurrent WAD-cache-service object-cache processes.",
					]
					type: "int"
				}
				wad_csvc_db_count: {
					description: [
						"Number of concurrent WAD-cache-service byte-cache processes.",
					]
					type: "int"
				}
				wad_source_affinity: {
					description: [
						"Enable/disable dispatching traffic to WAD workers based on source affinity.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				wad_worker_count: {
					description: [
						"Number of explicit proxy WAN optimization daemon (WAD) processes. By default WAN optimization, explicit proxy, and web caching is handled by all of the CPU cores in a FortiGate unit.",
					]

					type: "int"
				}
				wifi_ca_certificate: {
					description: [
						"CA certificate that verifies the WiFi certificate. Source certificate.ca.name.",
					]
					type: "str"
				}
				wifi_certificate: {
					description: [
						"Certificate to use for WiFi authentication. Source certificate.local.name.",
					]
					type: "str"
				}
				wimax_4g_usb: {
					description: [
						"Enable/disable comparability with WiMAX 4G USB devices.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				wireless_controller: {
					description: [
						"Enable/disable the wireless controller feature to use the FortiGate unit to manage FortiAPs.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				wireless_controller_port: {
					description: [
						"Port used for the control channel in wireless controller mode (wireless-mode is ac). The data channel port is the control channel port number plus one (1024 - 49150).",
					]

					type: "int"
				}
			}
		}
	}
}
