package ansible

module: fortios_system_interface: {
	module:            "fortios_system_interface"
	short_description: "Configure interfaces in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify system feature and interface category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
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
		system_interface: {
			description: [
				"Configure interfaces.",
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
				ac_name: {
					description: [
						"PPPoE server name.",
					]
					type: "str"
				}
				aggregate: {
					description: [
						"Aggregate interface.",
					]
					type: "str"
				}
				algorithm: {
					description: [
						"Frame distribution algorithm.",
					]
					type: "str"
					choices: [
						"L2",
						"L3",
						"L4",
					]
				}
				alias: {
					description: [
						"Alias will be displayed with the interface name to make it easier to distinguish.",
					]
					type: "str"
				}
				allowaccess: {
					description: [
						"Permitted types of management access to this interface.",
					]
					type: "list"
					choices: [
						"ping",
						"https",
						"ssh",
						"snmp",
						"http",
						"telnet",
						"fgfm",
						"radius-acct",
						"probe-response",
						"capwap",
						"ftm",
					]
				}
				ap_discover: {
					description: [
						"Enable/disable automatic registration of unknown FortiAP devices.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				arpforward: {
					description: [
						"Enable/disable ARP forwarding.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				auth_type: {
					description: [
						"PPP authentication type to use.",
					]
					type: "str"
					choices: [
						"auto",
						"pap",
						"chap",
						"mschapv1",
						"mschapv2",
					]
				}
				auto_auth_extension_device: {
					description: [
						"Enable/disable automatic authorization of dedicated Fortinet extension device on this interface.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				bfd: {
					description: [
						"Bidirectional Forwarding Detection (BFD) settings.",
					]
					type: "str"
					choices: [
						"global",
						"enable",
						"disable",
					]
				}
				bfd_desired_min_tx: {
					description: [
						"BFD desired minimal transmit interval.",
					]
					type: "int"
				}
				bfd_detect_mult: {
					description: [
						"BFD detection multiplier.",
					]
					type: "int"
				}
				bfd_required_min_rx: {
					description: [
						"BFD required minimal receive interval.",
					]
					type: "int"
				}
				broadcast_forticlient_discovery: {
					description: [
						"Enable/disable broadcasting FortiClient discovery messages.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				broadcast_forward: {
					description: [
						"Enable/disable broadcast forwarding.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				captive_portal: {
					description: [
						"Enable/disable captive portal.",
					]
					type: "int"
				}
				cli_conn_status: {
					description: [
						"CLI connection status.",
					]
					type: "int"
				}
				color: {
					description: [
						"Color of icon on the GUI.",
					]
					type: "int"
				}
				dedicated_to: {
					description: [
						"Configure interface for single purpose.",
					]
					type: "str"
					choices: [
						"none",
						"management",
					]
				}
				defaultgw: {
					description: [
						"Enable to get the gateway IP from the DHCP or PPPoE server.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				description: {
					description: [
						"Description.",
					]
					type: "str"
				}
				detected_peer_mtu: {
					description: [
						"MTU of detected peer (0 - 4294967295).",
					]
					type: "int"
				}
				detectprotocol: {
					description: [
						"Protocols used to detect the server.",
					]
					type: "str"
					choices: [
						"ping",
						"tcp-echo",
						"udp-echo",
					]
				}
				detectserver: {
					description: [
						"Gateway's ping server for this IP.",
					]
					type: "str"
				}
				device_access_list: {
					description: [
						"Device access list.",
					]
					type: "str"
				}
				device_identification: {
					description: [
						"Enable/disable passively gathering of device identity information about the devices on the network connected to this interface.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				device_identification_active_scan: {
					description: [
						"Enable/disable active gathering of device identity information about the devices on the network connected to this interface.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				device_netscan: {
					description: [
						"Enable/disable inclusion of devices detected on this interface in network vulnerability scans.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				device_user_identification: {
					description: [
						"Enable/disable passive gathering of user identity information about users on this interface.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				devindex: {
					description: [
						"Device Index.",
					]
					type: "int"
				}
				dhcp_client_identifier: {
					description: [
						"DHCP client identifier.",
					]
					type: "str"
				}
				dhcp_relay_agent_option: {
					description: [
						"Enable/disable DHCP relay agent option.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				dhcp_relay_ip: {
					description: [
						"DHCP relay IP address.",
					]
					type: "str"
				}
				dhcp_relay_service: {
					description: [
						"Enable/disable allowing this interface to act as a DHCP relay.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				dhcp_relay_type: {
					description: [
						"DHCP relay type (regular or IPsec).",
					]
					type: "str"
					choices: [
						"regular",
						"ipsec",
					]
				}
				dhcp_renew_time: {
					description: [
						"DHCP renew time in seconds (300-604800), 0 means use the renew time provided by the server.",
					]
					type: "int"
				}
				disc_retry_timeout: {
					description: [
						"Time in seconds to wait before retrying to start a PPPoE discovery, 0 means no timeout.",
					]
					type: "int"
				}
				disconnect_threshold: {
					description: [
						"Time in milliseconds to wait before sending a notification that this interface is down or disconnected.",
					]
					type: "int"
				}
				distance: {
					description: [
						"Distance for routes learned through PPPoE or DHCP, lower distance indicates preferred route.",
					]
					type: "int"
				}
				dns_server_override: {
					description: [
						"Enable/disable use DNS acquired by DHCP or PPPoE.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				drop_fragment: {
					description: [
						"Enable/disable drop fragment packets.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				drop_overlapped_fragment: {
					description: [
						"Enable/disable drop overlapped fragment packets.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				egress_shaping_profile: {
					description: [
						"Outgoing traffic shaping profile.",
					]
					type: "str"
				}
				endpoint_compliance: {
					description: [
						"Enable/disable endpoint compliance enforcement.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				estimated_downstream_bandwidth: {
					description: [
						"Estimated maximum downstream bandwidth (kbps). Used to estimate link utilization.",
					]
					type: "int"
				}
				estimated_upstream_bandwidth: {
					description: [
						"Estimated maximum upstream bandwidth (kbps). Used to estimate link utilization.",
					]
					type: "int"
				}
				explicit_ftp_proxy: {
					description: [
						"Enable/disable the explicit FTP proxy on this interface.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				explicit_web_proxy: {
					description: [
						"Enable/disable the explicit web proxy on this interface.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				external: {
					description: [
						"Enable/disable identifying the interface as an external interface (which usually means it's connected to the Internet).",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				fail_action_on_extender: {
					description: [
						"Action on extender when interface fail .",
					]
					type: "str"
					choices: [
						"soft-restart",
						"hard-restart",
						"reboot",
					]
				}
				fail_alert_interfaces: {
					description: [
						"Names of the FortiGate interfaces from which the link failure alert is sent for this interface.",
					]
					type: "list"
					suboptions: name: {
						description: [
							"Names of the physical interfaces belonging to the aggregate or redundant interface. Source system.interface.name.",
						]
						required: true
						type:     "str"
					}
				}
				fail_alert_method: {
					description: [
						"Select link-failed-signal or link-down method to alert about a failed link.",
					]
					type: "str"
					choices: [
						"link-failed-signal",
						"link-down",
					]
				}
				fail_detect: {
					description: [
						"Enable/disable fail detection features for this interface.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				fail_detect_option: {
					description: [
						"Options for detecting that this interface has failed.",
					]
					type: "str"
					choices: [
						"detectserver",
						"link-down",
					]
				}
				fortiheartbeat: {
					description: [
						"Enable/disable FortiHeartBeat (FortiTelemetry on GUI).",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				fortilink: {
					description: [
						"Enable FortiLink to dedicate this interface to manage other Fortinet devices.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				fortilink_backup_link: {
					description: [
						"fortilink split interface backup link.",
					]
					type: "int"
				}
				fortilink_split_interface: {
					description: [
						"Enable/disable FortiLink split interface to connect member link to different FortiSwitch in stack for uplink redundancy (maximum 2 interfaces in the \"members\" command).",
					]

					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				fortilink_stacking: {
					description: [
						"Enable/disable FortiLink switch-stacking on this interface.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				forward_domain: {
					description: [
						"Transparent mode forward domain.",
					]
					type: "int"
				}
				gwdetect: {
					description: [
						"Enable/disable detect gateway alive for first.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				ha_priority: {
					description: [
						"HA election priority for the PING server.",
					]
					type: "int"
				}
				icmp_accept_redirect: {
					description: [
						"Enable/disable ICMP accept redirect.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				icmp_send_redirect: {
					description: [
						"Enable/disable ICMP send redirect.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				ident_accept: {
					description: [
						"Enable/disable authentication for this interface.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				idle_timeout: {
					description: [
						"PPPoE auto disconnect after idle timeout seconds, 0 means no timeout.",
					]
					type: "int"
				}
				inbandwidth: {
					description: [
						"Bandwidth limit for incoming traffic (0 - 16776000 kbps), 0 means unlimited.",
					]
					type: "int"
				}
				ingress_spillover_threshold: {
					description: [
						"Ingress Spillover threshold (0 - 16776000 kbps).",
					]
					type: "int"
				}
				interface: {
					description: [
						"Interface name. Source system.interface.name.",
					]
					type: "str"
				}
				internal: {
					description: [
						"Implicitly created.",
					]
					type: "int"
				}
				ip: {
					description: [
						"Interface IPv4 address and subnet mask, syntax: X.X.X.X/24.",
					]
					type: "str"
				}
				ipmac: {
					description: [
						"Enable/disable IP/MAC binding.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				ips_sniffer_mode: {
					description: [
						"Enable/disable the use of this interface as a one-armed sniffer.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				ipunnumbered: {
					description: [
						"Unnumbered IP used for PPPoE interfaces for which no unique local address is provided.",
					]
					type: "str"
				}
				ipv6: {
					description: [
						"IPv6 of interface.",
					]
					type: "dict"
					suboptions: {
						autoconf: {
							description: [
								"Enable/disable address auto config.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						dhcp6_client_options: {
							description: [
								"DHCPv6 client options.",
							]
							type: "str"
							choices: [
								"rapid",
								"iapd",
								"iana",
							]
						}
						dhcp6_information_request: {
							description: [
								"Enable/disable DHCPv6 information request.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						dhcp6_prefix_delegation: {
							description: [
								"Enable/disable DHCPv6 prefix delegation.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						dhcp6_prefix_hint: {
							description: [
								"DHCPv6 prefix that will be used as a hint to the upstream DHCPv6 server.",
							]
							type: "str"
						}
						dhcp6_prefix_hint_plt: {
							description: [
								"DHCPv6 prefix hint preferred life time (sec), 0 means unlimited lease time.",
							]
							type: "int"
						}
						dhcp6_prefix_hint_vlt: {
							description: [
								"DHCPv6 prefix hint valid life time (sec).",
							]
							type: "int"
						}
						dhcp6_relay_ip: {
							description: [
								"DHCPv6 relay IP address.",
							]
							type: "str"
						}
						dhcp6_relay_service: {
							description: [
								"Enable/disable DHCPv6 relay.",
							]
							type: "str"
							choices: [
								"disable",
								"enable",
							]
						}
						dhcp6_relay_type: {
							description: [
								"DHCPv6 relay type.",
							]
							type: "str"
							choices: [
								"regular",
							]
						}
						ip6_address: {
							description: [
								"Primary IPv6 address prefix, syntax: xxxx:xxxx:xxxx:xxxx:xxxx:xxxx:xxxx:xxxx/xxx",
							]
							type: "str"
						}
						ip6_allowaccess: {
							description: [
								"Allow management access to the interface.",
							]
							type: "list"
							choices: [
								"ping",
								"https",
								"ssh",
								"snmp",
								"http",
								"telnet",
								"fgfm",
								"capwap",
							]
						}
						ip6_default_life: {
							description: [
								"Default life (sec).",
							]
							type: "int"
						}
						ip6_delegated_prefix_list: {
							description: [
								"Advertised IPv6 delegated prefix list.",
							]
							type: "list"
							suboptions: {
								autonomous_flag: {
									description: [
										"Enable/disable the autonomous flag.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								onlink_flag: {
									description: [
										"Enable/disable the onlink flag.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								prefix_id: {
									description: [
										"Prefix ID.",
									]
									type: "int"
								}
								rdnss: {
									description: [
										"Recursive DNS server option.",
									]
									type: "str"
								}
								rdnss_service: {
									description: [
										"Recursive DNS service option.",
									]
									type: "str"
									choices: [
										"delegated",
										"default",
										"specify",
									]
								}
								subnet: {
									description: [
										"Add subnet ID to routing prefix.",
									]
									type: "str"
								}
								upstream_interface: {
									description: [
										"Name of the interface that provides delegated information. Source system.interface.name.",
									]
									type: "str"
								}
							}
						}
						ip6_dns_server_override: {
							description: [
								"Enable/disable using the DNS server acquired by DHCP.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						ip6_extra_addr: {
							description: [
								"Extra IPv6 address prefixes of interface.",
							]
							type: "list"
							suboptions: prefix: {
								description: [
									"IPv6 address prefix.",
								]
								required: true
								type:     "str"
							}
						}
						ip6_hop_limit: {
							description: [
								"Hop limit (0 means unspecified).",
							]
							type: "int"
						}
						ip6_link_mtu: {
							description: [
								"IPv6 link MTU.",
							]
							type: "int"
						}
						ip6_manage_flag: {
							description: [
								"Enable/disable the managed flag.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						ip6_max_interval: {
							description: [
								"IPv6 maximum interval (4 to 1800 sec).",
							]
							type: "int"
						}
						ip6_min_interval: {
							description: [
								"IPv6 minimum interval (3 to 1350 sec).",
							]
							type: "int"
						}
						ip6_mode: {
							description: [
								"Addressing mode (static, DHCP, delegated).",
							]
							type: "str"
							choices: [
								"static",
								"dhcp",
								"pppoe",
								"delegated",
							]
						}
						ip6_other_flag: {
							description: [
								"Enable/disable the other IPv6 flag.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						ip6_prefix_list: {
							description: [
								"Advertised prefix list.",
							]
							type: "list"
							suboptions: {
								autonomous_flag: {
									description: [
										"Enable/disable the autonomous flag.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								dnssl: {
									description: [
										"DNS search list option.",
									]
									type: "list"
									suboptions: domain: {
										description: [
											"Domain name.",
										]
										required: true
										type:     "str"
									}
								}
								onlink_flag: {
									description: [
										"Enable/disable the onlink flag.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								preferred_life_time: {
									description: [
										"Preferred life time (sec).",
									]
									type: "int"
								}
								prefix: {
									description: [
										"IPv6 prefix.",
									]
									required: true
									type:     "str"
								}
								rdnss: {
									description: [
										"Recursive DNS server option.",
									]
									type: "str"
								}
								valid_life_time: {
									description: [
										"Valid life time (sec).",
									]
									type: "int"
								}
							}
						}
						ip6_reachable_time: {
							description: [
								"IPv6 reachable time (milliseconds; 0 means unspecified).",
							]
							type: "int"
						}
						ip6_retrans_time: {
							description: [
								"IPv6 retransmit time (milliseconds; 0 means unspecified).",
							]
							type: "int"
						}
						ip6_send_adv: {
							description: [
								"Enable/disable sending advertisements about the interface.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						ip6_subnet: {
							description: [
								" Subnet to routing prefix, syntax: xxxx:xxxx:xxxx:xxxx:xxxx:xxxx:xxxx:xxxx/xxx",
							]
							type: "str"
						}
						ip6_upstream_interface: {
							description: [
								"Interface name providing delegated information. Source system.interface.name.",
							]
							type: "str"
						}
						nd_cert: {
							description: [
								"Neighbor discovery certificate. Source certificate.local.name.",
							]
							type: "str"
						}
						nd_cga_modifier: {
							description: [
								"Neighbor discovery CGA modifier.",
							]
							type: "str"
						}
						nd_mode: {
							description: [
								"Neighbor discovery mode.",
							]
							type: "str"
							choices: [
								"basic",
								"SEND-compatible",
							]
						}
						nd_security_level: {
							description: [
								"Neighbor discovery security level (0 - 7; 0 = least secure).",
							]
							type: "int"
						}
						nd_timestamp_delta: {
							description: [
								"Neighbor discovery timestamp delta value (1 - 3600 sec; ).",
							]
							type: "int"
						}
						nd_timestamp_fuzz: {
							description: [
								"Neighbor discovery timestamp fuzz factor (1 - 60 sec; ).",
							]
							type: "int"
						}
						vrip6_link_local: {
							description: [
								"Link-local IPv6 address of virtual router.",
							]
							type: "str"
						}
						vrrp_virtual_mac6: {
							description: [
								"Enable/disable virtual MAC for VRRP.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						vrrp6: {
							description: [
								"IPv6 VRRP configuration.",
							]
							type: "list"
							suboptions: {
								accept_mode: {
									description: [
										"Enable/disable accept mode.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								adv_interval: {
									description: [
										"Advertisement interval (1 - 255 seconds).",
									]
									type: "int"
								}
								preempt: {
									description: [
										"Enable/disable preempt mode.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								priority: {
									description: [
										"Priority of the virtual router (1 - 255).",
									]
									type: "int"
								}
								start_time: {
									description: [
										"Startup time (1 - 255 seconds).",
									]
									type: "int"
								}
								status: {
									description: [
										"Enable/disable VRRP.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								vrdst6: {
									description: [
										"Monitor the route to this destination.",
									]
									type: "str"
								}
								vrgrp: {
									description: [
										"VRRP group ID (1 - 65535).",
									]
									type: "int"
								}
								vrid: {
									description: [
										"Virtual router identifier (1 - 255).",
									]
									required: true
									type:     "int"
								}
								vrip6: {
									description: [
										"IPv6 address of the virtual router.",
									]
									type: "str"
								}
							}
						}
					}
				}
				l2forward: {
					description: [
						"Enable/disable l2 forwarding.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				lacp_ha_slave: {
					description: [
						"LACP HA slave.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				lacp_mode: {
					description: [
						"LACP mode.",
					]
					type: "str"
					choices: [
						"static",
						"passive",
						"active",
					]
				}
				lacp_speed: {
					description: [
						"How often the interface sends LACP messages.",
					]
					type: "str"
					choices: [
						"slow",
						"fast",
					]
				}
				lcp_echo_interval: {
					description: [
						"Time in seconds between PPPoE Link Control Protocol (LCP) echo requests.",
					]
					type: "int"
				}
				lcp_max_echo_fails: {
					description: [
						"Maximum missed LCP echo messages before disconnect.",
					]
					type: "int"
				}
				link_up_delay: {
					description: [
						"Number of milliseconds to wait before considering a link is up.",
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
						"vdom",
					]
				}
				macaddr: {
					description: [
						"Change the interface's MAC address.",
					]
					type: "str"
				}
				managed_device: {
					description: [
						"Available when FortiLink is enabled, used for managed devices through FortiLink interface.",
					]
					type: "list"
					suboptions: name: {
						description: [
							"Managed dev identifier.",
						]
						required: true
						type:     "str"
					}
				}
				management_ip: {
					description: [
						"High Availability in-band management IP address of this interface.",
					]
					type: "str"
				}
				member: {
					description: [
						"Physical interfaces that belong to the aggregate or redundant interface.",
					]
					type: "list"
					suboptions: interface_name: {
						description: [
							"Physical interface name. Source system.interface.name.",
						]
						type: "str"
					}
				}
				min_links: {
					description: [
						"Minimum number of aggregated ports that must be up.",
					]
					type: "int"
				}
				min_links_down: {
					description: [
						"Action to take when less than the configured minimum number of links are active.",
					]
					type: "str"
					choices: [
						"operational",
						"administrative",
					]
				}
				mode: {
					description: [
						"Addressing mode (static, DHCP, PPPoE).",
					]
					type: "str"
					choices: [
						"static",
						"dhcp",
						"pppoe",
					]
				}
				mtu: {
					description: [
						"MTU value for this interface.",
					]
					type: "int"
				}
				mtu_override: {
					description: [
						"Enable to set a custom MTU for this interface.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				name: {
					description: [
						"Name.",
					]
					required: true
					type:     "str"
				}
				ndiscforward: {
					description: [
						"Enable/disable NDISC forwarding.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				netbios_forward: {
					description: [
						"Enable/disable NETBIOS forwarding.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				netflow_sampler: {
					description: [
						"Enable/disable NetFlow on this interface and set the data that NetFlow collects (rx, tx, or both).",
					]
					type: "str"
					choices: [
						"disable",
						"tx",
						"rx",
						"both",
					]
				}
				outbandwidth: {
					description: [
						"Bandwidth limit for outgoing traffic (0 - 16776000 kbps).",
					]
					type: "int"
				}
				padt_retry_timeout: {
					description: [
						"PPPoE Active Discovery Terminate (PADT) used to terminate sessions after an idle time.",
					]
					type: "int"
				}
				password: {
					description: [
						"PPPoE account's password.",
					]
					type: "str"
				}
				ping_serv_status: {
					description: [
						"PING server status.",
					]
					type: "int"
				}
				polling_interval: {
					description: [
						"sFlow polling interval (1 - 255 sec).",
					]
					type: "int"
				}
				pppoe_unnumbered_negotiate: {
					description: [
						"Enable/disable PPPoE unnumbered negotiation.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				pptp_auth_type: {
					description: [
						"PPTP authentication type.",
					]
					type: "str"
					choices: [
						"auto",
						"pap",
						"chap",
						"mschapv1",
						"mschapv2",
					]
				}
				pptp_client: {
					description: [
						"Enable/disable PPTP client.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				pptp_password: {
					description: [
						"PPTP password.",
					]
					type: "str"
				}
				pptp_server_ip: {
					description: [
						"PPTP server IP address.",
					]
					type: "str"
				}
				pptp_timeout: {
					description: [
						"Idle timer in minutes (0 for disabled).",
					]
					type: "int"
				}
				pptp_user: {
					description: [
						"PPTP user name.",
					]
					type: "str"
				}
				preserve_session_route: {
					description: [
						"Enable/disable preservation of session route when dirty.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				priority: {
					description: [
						"Priority of learned routes.",
					]
					type: "int"
				}
				priority_override: {
					description: [
						"Enable/disable fail back to higher priority port once recovered.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				proxy_captive_portal: {
					description: [
						"Enable/disable proxy captive portal on this interface.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				redundant_interface: {
					description: [
						"Redundant interface.",
					]
					type: "str"
				}
				remote_ip: {
					description: [
						"Remote IP address of tunnel.",
					]
					type: "str"
				}
				replacemsg_override_group: {
					description: [
						"Replacement message override group.",
					]
					type: "str"
				}
				role: {
					description: [
						"Interface role.",
					]
					type: "str"
					choices: [
						"lan",
						"wan",
						"dmz",
						"undefined",
					]
				}
				sample_direction: {
					description: [
						"Data that NetFlow collects (rx, tx, or both).",
					]
					type: "str"
					choices: [
						"tx",
						"rx",
						"both",
					]
				}
				sample_rate: {
					description: [
						"sFlow sample rate (10 - 99999).",
					]
					type: "int"
				}
				scan_botnet_connections: {
					description: [
						"Enable monitoring or blocking connections to Botnet servers through this interface.",
					]
					type: "str"
					choices: [
						"disable",
						"block",
						"monitor",
					]
				}
				secondary_IP: {
					description: [
						"Enable/disable adding a secondary IP to this interface.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				secondaryip: {
					description: [
						"Second IP address of interface.",
					]
					type: "list"
					suboptions: {
						allowaccess: {
							description: [
								"Management access settings for the secondary IP address.",
							]
							type: "str"
							choices: [
								"ping",
								"https",
								"ssh",
								"snmp",
								"http",
								"telnet",
								"fgfm",
								"radius-acct",
								"probe-response",
								"capwap",
								"ftm",
							]
						}
						detectprotocol: {
							description: [
								"Protocols used to detect the server.",
							]
							type: "str"
							choices: [
								"ping",
								"tcp-echo",
								"udp-echo",
							]
						}
						detectserver: {
							description: [
								"Gateway's ping server for this IP.",
							]
							type: "str"
						}
						gwdetect: {
							description: [
								"Enable/disable detect gateway alive for first.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						ha_priority: {
							description: [
								"HA election priority for the PING server.",
							]
							type: "int"
						}
						id: {
							description: [
								"ID.",
							]
							required: true
							type:     "int"
						}
						ip: {
							description: [
								"Secondary IP address of the interface.",
							]
							type: "str"
						}
						ping_serv_status: {
							description: [
								"PING server status.",
							]
							type: "int"
						}
					}
				}
				security_exempt_list: {
					description: [
						"Name of security-exempt-list.",
					]
					type: "str"
				}
				security_external_logout: {
					description: [
						"URL of external authentication logout server.",
					]
					type: "str"
				}
				security_external_web: {
					description: [
						"URL of external authentication web server.",
					]
					type: "str"
				}
				security_groups: {
					description: [
						"User groups that can authenticate with the captive portal.",
					]
					type: "list"
					suboptions: name: {
						description: [
							"Names of user groups that can authenticate with the captive portal.",
						]
						required: true
						type:     "str"
					}
				}
				security_mac_auth_bypass: {
					description: [
						"Enable/disable MAC authentication bypass.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				security_mode: {
					description: [
						"Turn on captive portal authentication for this interface.",
					]
					type: "str"
					choices: [
						"none",
						"captive-portal",
						"802.1X",
					]
				}
				security_redirect_url: {
					description: [
						"URL redirection after disclaimer/authentication.",
					]
					type: "str"
				}
				service_name: {
					description: [
						"PPPoE service name.",
					]
					type: "str"
				}
				sflow_sampler: {
					description: [
						"Enable/disable sFlow on this interface.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				snmp_index: {
					description: [
						"Permanent SNMP Index of the interface.",
					]
					type: "int"
				}
				speed: {
					description: [
						"Interface speed. The default setting and the options available depend on the interface hardware.",
					]
					type: "str"
					choices: [
						"auto",
						"10full",
						"10half",
						"100full",
						"100half",
						"1000full",
						"1000half",
						"1000auto",
					]
				}
				spillover_threshold: {
					description: [
						"Egress Spillover threshold (0 - 16776000 kbps), 0 means unlimited.",
					]
					type: "int"
				}
				src_check: {
					description: [
						"Enable/disable source IP check.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				status: {
					description: [
						"Bring the interface up or shut the interface down.",
					]
					type: "str"
					choices: [
						"up",
						"down",
					]
				}
				stpforward: {
					description: [
						"Enable/disable STP forwarding.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				stpforward_mode: {
					description: [
						"Configure STP forwarding mode.",
					]
					type: "str"
					choices: [
						"rpl-all-ext-id",
						"rpl-bridge-ext-id",
						"rpl-nothing",
					]
				}
				subst: {
					description: [
						"Enable to always send packets from this interface to a destination MAC address.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				substitute_dst_mac: {
					description: [
						"Destination MAC address that all packets are sent to from this interface.",
					]
					type: "str"
				}
				switch: {
					description: [
						"Contained in switch.",
					]
					type: "str"
				}
				switch_controller_access_vlan: {
					description: [
						"Block FortiSwitch port-to-port traffic.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				switch_controller_arp_inspection: {
					description: [
						"Enable/disable FortiSwitch ARP inspection.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				switch_controller_dhcp_snooping: {
					description: [
						"Switch controller DHCP snooping.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				switch_controller_dhcp_snooping_option82: {
					description: [
						"Switch controller DHCP snooping option82.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				switch_controller_dhcp_snooping_verify_mac: {
					description: [
						"Switch controller DHCP snooping verify MAC.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				switch_controller_igmp_snooping: {
					description: [
						"Switch controller IGMP snooping.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				switch_controller_learning_limit: {
					description: [
						"Limit the number of dynamic MAC addresses on this VLAN (1 - 128, 0 = no limit, default).",
					]
					type: "int"
				}
				tagging: {
					description: [
						"Config object tagging.",
					]
					type: "list"
					suboptions: {
						category: {
							description: [
								"Tag category. Source system.object-tagging.category.",
							]
							type: "str"
						}
						name: {
							description: [
								"Tagging entry name.",
							]
							required: true
							type:     "str"
						}
						tags: {
							description: [
								"Tags.",
							]
							type: "list"
							suboptions: name: {
								description: [
									"Tag name. Source system.object-tagging.tags.name.",
								]
								required: true
								type:     "str"
							}
						}
					}
				}
				tcp_mss: {
					description: [
						"TCP maximum segment size. 0 means do not change segment size.",
					]
					type: "int"
				}
				trust_ip_1: {
					description: [
						"Trusted host for dedicated management traffic (0.0.0.0/24 for all hosts).",
					]
					type: "str"
				}
				trust_ip_2: {
					description: [
						"Trusted host for dedicated management traffic (0.0.0.0/24 for all hosts).",
					]
					type: "str"
				}
				trust_ip_3: {
					description: [
						"Trusted host for dedicated management traffic (0.0.0.0/24 for all hosts).",
					]
					type: "str"
				}
				trust_ip6_1: {
					description: [
						"Trusted IPv6 host for dedicated management traffic (::/0 for all hosts).",
					]
					type: "str"
				}
				trust_ip6_2: {
					description: [
						"Trusted IPv6 host for dedicated management traffic (::/0 for all hosts).",
					]
					type: "str"
				}
				trust_ip6_3: {
					description: [
						"Trusted IPv6 host for dedicated management traffic (::/0 for all hosts).",
					]
					type: "str"
				}
				type: {
					description: [
						"Interface type.",
					]
					type: "str"
					choices: [
						"physical",
						"vlan",
						"aggregate",
						"redundant",
						"tunnel",
						"vdom-link",
						"loopback",
						"switch",
						"hard-switch",
						"vap-switch",
						"wl-mesh",
						"fext-wan",
						"vxlan",
						"hdlc",
						"switch-vlan",
					]
				}
				username: {
					description: [
						"Username of the PPPoE account, provided by your ISP.",
					]
					type: "str"
				}
				vdom: {
					description: [
						"Interface is in this virtual domain (VDOM). Source system.vdom.name.",
					]
					type: "str"
				}
				vindex: {
					description: [
						"Switch control interface VLAN ID.",
					]
					type: "int"
				}
				vlanforward: {
					description: [
						"Enable/disable traffic forwarding between VLANs on this interface.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				vlanid: {
					description: [
						"VLAN ID (1 - 4094).",
					]
					type: "int"
				}
				vrf: {
					description: [
						"Virtual Routing Forwarding ID.",
					]
					type: "int"
				}
				vrrp: {
					description: [
						"VRRP configuration.",
					]
					type: "list"
					suboptions: {
						accept_mode: {
							description: [
								"Enable/disable accept mode.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						adv_interval: {
							description: [
								"Advertisement interval (1 - 255 seconds).",
							]
							type: "int"
						}
						ignore_default_route: {
							description: [
								"Enable/disable ignoring of default route when checking destination.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						preempt: {
							description: [
								"Enable/disable preempt mode.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						priority: {
							description: [
								"Priority of the virtual router (1 - 255).",
							]
							type: "int"
						}
						proxy_arp: {
							description: [
								"VRRP Proxy ARP configuration.",
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
								ip: {
									description: [
										"Set IP addresses of proxy ARP.",
									]
									type: "str"
								}
							}
						}
						start_time: {
							description: [
								"Startup time (1 - 255 seconds).",
							]
							type: "int"
						}
						status: {
							description: [
								"Enable/disable this VRRP configuration.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						version: {
							description: [
								"VRRP version.",
							]
							type: "str"
							choices: [
								2,
								3,
							]
						}
						vrdst: {
							description: [
								"Monitor the route to this destination.",
							]
							type: "str"
						}
						vrdst_priority: {
							description: [
								"Priority of the virtual router when the virtual router destination becomes unreachable (0 - 254).",
							]
							type: "int"
						}
						vrgrp: {
							description: [
								"VRRP group ID (1 - 65535).",
							]
							type: "int"
						}
						vrid: {
							description: [
								"Virtual router identifier (1 - 255).",
							]
							required: true
							type:     "int"
						}
						vrip: {
							description: [
								"IP address of the virtual router.",
							]
							type: "str"
						}
					}
				}
				vrrp_virtual_mac: {
					description: [
						"Enable/disable use of virtual MAC for VRRP.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				wccp: {
					description: [
						"Enable/disable WCCP on this interface. Used for encapsulated WCCP communication between WCCP clients and servers.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				weight: {
					description: [
						"Default weight for static routes (if route has no weight configured).",
					]
					type: "int"
				}
				wins_ip: {
					description: [
						"WINS server IP.",
					]
					type: "str"
				}
			}
		}
	}
}
