package ansible

module: fortios_wireless_controller_vap: {
	module:            "fortios_wireless_controller_vap"
	short_description: "Configure Virtual Access Points (VAPs) in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify wireless_controller feature and vap category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
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
		state: {
			description: [
				"Indicates whether to create or remove the object. This attribute was present already in previous version in a deeper level. It has been moved out to this outer level.",
			]

			type:     "str"
			required: false
			choices: [
				"present",
				"absent",
			]
			version_added: 2.9
		}
		wireless_controller_vap: {
			description: [
				"Configure Virtual Access Points (VAPs).",
			]
			default: null
			type:    "dict"
			suboptions: {
				state: {
					description: [
						"B(Deprecated)",
						"Starting with Ansible 2.9 we recommend using the top-level 'state' parameter.",
						"HORIZONTALLINE",
						"Indicates whether to create or remove the object.",
					]
					type:     "str"
					required: false
					choices: [
						"present",
						"absent",
					]
				}
				acct_interim_interval: {
					description: [
						"WiFi RADIUS accounting interim interval (60 - 86400 sec).",
					]
					type: "int"
				}
				alias: {
					description: [
						"Alias.",
					]
					type: "str"
				}
				auth: {
					description: [
						"Authentication protocol.",
					]
					type: "str"
					choices: [
						"psk",
						"radius",
						"usergroup",
					]
				}
				broadcast_ssid: {
					description: [
						"Enable/disable broadcasting the SSID .",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				broadcast_suppression: {
					description: [
						"Optional suppression of broadcast messages. For example, you can keep DHCP messages, ARP broadcasts, and so on off of the wireless network.",
					]

					type: "str"
					choices: [
						"dhcp-up",
						"dhcp-down",
						"dhcp-starvation",
						"arp-known",
						"arp-unknown",
						"arp-reply",
						"arp-poison",
						"arp-proxy",
						"netbios-ns",
						"netbios-ds",
						"ipv6",
						"all-other-mc",
						"all-other-bc",
					]
				}
				captive_portal_ac_name: {
					description: [
						"Local-bridging captive portal ac-name.",
					]
					type: "str"
				}
				captive_portal_macauth_radius_secret: {
					description: [
						"Secret key to access the macauth RADIUS server.",
					]
					type: "str"
				}
				captive_portal_macauth_radius_server: {
					description: [
						"Captive portal external RADIUS server domain name or IP address.",
					]
					type: "str"
				}
				captive_portal_radius_secret: {
					description: [
						"Secret key to access the RADIUS server.",
					]
					type: "str"
				}
				captive_portal_radius_server: {
					description: [
						"Captive portal RADIUS server domain name or IP address.",
					]
					type: "str"
				}
				captive_portal_session_timeout_interval: {
					description: [
						"Session timeout interval (0 - 864000 sec).",
					]
					type: "int"
				}
				dhcp_lease_time: {
					description: [
						"DHCP lease time in seconds for NAT IP address.",
					]
					type: "int"
				}
				dhcp_option82_circuit_id_insertion: {
					description: [
						"Enable/disable DHCP option 82 circuit-id insert .",
					]
					type: "str"
					choices: [
						"style-1",
						"style-2",
						"disable",
					]
				}
				dhcp_option82_insertion: {
					description: [
						"Enable/disable DHCP option 82 insert .",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				dhcp_option82_remote_id_insertion: {
					description: [
						"Enable/disable DHCP option 82 remote-id insert .",
					]
					type: "str"
					choices: [
						"style-1",
						"disable",
					]
				}
				dynamic_vlan: {
					description: [
						"Enable/disable dynamic VLAN assignment.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				eap_reauth: {
					description: [
						"Enable/disable EAP re-authentication for WPA-Enterprise security.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				eap_reauth_intv: {
					description: [
						"EAP re-authentication interval (1800 - 864000 sec).",
					]
					type: "int"
				}
				eapol_key_retries: {
					description: [
						"Enable/disable retransmission of EAPOL-Key frames (message 3/4 and group message 1/2) .",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				encrypt: {
					description: [
						"Encryption protocol to use (only available when security is set to a WPA type).",
					]
					type: "str"
					choices: [
						"TKIP",
						"AES",
						"TKIP-AES",
					]
				}
				external_fast_roaming: {
					description: [
						"Enable/disable fast roaming or pre-authentication with external APs not managed by the FortiGate .",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				external_logout: {
					description: [
						"URL of external authentication logout server.",
					]
					type: "str"
				}
				external_web: {
					description: [
						"URL of external authentication web server.",
					]
					type: "str"
				}
				fast_bss_transition: {
					description: [
						"Enable/disable 802.11r Fast BSS Transition (FT) .",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				fast_roaming: {
					description: [
						"Enable/disable fast-roaming, or pre-authentication, where supported by clients .",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				ft_mobility_domain: {
					description: [
						"Mobility domain identifier in FT (1 - 65535).",
					]
					type: "int"
				}
				ft_over_ds: {
					description: [
						"Enable/disable FT over the Distribution System (DS).",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				ft_r0_key_lifetime: {
					description: [
						"Lifetime of the PMK-R0 key in FT, 1-65535 minutes.",
					]
					type: "int"
				}
				gtk_rekey: {
					description: [
						"Enable/disable GTK rekey for WPA security.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				gtk_rekey_intv: {
					description: [
						"GTK rekey interval (1800 - 864000 sec).",
					]
					type: "int"
				}
				hotspot20_profile: {
					description: [
						"Hotspot 2.0 profile name.",
					]
					type: "str"
				}
				intra_vap_privacy: {
					description: [
						"Enable/disable blocking communication between clients on the same SSID (called intra-SSID privacy) .",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				ip: {
					description: [
						"IP address and subnet mask for the local standalone NAT subnet.",
					]
					type: "str"
				}
				key: {
					description: [
						"WEP Key.",
					]
					type: "str"
				}
				keyindex: {
					description: [
						"WEP key index (1 - 4).",
					]
					type: "int"
				}
				ldpc: {
					description: [
						"VAP low-density parity-check (LDPC) coding configuration.",
					]
					type: "str"
					choices: [
						"disable",
						"rx",
						"tx",
						"rxtx",
					]
				}
				local_authentication: {
					description: [
						"Enable/disable AP local authentication.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				local_bridging: {
					description: [
						"Enable/disable bridging of wireless and Ethernet interfaces on the FortiAP .",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				local_lan: {
					description: [
						"Allow/deny traffic destined for a Class A, B, or C private IP address .",
					]
					type: "str"
					choices: [
						"allow",
						"deny",
					]
				}
				local_standalone: {
					description: [
						"Enable/disable AP local standalone .",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				local_standalone_nat: {
					description: [
						"Enable/disable AP local standalone NAT mode.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				mac_auth_bypass: {
					description: [
						"Enable/disable MAC authentication bypass.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				mac_filter: {
					description: [
						"Enable/disable MAC filtering to block wireless clients by mac address.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				mac_filter_list: {
					description: [
						"Create a list of MAC addresses for MAC address filtering.",
					]
					type: "list"
					suboptions: {
						id: {
							description: [
								"ID.",
							]
							required: true
							type:     "int"
						}
						mac: {
							description: [
								"MAC address.",
							]
							type: "str"
						}
						mac_filter_policy: {
							description: [
								"Deny or allow the client with this MAC address.",
							]
							type: "str"
							choices: [
								"allow",
								"deny",
							]
						}
					}
				}
				mac_filter_policy_other: {
					description: [
						"Allow or block clients with MAC addresses that are not in the filter list.",
					]
					type: "str"
					choices: [
						"allow",
						"deny",
					]
				}
				max_clients: {
					description: [
						"Maximum number of clients that can connect simultaneously to the VAP .",
					]
					type: "int"
				}
				max_clients_ap: {
					description: [
						"Maximum number of clients that can connect simultaneously to each radio .",
					]
					type: "int"
				}
				me_disable_thresh: {
					description: [
						"Disable multicast enhancement when this many clients are receiving multicast traffic.",
					]
					type: "int"
				}
				mesh_backhaul: {
					description: [
						"Enable/disable using this VAP as a WiFi mesh backhaul . This entry is only available when security is set to a WPA type or open.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				mpsk: {
					description: [
						"Enable/disable multiple pre-shared keys (PSKs.)",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				mpsk_concurrent_clients: {
					description: [
						"Number of pre-shared keys (PSKs) to allow if multiple pre-shared keys are enabled.",
					]
					type: "int"
				}
				mpsk_key: {
					description: [
						"Pre-shared keys that can be used to connect to this virtual access point.",
					]
					type: "list"
					suboptions: {
						comment: {
							description: [
								"Comment.",
							]
							type: "str"
						}
						concurrent_clients: {
							description: [
								"Number of clients that can connect using this pre-shared key.",
							]
							type: "str"
						}
						key_name: {
							description: [
								"Pre-shared key name.",
							]
							type: "str"
						}
						passphrase: {
							description: [
								"WPA Pre-shared key.",
							]
							type: "str"
						}
					}
				}
				multicast_enhance: {
					description: [
						"Enable/disable converting multicast to unicast to improve performance .",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				multicast_rate: {
					description: [
						"Multicast rate (0, 6000, 12000, or 24000 kbps).",
					]
					type: "str"
					choices: [
						0,
						6000,
						12000,
						24000,
					]
				}
				name: {
					description: [
						"Virtual AP name.",
					]
					required: true
					type:     "str"
				}
				okc: {
					description: [
						"Enable/disable Opportunistic Key Caching (OKC) .",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				passphrase: {
					description: [
						"WPA pre-shard key (PSK) to be used to authenticate WiFi users.",
					]
					type: "str"
				}
				pmf: {
					description: [
						"Protected Management Frames (PMF) support .",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
						"optional",
					]
				}
				pmf_assoc_comeback_timeout: {
					description: [
						"Protected Management Frames (PMF) comeback maximum timeout (1-20 sec).",
					]
					type: "int"
				}
				pmf_sa_query_retry_timeout: {
					description: [
						"Protected Management Frames (PMF) SA query retry timeout interval (1 - 5 100s of msec).",
					]
					type: "int"
				}
				portal_message_override_group: {
					description: [
						"Replacement message group for this VAP (only available when security is set to a captive portal type).",
					]
					type: "str"
				}
				portal_message_overrides: {
					description: [
						"Individual message overrides.",
					]
					type: "dict"
					suboptions: {
						auth_disclaimer_page: {
							description: [
								"Override auth-disclaimer-page message with message from portal-message-overrides group.",
							]
							type: "str"
						}
						auth_login_failed_page: {
							description: [
								"Override auth-login-failed-page message with message from portal-message-overrides group.",
							]
							type: "str"
						}
						auth_login_page: {
							description: [
								"Override auth-login-page message with message from portal-message-overrides group.",
							]
							type: "str"
						}
						auth_reject_page: {
							description: [
								"Override auth-reject-page message with message from portal-message-overrides group.",
							]
							type: "str"
						}
					}
				}
				portal_type: {
					description: [
						"Captive portal functionality. Configure how the captive portal authenticates users and whether it includes a disclaimer.",
					]
					type: "str"
					choices: [
						"auth",
						"auth+disclaimer",
						"disclaimer",
						"email-collect",
						"cmcc",
						"cmcc-macauth",
						"auth-mac",
					]
				}
				probe_resp_suppression: {
					description: [
						"Enable/disable probe response suppression (to ignore weak signals) .",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				probe_resp_threshold: {
					description: [
						"Minimum signal level/threshold in dBm required for the AP response to probe requests (-95 to -20).",
					]
					type: "str"
				}
				ptk_rekey: {
					description: [
						"Enable/disable PTK rekey for WPA-Enterprise security.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				ptk_rekey_intv: {
					description: [
						"PTK rekey interval (1800 - 864000 sec).",
					]
					type: "int"
				}
				qos_profile: {
					description: [
						"Quality of service profile name.",
					]
					type: "str"
				}
				quarantine: {
					description: [
						"Enable/disable station quarantine .",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				radio_2g_threshold: {
					description: [
						"Minimum signal level/threshold in dBm required for the AP response to receive a packet in 2.4G band (-95 to -20).",
					]
					type: "str"
				}
				radio_5g_threshold: {
					description: [
						"Minimum signal level/threshold in dBm required for the AP response to receive a packet in 5G band(-95 to -20).",
					]
					type: "str"
				}
				radio_sensitivity: {
					description: [
						"Enable/disable software radio sensitivity (to ignore weak signals) .",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				radius_mac_auth: {
					description: [
						"Enable/disable RADIUS-based MAC authentication of clients .",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				radius_mac_auth_server: {
					description: [
						"RADIUS-based MAC authentication server.",
					]
					type: "str"
				}
				radius_mac_auth_usergroups: {
					description: [
						"Selective user groups that are permitted for RADIUS mac authentication.",
					]
					type: "list"
					suboptions: name: {
						description: [
							"User group name.",
						]
						required: true
						type:     "str"
					}
				}
				radius_server: {
					description: [
						"RADIUS server to be used to authenticate WiFi users.",
					]
					type: "str"
				}
				rates_11a: {
					description: [
						"Allowed data rates for 802.11a.",
					]
					type: "str"
					choices: [
						1,
						"1-basic",
						2,
						"2-basic",
						5.5,
						"5.5-basic",
						11,
						"11-basic",
						6,
						"6-basic",
						9,
						"9-basic",
						12,
						"12-basic",
						18,
						"18-basic",
						24,
						"24-basic",
						36,
						"36-basic",
						48,
						"48-basic",
						54,
						"54-basic",
					]
				}
				rates_11ac_ss12: {
					description: [
						"Allowed data rates for 802.11ac with 1 or 2 spatial streams.",
					]
					type: "str"
					choices: [
						"mcs0/1",
						"mcs1/1",
						"mcs2/1",
						"mcs3/1",
						"mcs4/1",
						"mcs5/1",
						"mcs6/1",
						"mcs7/1",
						"mcs8/1",
						"mcs9/1",
						"mcs10/1",
						"mcs11/1",
						"mcs0/2",
						"mcs1/2",
						"mcs2/2",
						"mcs3/2",
						"mcs4/2",
						"mcs5/2",
						"mcs6/2",
						"mcs7/2",
						"mcs8/2",
						"mcs9/2",
						"mcs10/2",
						"mcs11/2",
					]
				}
				rates_11ac_ss34: {
					description: [
						"Allowed data rates for 802.11ac with 3 or 4 spatial streams.",
					]
					type: "str"
					choices: [
						"mcs0/3",
						"mcs1/3",
						"mcs2/3",
						"mcs3/3",
						"mcs4/3",
						"mcs5/3",
						"mcs6/3",
						"mcs7/3",
						"mcs8/3",
						"mcs9/3",
						"mcs10/3",
						"mcs11/3",
						"mcs0/4",
						"mcs1/4",
						"mcs2/4",
						"mcs3/4",
						"mcs4/4",
						"mcs5/4",
						"mcs6/4",
						"mcs7/4",
						"mcs8/4",
						"mcs9/4",
						"mcs10/4",
						"mcs11/4",
					]
				}
				rates_11bg: {
					description: [
						"Allowed data rates for 802.11b/g.",
					]
					type: "str"
					choices: [
						1,
						"1-basic",
						2,
						"2-basic",
						5.5,
						"5.5-basic",
						11,
						"11-basic",
						6,
						"6-basic",
						9,
						"9-basic",
						12,
						"12-basic",
						18,
						"18-basic",
						24,
						"24-basic",
						36,
						"36-basic",
						48,
						"48-basic",
						54,
						"54-basic",
					]
				}
				rates_11n_ss12: {
					description: [
						"Allowed data rates for 802.11n with 1 or 2 spatial streams.",
					]
					type: "str"
					choices: [
						"mcs0/1",
						"mcs1/1",
						"mcs2/1",
						"mcs3/1",
						"mcs4/1",
						"mcs5/1",
						"mcs6/1",
						"mcs7/1",
						"mcs8/2",
						"mcs9/2",
						"mcs10/2",
						"mcs11/2",
						"mcs12/2",
						"mcs13/2",
						"mcs14/2",
						"mcs15/2",
					]
				}
				rates_11n_ss34: {
					description: [
						"Allowed data rates for 802.11n with 3 or 4 spatial streams.",
					]
					type: "str"
					choices: [
						"mcs16/3",
						"mcs17/3",
						"mcs18/3",
						"mcs19/3",
						"mcs20/3",
						"mcs21/3",
						"mcs22/3",
						"mcs23/3",
						"mcs24/4",
						"mcs25/4",
						"mcs26/4",
						"mcs27/4",
						"mcs28/4",
						"mcs29/4",
						"mcs30/4",
						"mcs31/4",
					]
				}
				schedule: {
					description: [
						"VAP schedule name.",
					]
					type: "str"
				}
				security: {
					description: [
						"Security mode for the wireless interface .",
					]
					type: "str"
					choices: [
						"open",
						"captive-portal",
						"wep64",
						"wep128",
						"wpa-personal",
						"wpa-personal+captive-portal",
						"wpa-enterprise",
						"wpa-only-personal",
						"wpa-only-personal+captive-portal",
						"wpa-only-enterprise",
						"wpa2-only-personal",
						"wpa2-only-personal+captive-portal",
						"wpa2-only-enterprise",
						"osen",
					]
				}
				security_exempt_list: {
					description: [
						"Optional security exempt list for captive portal authentication.",
					]
					type: "str"
				}
				security_obsolete_option: {
					description: [
						"Enable/disable obsolete security options.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				security_redirect_url: {
					description: [
						"Optional URL for redirecting users after they pass captive portal authentication.",
					]
					type: "str"
				}
				selected_usergroups: {
					description: [
						"Selective user groups that are permitted to authenticate.",
					]
					type: "list"
					suboptions: name: {
						description: [
							"User group name.",
						]
						required: true
						type:     "str"
					}
				}
				split_tunneling: {
					description: [
						"Enable/disable split tunneling .",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				ssid: {
					description: [
						"IEEE 802.11 service set identifier (SSID) for the wireless interface. Users who wish to use the wireless network must configure their computers to access this SSID name.",
					]

					type: "str"
				}
				tkip_counter_measure: {
					description: [
						"Enable/disable TKIP counter measure.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				usergroup: {
					description: [
						"Firewall user group to be used to authenticate WiFi users.",
					]
					type: "list"
					suboptions: name: {
						description: [
							"User group name.",
						]
						required: true
						type:     "str"
					}
				}
				utm_profile: {
					description: [
						"UTM profile name.",
					]
					type: "str"
				}
				vdom: {
					description: [
						"Name of the VDOM that the Virtual AP has been added to. Source system.vdom.name.",
					]
					type: "str"
				}
				vlan_auto: {
					description: [
						"Enable/disable automatic management of SSID VLAN interface.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				vlan_pool: {
					description: [
						"VLAN pool.",
					]
					type: "list"
					suboptions: {
						id: {
							description: [
								"ID.",
							]
							required: true
							type:     "int"
						}
						wtp_group: {
							description: [
								"WTP group name.",
							]
							type: "str"
						}
					}
				}
				vlan_pooling: {
					description: [
						"Enable/disable VLAN pooling, to allow grouping of multiple wireless controller VLANs into VLAN pools . When set to wtp-group, VLAN pooling occurs with VLAN assignment by wtp-group.",
					]

					type: "str"
					choices: [
						"wtp-group",
						"round-robin",
						"hash",
						"disable",
					]
				}
				vlanid: {
					description: [
						"Optional VLAN ID.",
					]
					type: "int"
				}
				voice_enterprise: {
					description: [
						"Enable/disable 802.11k and 802.11v assisted Voice-Enterprise roaming .",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
			}
		}
	}
}
