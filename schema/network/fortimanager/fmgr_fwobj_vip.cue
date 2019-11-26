package ansible

module: fmgr_fwobj_vip: {
	module:        "fmgr_fwobj_vip"
	version_added: "2.8"
	notes: [
		"Full Documentation at U(https://ftnt-ansible-docs.readthedocs.io/en/latest/).",
	]
	author: [
		"Luke Weighall (@lweighall)",
		"Andrew Welsh (@Ghilli3)",
		"Jim Huber (@p4r4n0y1ng)",
	]
	short_description: "Manages Virtual IPs objects in FortiManager"
	description: [
		"Manages Virtual IP objects in FortiManager for IPv4",
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

		websphere_server: {
			description: [
				"Enable to add an HTTP header to indicate SSL offloading for a WebSphere server.",
				"choice | disable | Do not add HTTP header indicating SSL offload for WebSphere server.",
				"choice | enable | Add HTTP header indicating SSL offload for WebSphere server.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		weblogic_server: {
			description: [
				"Enable to add an HTTP header to indicate SSL offloading for a WebLogic server.",
				"choice | disable | Do not add HTTP header indicating SSL offload for WebLogic server.",
				"choice | enable | Add HTTP header indicating SSL offload for WebLogic server.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		type: {
			description: [
				"Configure a static NAT, load balance, server load balance, DNS translation, or FQDN VIP.",
				"choice | static-nat | Static NAT.",
				"choice | load-balance | Load balance.",
				"choice | server-load-balance | Server load balance.",
				"choice | dns-translation | DNS translation.",
				"choice | fqdn | FQDN Translation",
			]
			required: false
			choices: ["static-nat", "load-balance", "server-load-balance", "dns-translation", "fqdn"]
		}

		ssl_server_session_state_type: {
			description: [
				"How to expire SSL sessions for the segment of the SSL connection between the server and the FortiGate.",
				"choice | disable | Do not keep session states.",
				"choice | time | Expire session states after this many minutes.",
				"choice | count | Expire session states when this maximum is reached.",
				"choice | both | Expire session states based on time or count, whichever occurs first.",
			]
			required: false
			choices: ["disable", "time", "count", "both"]
		}

		ssl_server_session_state_timeout: {
			description: [
				"Number of minutes to keep FortiGate to Server SSL session state.",
			]
			required: false
		}

		ssl_server_session_state_max: {
			description: [
				"Maximum number of FortiGate to Server SSL session states to keep.",
			]
			required: false
		}

		ssl_server_min_version: {
			description: [
				"Lowest SSL/TLS version acceptable from a server. Use the client setting by default.",
				"choice | ssl-3.0 | SSL 3.0.",
				"choice | tls-1.0 | TLS 1.0.",
				"choice | tls-1.1 | TLS 1.1.",
				"choice | tls-1.2 | TLS 1.2.",
				"choice | client | Use same value as client configuration.",
			]
			required: false
			choices: ["ssl-3.0", "tls-1.0", "tls-1.1", "tls-1.2", "client"]
		}

		ssl_server_max_version: {
			description: [
				"Highest SSL/TLS version acceptable from a server. Use the client setting by default.",
				"choice | ssl-3.0 | SSL 3.0.",
				"choice | tls-1.0 | TLS 1.0.",
				"choice | tls-1.1 | TLS 1.1.",
				"choice | tls-1.2 | TLS 1.2.",
				"choice | client | Use same value as client configuration.",
			]
			required: false
			choices: ["ssl-3.0", "tls-1.0", "tls-1.1", "tls-1.2", "client"]
		}

		ssl_server_algorithm: {
			description: [
				"Permitted encryption algorithms for the server side of SSL full mode sessions according to encryption strength",
				"choice | high | High encryption. Allow only AES and ChaCha.",
				"choice | low | Low encryption. Allow AES, ChaCha, 3DES, RC4, and DES.",
				"choice | medium | Medium encryption. Allow AES, ChaCha, 3DES, and RC4.",
				"choice | custom | Custom encryption. Use ssl-server-cipher-suites to select the cipher suites that are allowed.",
				"choice | client | Use the same encryption algorithms for both client and server sessions.",
			]
			required: false
			choices: ["high", "low", "medium", "custom", "client"]
		}

		ssl_send_empty_frags: {
			description: [
				"Enable/disable sending empty fragments to avoid CBC IV attacks (SSL 3.0 &amp; TLS 1.0 only).",
				"choice | disable | Do not send empty fragments.",
				"choice | enable | Send empty fragments.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		ssl_pfs: {
			description: [
				"Select the cipher suites that can be used for SSL perfect forward secrecy (PFS).",
				"choice | require | Allow only Diffie-Hellman cipher-suites, so PFS is applied.",
				"choice | deny | Allow only non-Diffie-Hellman cipher-suites, so PFS is not applied.",
				"choice | allow | Allow use of any cipher suite so PFS may or may not be used depending on the cipher suite",
			]
			required: false
			choices: ["require", "deny", "allow"]
		}

		ssl_mode: {
			description: [
				"Apply SSL offloading mode",
				"choice | half | Client to FortiGate SSL.",
				"choice | full | Client to FortiGate and FortiGate to Server SSL.",
			]
			required: false
			choices: ["half", "full"]
		}

		ssl_min_version: {
			description: [
				"Lowest SSL/TLS version acceptable from a client.",
				"choice | ssl-3.0 | SSL 3.0.",
				"choice | tls-1.0 | TLS 1.0.",
				"choice | tls-1.1 | TLS 1.1.",
				"choice | tls-1.2 | TLS 1.2.",
			]
			required: false
			choices: ["ssl-3.0", "tls-1.0", "tls-1.1", "tls-1.2"]
		}

		ssl_max_version: {
			description: [
				"Highest SSL/TLS version acceptable from a client.",
				"choice | ssl-3.0 | SSL 3.0.",
				"choice | tls-1.0 | TLS 1.0.",
				"choice | tls-1.1 | TLS 1.1.",
				"choice | tls-1.2 | TLS 1.2.",
			]
			required: false
			choices: ["ssl-3.0", "tls-1.0", "tls-1.1", "tls-1.2"]
		}

		ssl_http_match_host: {
			description: [
				"Enable/disable HTTP host matching for location conversion.",
				"choice | disable | Do not match HTTP host.",
				"choice | enable | Match HTTP host in response header.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		ssl_http_location_conversion: {
			description: [
				"Enable to replace HTTP with HTTPS in the reply's Location HTTP header field.",
				"choice | disable | Disable HTTP location conversion.",
				"choice | enable | Enable HTTP location conversion.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		ssl_hsts_include_subdomains: {
			description: [
				"Indicate that HSTS header applies to all subdomains.",
				"choice | disable | HSTS header does not apply to subdomains.",
				"choice | enable | HSTS header applies to subdomains.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		ssl_hsts_age: {
			description: [
				"Number of seconds the client should honour the HSTS setting.",
			]
			required: false
		}

		ssl_hsts: {
			description: [
				"Enable/disable including HSTS header in response.",
				"choice | disable | Do not add a HSTS header to each a HTTP response.",
				"choice | enable | Add a HSTS header to each HTTP response.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		ssl_hpkp_report_uri: {
			description: [
				"URL to report HPKP violations to.",
			]
			required: false
		}

		ssl_hpkp_primary: {
			description: [
				"Certificate to generate primary HPKP pin from.",
			]
			required: false
		}

		ssl_hpkp_include_subdomains: {
			description: [
				"Indicate that HPKP header applies to all subdomains.",
				"choice | disable | HPKP header does not apply to subdomains.",
				"choice | enable | HPKP header applies to subdomains.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		ssl_hpkp_backup: {
			description: [
				"Certificate to generate backup HPKP pin from.",
			]
			required: false
		}

		ssl_hpkp_age: {
			description: [
				"Number of seconds the client should honour the HPKP setting.",
			]
			required: false
		}

		ssl_hpkp: {
			description: [
				"Enable/disable including HPKP header in response.",
				"choice | disable | Do not add a HPKP header to each HTTP response.",
				"choice | enable | Add a HPKP header to each a HTTP response.",
				"choice | report-only | Add a HPKP Report-Only header to each HTTP response.",
			]
			required: false
			choices: ["disable", "enable", "report-only"]
		}

		ssl_dh_bits: {
			description: [
				"Number of bits to use in the Diffie-Hellman exchange for RSA encryption of SSL sessions.",
				"choice | 768 | 768-bit Diffie-Hellman prime.",
				"choice | 1024 | 1024-bit Diffie-Hellman prime.",
				"choice | 1536 | 1536-bit Diffie-Hellman prime.",
				"choice | 2048 | 2048-bit Diffie-Hellman prime.",
				"choice | 3072 | 3072-bit Diffie-Hellman prime.",
				"choice | 4096 | 4096-bit Diffie-Hellman prime.",
			]
			required: false
			choices: ["768", "1024", "1536", "2048", "3072", "4096"]
		}

		ssl_client_session_state_type: {
			description: [
				"How to expire SSL sessions for the segment of the SSL connection between the client and the FortiGate.",
				"choice | disable | Do not keep session states.",
				"choice | time | Expire session states after this many minutes.",
				"choice | count | Expire session states when this maximum is reached.",
				"choice | both | Expire session states based on time or count, whichever occurs first.",
			]
			required: false
			choices: ["disable", "time", "count", "both"]
		}

		ssl_client_session_state_timeout: {
			description: [
				"Number of minutes to keep client to FortiGate SSL session state.",
			]
			required: false
		}

		ssl_client_session_state_max: {
			description: [
				"Maximum number of client to FortiGate SSL session states to keep.",
			]
			required: false
		}

		ssl_client_renegotiation: {
			description: [
				"Allow, deny, or require secure renegotiation of client sessions to comply with RFC 5746.",
				"choice | deny | Abort any client initiated SSL re-negotiation attempt.",
				"choice | allow | Allow a SSL client to renegotiate.",
				"choice | secure | Abort any client initiated SSL re-negotiation attempt that does not use RFC 5746.",
			]
			required: false
			choices: ["deny", "allow", "secure"]
		}

		ssl_client_fallback: {
			description: [
				"Enable/disable support for preventing Downgrade Attacks on client connections (RFC 7507).",
				"choice | disable | Disable.",
				"choice | enable | Enable.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		ssl_certificate: {
			description: [
				"The name of the SSL certificate to use for SSL acceleration.",
			]
			required: false
		}

		ssl_algorithm: {
			description: [
				"Permitted encryption algorithms for SSL sessions according to encryption strength.",
				"choice | high | High encryption. Allow only AES and ChaCha.",
				"choice | medium | Medium encryption. Allow AES, ChaCha, 3DES, and RC4.",
				"choice | low | Low encryption. Allow AES, ChaCha, 3DES, RC4, and DES.",
				"choice | custom | Custom encryption. Use config ssl-cipher-suites to select the cipher suites that are allowed.",
			]
			required: false
			choices: ["high", "medium", "low", "custom"]
		}

		srcintf_filter: {
			description: [
				"Interfaces to which the VIP applies. Separate the names with spaces.",
			]
			required: false
		}

		src_filter: {
			description: [
				"Source address filter. Each address must be either an IP/subnet (x.x.x.x/n) or a range (x.x.x.x-y.y.y.y).",
				"Separate addresses with spaces.",
			]
			required: false
		}

		service: {
			description: [
				"Service name.",
			]
			required: false
		}

		server_type: {
			description: [
				"Protocol to be load balanced by the virtual server (also called the server load balance virtual IP).",
				"choice | http | HTTP",
				"choice | https | HTTPS",
				"choice | ssl | SSL",
				"choice | tcp | TCP",
				"choice | udp | UDP",
				"choice | ip | IP",
				"choice | imaps | IMAPS",
				"choice | pop3s | POP3S",
				"choice | smtps | SMTPS",
			]
			required: false
			choices: ["http", "https", "ssl", "tcp", "udp", "ip", "imaps", "pop3s", "smtps"]
		}

		protocol: {
			description: [
				"Protocol to use when forwarding packets.",
				"choice | tcp | TCP.",
				"choice | udp | UDP.",
				"choice | sctp | SCTP.",
				"choice | icmp | ICMP.",
			]
			required: false
			choices: ["tcp", "udp", "sctp", "icmp"]
		}

		portmapping_type: {
			description: [
				"Port mapping type.",
				"choice | 1-to-1 | One to one.",
				"choice | m-to-n | Many to many.",
			]
			required: false
			choices: ["1-to-1", "m-to-n"]
		}

		portforward: {
			description: [
				"Enable/disable port forwarding.",
				"choice | disable | Disable port forward.",
				"choice | enable | Enable port forward.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		persistence: {
			description: [
				"Configure how to make sure that clients connect to the same server every time they make a request that is part",
				"of the same session.",
				"choice | none | None.",
				"choice | http-cookie | HTTP cookie.",
				"choice | ssl-session-id | SSL session ID.",
			]
			required: false
			choices: ["none", "http-cookie", "ssl-session-id"]
		}

		outlook_web_access: {
			description: [
				"Enable to add the Front-End-Https header for Microsoft Outlook Web Access.",
				"choice | disable | Disable Outlook Web Access support.",
				"choice | enable | Enable Outlook Web Access support.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		nat_source_vip: {
			description: [
				"Enable to prevent unintended servers from using a virtual IP.",
				"Disable to use the actual IP address of the server as the source address.",
				"choice | disable | Do not force to NAT as VIP.",
				"choice | enable | Force to NAT as VIP.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		name: {
			description: [
				"Virtual IP name.",
			]
			required: false
		}

		monitor: {
			description: [
				"Name of the health check monitor to use when polling to determine a virtual server's connectivity status.",
			]
			required: false
		}

		max_embryonic_connections: {
			description: [
				"Maximum number of incomplete connections.",
			]
			required: false
		}

		mappedport: {
			description: [
				"Port number range on the destination network to which the external port number range is mapped.",
			]
			required: false
		}

		mappedip: {
			description: [
				"IP address or address range on the destination network to which the external IP address is mapped.",
			]
			required: false
		}

		mapped_addr: {
			description: [
				"Mapped FQDN address name.",
			]
			required: false
		}

		ldb_method: {
			description: [
				"Method used to distribute sessions to real servers.",
				"choice | static | Distribute to server based on source IP.",
				"choice | round-robin | Distribute to server based round robin order.",
				"choice | weighted | Distribute to server based on weight.",
				"choice | least-session | Distribute to server with lowest session count.",
				"choice | least-rtt | Distribute to server with lowest Round-Trip-Time.",
				"choice | first-alive | Distribute to the first server that is alive.",
				"choice | http-host | Distribute to server based on host field in HTTP header.",
			]
			required: false
			choices: ["static", "round-robin", "weighted", "least-session", "least-rtt", "first-alive", "http-host"]
		}

		https_cookie_secure: {
			description: [
				"Enable/disable verification that inserted HTTPS cookies are secure.",
				"choice | disable | Do not mark cookie as secure, allow sharing between an HTTP and HTTPS connection.",
				"choice | enable | Mark inserted cookie as secure, cookie can only be used for HTTPS a connection.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		http_multiplex: {
			description: [
				"Enable/disable HTTP multiplexing.",
				"choice | disable | Disable HTTP session multiplexing.",
				"choice | enable | Enable HTTP session multiplexing.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		http_ip_header_name: {
			description: [
				"For HTTP multiplexing, enter a custom HTTPS header name. The orig client IP address is added to this header.",
				"If empty, X-Forwarded-For is used.",
			]
			required: false
		}

		http_ip_header: {
			description: [
				"For HTTP multiplexing, enable to add the original client IP address in the XForwarded-For HTTP header.",
				"choice | disable | Disable adding HTTP header.",
				"choice | enable | Enable adding HTTP header.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		http_cookie_share: {
			description: [
				"Control sharing of cookies across virtual servers. same-ip means a cookie from one virtual server can be used",
				"by another. Disable stops cookie sharing.",
				"choice | disable | Only allow HTTP cookie to match this virtual server.",
				"choice | same-ip | Allow HTTP cookie to match any virtual server with same IP.",
			]
			required: false
			choices: ["disable", "same-ip"]
		}

		http_cookie_path: {
			description: [
				"Limit HTTP cookie persistence to the specified path.",
			]
			required: false
		}

		http_cookie_generation: {
			description: [
				"Generation of HTTP cookie to be accepted. Changing invalidates all existing cookies.",
			]
			required: false
		}

		http_cookie_domain_from_host: {
			description: [
				"Enable/disable use of HTTP cookie domain from host field in HTTP.",
				"choice | disable | Disable use of HTTP cookie domain from host field in HTTP (use http-cooke-domain setting).",
				"choice | enable | Enable use of HTTP cookie domain from host field in HTTP.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		http_cookie_domain: {
			description: [
				"Domain that HTTP cookie persistence should apply to.",
			]
			required: false
		}

		http_cookie_age: {
			description: [
				"Time in minutes that client web browsers should keep a cookie. Default is 60 seconds. 0 = no time limit.",
			]
			required: false
		}

		gratuitous_arp_interval: {
			description: [
				"Enable to have the VIP send gratuitous ARPs. 0=disabled. Set from 5 up to 8640000 seconds to enable.",
			]
			required: false
		}

		extport: {
			description: [
				"Incoming port number range that you want to map to a port number range on the destination network.",
			]
			required: false
		}

		extip: {
			description: [
				"IP address or address range on the external interface that you want to map to an address or address range on t",
				"he destination network.",
			]
			required: false
		}

		extintf: {
			description: [
				"Interface connected to the source network that receives the packets that will be forwarded to the destination",
				"network.",
			]
			required: false
		}

		extaddr: {
			description: [
				"External FQDN address name.",
			]
			required: false
		}

		dns_mapping_ttl: {
			description: [
				"DNS mapping TTL (Set to zero to use TTL in DNS response, default = 0).",
			]
			required: false
		}

		comment: {
			description: [
				"Comment.",
			]
			required: false
		}

		color: {
			description: [
				"Color of icon on the GUI.",
			]
			required: false
		}

		arp_reply: {
			description: [
				"Enable to respond to ARP requests for this virtual IP address. Enabled by default.",
				"choice | disable | Disable ARP reply.",
				"choice | enable | Enable ARP reply.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		dynamic_mapping: {
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

		dynamic_mapping_arp_reply: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | disable |",
				"choice | enable |",
			]
			required: false
			choices: ["disable", "enable"]
		}

		dynamic_mapping_color: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_comment: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_dns_mapping_ttl: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_extaddr: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_extintf: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_extip: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_extport: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_gratuitous_arp_interval: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_http_cookie_age: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_http_cookie_domain: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_http_cookie_domain_from_host: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | disable |",
				"choice | enable |",
			]
			required: false
			choices: ["disable", "enable"]
		}

		dynamic_mapping_http_cookie_generation: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_http_cookie_path: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_http_cookie_share: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | disable |",
				"choice | same-ip |",
			]
			required: false
			choices: ["disable", "same-ip"]
		}

		dynamic_mapping_http_ip_header: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | disable |",
				"choice | enable |",
			]
			required: false
			choices: ["disable", "enable"]
		}

		dynamic_mapping_http_ip_header_name: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_http_multiplex: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | disable |",
				"choice | enable |",
			]
			required: false
			choices: ["disable", "enable"]
		}

		dynamic_mapping_https_cookie_secure: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | disable |",
				"choice | enable |",
			]
			required: false
			choices: ["disable", "enable"]
		}

		dynamic_mapping_ldb_method: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | static |",
				"choice | round-robin |",
				"choice | weighted |",
				"choice | least-session |",
				"choice | least-rtt |",
				"choice | first-alive |",
				"choice | http-host |",
			]
			required: false
			choices: ["static", "round-robin", "weighted", "least-session", "least-rtt", "first-alive", "http-host"]
		}

		dynamic_mapping_mapped_addr: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_mappedip: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_mappedport: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_max_embryonic_connections: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_monitor: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_nat_source_vip: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | disable |",
				"choice | enable |",
			]
			required: false
			choices: ["disable", "enable"]
		}

		dynamic_mapping_outlook_web_access: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | disable |",
				"choice | enable |",
			]
			required: false
			choices: ["disable", "enable"]
		}

		dynamic_mapping_persistence: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | none |",
				"choice | http-cookie |",
				"choice | ssl-session-id |",
			]
			required: false
			choices: ["none", "http-cookie", "ssl-session-id"]
		}

		dynamic_mapping_portforward: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | disable |",
				"choice | enable |",
			]
			required: false
			choices: ["disable", "enable"]
		}

		dynamic_mapping_portmapping_type: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | 1-to-1 |",
				"choice | m-to-n |",
			]
			required: false
			choices: ["1-to-1", "m-to-n"]
		}

		dynamic_mapping_protocol: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | tcp |",
				"choice | udp |",
				"choice | sctp |",
				"choice | icmp |",
			]
			required: false
			choices: ["tcp", "udp", "sctp", "icmp"]
		}

		dynamic_mapping_server_type: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | http |",
				"choice | https |",
				"choice | ssl |",
				"choice | tcp |",
				"choice | udp |",
				"choice | ip |",
				"choice | imaps |",
				"choice | pop3s |",
				"choice | smtps |",
			]
			required: false
			choices: ["http", "https", "ssl", "tcp", "udp", "ip", "imaps", "pop3s", "smtps"]
		}

		dynamic_mapping_service: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_src_filter: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_srcintf_filter: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_ssl_algorithm: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | high |",
				"choice | medium |",
				"choice | low |",
				"choice | custom |",
			]
			required: false
			choices: ["high", "medium", "low", "custom"]
		}

		dynamic_mapping_ssl_certificate: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_ssl_client_fallback: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | disable |",
				"choice | enable |",
			]
			required: false
			choices: ["disable", "enable"]
		}

		dynamic_mapping_ssl_client_renegotiation: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | deny |",
				"choice | allow |",
				"choice | secure |",
			]
			required: false
			choices: ["deny", "allow", "secure"]
		}

		dynamic_mapping_ssl_client_session_state_max: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_ssl_client_session_state_timeout: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_ssl_client_session_state_type: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | disable |",
				"choice | time |",
				"choice | count |",
				"choice | both |",
			]
			required: false
			choices: ["disable", "time", "count", "both"]
		}

		dynamic_mapping_ssl_dh_bits: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | 768 |",
				"choice | 1024 |",
				"choice | 1536 |",
				"choice | 2048 |",
				"choice | 3072 |",
				"choice | 4096 |",
			]
			required: false
			choices: ["768", "1024", "1536", "2048", "3072", "4096"]
		}

		dynamic_mapping_ssl_hpkp: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | disable |",
				"choice | enable |",
				"choice | report-only |",
			]
			required: false
			choices: ["disable", "enable", "report-only"]
		}

		dynamic_mapping_ssl_hpkp_age: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_ssl_hpkp_backup: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_ssl_hpkp_include_subdomains: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | disable |",
				"choice | enable |",
			]
			required: false
			choices: ["disable", "enable"]
		}

		dynamic_mapping_ssl_hpkp_primary: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_ssl_hpkp_report_uri: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_ssl_hsts: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | disable |",
				"choice | enable |",
			]
			required: false
			choices: ["disable", "enable"]
		}

		dynamic_mapping_ssl_hsts_age: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_ssl_hsts_include_subdomains: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | disable |",
				"choice | enable |",
			]
			required: false
			choices: ["disable", "enable"]
		}

		dynamic_mapping_ssl_http_location_conversion: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | disable |",
				"choice | enable |",
			]
			required: false
			choices: ["disable", "enable"]
		}

		dynamic_mapping_ssl_http_match_host: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | disable |",
				"choice | enable |",
			]
			required: false
			choices: ["disable", "enable"]
		}

		dynamic_mapping_ssl_max_version: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | ssl-3.0 |",
				"choice | tls-1.0 |",
				"choice | tls-1.1 |",
				"choice | tls-1.2 |",
			]
			required: false
			choices: ["ssl-3.0", "tls-1.0", "tls-1.1", "tls-1.2"]
		}

		dynamic_mapping_ssl_min_version: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | ssl-3.0 |",
				"choice | tls-1.0 |",
				"choice | tls-1.1 |",
				"choice | tls-1.2 |",
			]
			required: false
			choices: ["ssl-3.0", "tls-1.0", "tls-1.1", "tls-1.2"]
		}

		dynamic_mapping_ssl_mode: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | half |",
				"choice | full |",
			]
			required: false
			choices: ["half", "full"]
		}

		dynamic_mapping_ssl_pfs: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | require |",
				"choice | deny |",
				"choice | allow |",
			]
			required: false
			choices: ["require", "deny", "allow"]
		}

		dynamic_mapping_ssl_send_empty_frags: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | disable |",
				"choice | enable |",
			]
			required: false
			choices: ["disable", "enable"]
		}

		dynamic_mapping_ssl_server_algorithm: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | high |",
				"choice | low |",
				"choice | medium |",
				"choice | custom |",
				"choice | client |",
			]
			required: false
			choices: ["high", "low", "medium", "custom", "client"]
		}

		dynamic_mapping_ssl_server_max_version: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | ssl-3.0 |",
				"choice | tls-1.0 |",
				"choice | tls-1.1 |",
				"choice | tls-1.2 |",
				"choice | client |",
			]
			required: false
			choices: ["ssl-3.0", "tls-1.0", "tls-1.1", "tls-1.2", "client"]
		}

		dynamic_mapping_ssl_server_min_version: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | ssl-3.0 |",
				"choice | tls-1.0 |",
				"choice | tls-1.1 |",
				"choice | tls-1.2 |",
				"choice | client |",
			]
			required: false
			choices: ["ssl-3.0", "tls-1.0", "tls-1.1", "tls-1.2", "client"]
		}

		dynamic_mapping_ssl_server_session_state_max: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_ssl_server_session_state_timeout: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_ssl_server_session_state_type: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | disable |",
				"choice | time |",
				"choice | count |",
				"choice | both |",
			]
			required: false
			choices: ["disable", "time", "count", "both"]
		}

		dynamic_mapping_type: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | static-nat |",
				"choice | load-balance |",
				"choice | server-load-balance |",
				"choice | dns-translation |",
				"choice | fqdn |",
			]
			required: false
			choices: ["static-nat", "load-balance", "server-load-balance", "dns-translation", "fqdn"]
		}

		dynamic_mapping_weblogic_server: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | disable |",
				"choice | enable |",
			]
			required: false
			choices: ["disable", "enable"]
		}

		dynamic_mapping_websphere_server: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | disable |",
				"choice | enable |",
			]
			required: false
			choices: ["disable", "enable"]
		}

		dynamic_mapping_realservers_client_ip: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_realservers_healthcheck: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | disable |",
				"choice | enable |",
				"choice | vip |",
			]
			required: false
			choices: ["disable", "enable", "vip"]
		}

		dynamic_mapping_realservers_holddown_interval: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_realservers_http_host: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_realservers_ip: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_realservers_max_connections: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_realservers_monitor: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_realservers_port: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_realservers_seq: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_realservers_status: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | active |",
				"choice | standby |",
				"choice | disable |",
			]
			required: false
			choices: ["active", "standby", "disable"]
		}

		dynamic_mapping_realservers_weight: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
			]
			required: false
		}

		dynamic_mapping_ssl_cipher_suites_cipher: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"choice | TLS-RSA-WITH-RC4-128-MD5 |",
				"choice | TLS-RSA-WITH-RC4-128-SHA |",
				"choice | TLS-RSA-WITH-DES-CBC-SHA |",
				"choice | TLS-RSA-WITH-3DES-EDE-CBC-SHA |",
				"choice | TLS-RSA-WITH-AES-128-CBC-SHA |",
				"choice | TLS-RSA-WITH-AES-256-CBC-SHA |",
				"choice | TLS-RSA-WITH-AES-128-CBC-SHA256 |",
				"choice | TLS-RSA-WITH-AES-256-CBC-SHA256 |",
				"choice | TLS-RSA-WITH-CAMELLIA-128-CBC-SHA |",
				"choice | TLS-RSA-WITH-CAMELLIA-256-CBC-SHA |",
				"choice | TLS-RSA-WITH-CAMELLIA-128-CBC-SHA256 |",
				"choice | TLS-RSA-WITH-CAMELLIA-256-CBC-SHA256 |",
				"choice | TLS-RSA-WITH-SEED-CBC-SHA |",
				"choice | TLS-RSA-WITH-ARIA-128-CBC-SHA256 |",
				"choice | TLS-RSA-WITH-ARIA-256-CBC-SHA384 |",
				"choice | TLS-DHE-RSA-WITH-DES-CBC-SHA |",
				"choice | TLS-DHE-RSA-WITH-3DES-EDE-CBC-SHA |",
				"choice | TLS-DHE-RSA-WITH-AES-128-CBC-SHA |",
				"choice | TLS-DHE-RSA-WITH-AES-256-CBC-SHA |",
				"choice | TLS-DHE-RSA-WITH-AES-128-CBC-SHA256 |",
				"choice | TLS-DHE-RSA-WITH-AES-256-CBC-SHA256 |",
				"choice | TLS-DHE-RSA-WITH-CAMELLIA-128-CBC-SHA |",
				"choice | TLS-DHE-RSA-WITH-CAMELLIA-256-CBC-SHA |",
				"choice | TLS-DHE-RSA-WITH-CAMELLIA-128-CBC-SHA256 |",
				"choice | TLS-DHE-RSA-WITH-CAMELLIA-256-CBC-SHA256 |",
				"choice | TLS-DHE-RSA-WITH-SEED-CBC-SHA |",
				"choice | TLS-DHE-RSA-WITH-ARIA-128-CBC-SHA256 |",
				"choice | TLS-DHE-RSA-WITH-ARIA-256-CBC-SHA384 |",
				"choice | TLS-ECDHE-RSA-WITH-RC4-128-SHA |",
				"choice | TLS-ECDHE-RSA-WITH-3DES-EDE-CBC-SHA |",
				"choice | TLS-ECDHE-RSA-WITH-AES-128-CBC-SHA |",
				"choice | TLS-ECDHE-RSA-WITH-AES-256-CBC-SHA |",
				"choice | TLS-ECDHE-RSA-WITH-CHACHA20-POLY1305-SHA256 |",
				"choice | TLS-ECDHE-ECDSA-WITH-CHACHA20-POLY1305-SHA256 |",
				"choice | TLS-DHE-RSA-WITH-CHACHA20-POLY1305-SHA256 |",
				"choice | TLS-DHE-RSA-WITH-AES-128-GCM-SHA256 |",
				"choice | TLS-DHE-RSA-WITH-AES-256-GCM-SHA384 |",
				"choice | TLS-DHE-DSS-WITH-AES-128-CBC-SHA |",
				"choice | TLS-DHE-DSS-WITH-AES-256-CBC-SHA |",
				"choice | TLS-DHE-DSS-WITH-AES-128-CBC-SHA256 |",
				"choice | TLS-DHE-DSS-WITH-AES-128-GCM-SHA256 |",
				"choice | TLS-DHE-DSS-WITH-AES-256-CBC-SHA256 |",
				"choice | TLS-DHE-DSS-WITH-AES-256-GCM-SHA384 |",
				"choice | TLS-ECDHE-RSA-WITH-AES-128-CBC-SHA256 |",
				"choice | TLS-ECDHE-RSA-WITH-AES-128-GCM-SHA256 |",
				"choice | TLS-ECDHE-RSA-WITH-AES-256-CBC-SHA384 |",
				"choice | TLS-ECDHE-RSA-WITH-AES-256-GCM-SHA384 |",
				"choice | TLS-ECDHE-ECDSA-WITH-AES-128-CBC-SHA |",
				"choice | TLS-ECDHE-ECDSA-WITH-AES-128-CBC-SHA256 |",
				"choice | TLS-ECDHE-ECDSA-WITH-AES-128-GCM-SHA256 |",
				"choice | TLS-ECDHE-ECDSA-WITH-AES-256-CBC-SHA384 |",
				"choice | TLS-ECDHE-ECDSA-WITH-AES-256-GCM-SHA384 |",
				"choice | TLS-RSA-WITH-AES-128-GCM-SHA256 |",
				"choice | TLS-RSA-WITH-AES-256-GCM-SHA384 |",
				"choice | TLS-DHE-DSS-WITH-CAMELLIA-128-CBC-SHA |",
				"choice | TLS-DHE-DSS-WITH-CAMELLIA-256-CBC-SHA |",
				"choice | TLS-DHE-DSS-WITH-CAMELLIA-128-CBC-SHA256 |",
				"choice | TLS-DHE-DSS-WITH-CAMELLIA-256-CBC-SHA256 |",
				"choice | TLS-DHE-DSS-WITH-SEED-CBC-SHA |",
				"choice | TLS-DHE-DSS-WITH-ARIA-128-CBC-SHA256 |",
				"choice | TLS-DHE-DSS-WITH-ARIA-256-CBC-SHA384 |",
				"choice | TLS-ECDHE-RSA-WITH-ARIA-128-CBC-SHA256 |",
				"choice | TLS-ECDHE-RSA-WITH-ARIA-256-CBC-SHA384 |",
				"choice | TLS-ECDHE-ECDSA-WITH-ARIA-128-CBC-SHA256 |",
				"choice | TLS-ECDHE-ECDSA-WITH-ARIA-256-CBC-SHA384 |",
				"choice | TLS-DHE-DSS-WITH-3DES-EDE-CBC-SHA |",
				"choice | TLS-DHE-DSS-WITH-DES-CBC-SHA |",
			]
			required: false
			choices: [
				"TLS-RSA-WITH-RC4-128-MD5",
				"TLS-RSA-WITH-RC4-128-SHA",
				"TLS-RSA-WITH-DES-CBC-SHA",
				"TLS-RSA-WITH-3DES-EDE-CBC-SHA",
				"TLS-RSA-WITH-AES-128-CBC-SHA",
				"TLS-RSA-WITH-AES-256-CBC-SHA",
				"TLS-RSA-WITH-AES-128-CBC-SHA256",
				"TLS-RSA-WITH-AES-256-CBC-SHA256",
				"TLS-RSA-WITH-CAMELLIA-128-CBC-SHA",
				"TLS-RSA-WITH-CAMELLIA-256-CBC-SHA",
				"TLS-RSA-WITH-CAMELLIA-128-CBC-SHA256",
				"TLS-RSA-WITH-CAMELLIA-256-CBC-SHA256",
				"TLS-RSA-WITH-SEED-CBC-SHA",
				"TLS-RSA-WITH-ARIA-128-CBC-SHA256",
				"TLS-RSA-WITH-ARIA-256-CBC-SHA384",
				"TLS-DHE-RSA-WITH-DES-CBC-SHA",
				"TLS-DHE-RSA-WITH-3DES-EDE-CBC-SHA",
				"TLS-DHE-RSA-WITH-AES-128-CBC-SHA",
				"TLS-DHE-RSA-WITH-AES-256-CBC-SHA",
				"TLS-DHE-RSA-WITH-AES-128-CBC-SHA256",
				"TLS-DHE-RSA-WITH-AES-256-CBC-SHA256",
				"TLS-DHE-RSA-WITH-CAMELLIA-128-CBC-SHA",
				"TLS-DHE-RSA-WITH-CAMELLIA-256-CBC-SHA",
				"TLS-DHE-RSA-WITH-CAMELLIA-128-CBC-SHA256",
				"TLS-DHE-RSA-WITH-CAMELLIA-256-CBC-SHA256",
				"TLS-DHE-RSA-WITH-SEED-CBC-SHA",
				"TLS-DHE-RSA-WITH-ARIA-128-CBC-SHA256",
				"TLS-DHE-RSA-WITH-ARIA-256-CBC-SHA384",
				"TLS-ECDHE-RSA-WITH-RC4-128-SHA",
				"TLS-ECDHE-RSA-WITH-3DES-EDE-CBC-SHA",
				"TLS-ECDHE-RSA-WITH-AES-128-CBC-SHA",
				"TLS-ECDHE-RSA-WITH-AES-256-CBC-SHA",
				"TLS-ECDHE-RSA-WITH-CHACHA20-POLY1305-SHA256",
				"TLS-ECDHE-ECDSA-WITH-CHACHA20-POLY1305-SHA256",
				"TLS-DHE-RSA-WITH-CHACHA20-POLY1305-SHA256",
				"TLS-DHE-RSA-WITH-AES-128-GCM-SHA256",
				"TLS-DHE-RSA-WITH-AES-256-GCM-SHA384",
				"TLS-DHE-DSS-WITH-AES-128-CBC-SHA",
				"TLS-DHE-DSS-WITH-AES-256-CBC-SHA",
				"TLS-DHE-DSS-WITH-AES-128-CBC-SHA256",
				"TLS-DHE-DSS-WITH-AES-128-GCM-SHA256",
				"TLS-DHE-DSS-WITH-AES-256-CBC-SHA256",
				"TLS-DHE-DSS-WITH-AES-256-GCM-SHA384",
				"TLS-ECDHE-RSA-WITH-AES-128-CBC-SHA256",
				"TLS-ECDHE-RSA-WITH-AES-128-GCM-SHA256",
				"TLS-ECDHE-RSA-WITH-AES-256-CBC-SHA384",
				"TLS-ECDHE-RSA-WITH-AES-256-GCM-SHA384",
				"TLS-ECDHE-ECDSA-WITH-AES-128-CBC-SHA",
				"TLS-ECDHE-ECDSA-WITH-AES-128-CBC-SHA256",
				"TLS-ECDHE-ECDSA-WITH-AES-128-GCM-SHA256",
				"TLS-ECDHE-ECDSA-WITH-AES-256-CBC-SHA384",
				"TLS-ECDHE-ECDSA-WITH-AES-256-GCM-SHA384",
				"TLS-RSA-WITH-AES-128-GCM-SHA256",
				"TLS-RSA-WITH-AES-256-GCM-SHA384",
				"TLS-DHE-DSS-WITH-CAMELLIA-128-CBC-SHA",
				"TLS-DHE-DSS-WITH-CAMELLIA-256-CBC-SHA",
				"TLS-DHE-DSS-WITH-CAMELLIA-128-CBC-SHA256",
				"TLS-DHE-DSS-WITH-CAMELLIA-256-CBC-SHA256",
				"TLS-DHE-DSS-WITH-SEED-CBC-SHA",
				"TLS-DHE-DSS-WITH-ARIA-128-CBC-SHA256",
				"TLS-DHE-DSS-WITH-ARIA-256-CBC-SHA384",
				"TLS-ECDHE-RSA-WITH-ARIA-128-CBC-SHA256",
				"TLS-ECDHE-RSA-WITH-ARIA-256-CBC-SHA384",
				"TLS-ECDHE-ECDSA-WITH-ARIA-128-CBC-SHA256",
				"TLS-ECDHE-ECDSA-WITH-ARIA-256-CBC-SHA384",
				"TLS-DHE-DSS-WITH-3DES-EDE-CBC-SHA",
				"TLS-DHE-DSS-WITH-DES-CBC-SHA",
			]
		}

		dynamic_mapping_ssl_cipher_suites_versions: {
			description: [
				"Dynamic Mapping Version of Suffixed Option Name. Sub-Table. Same Descriptions as Parent.",
				"FLAG Based Options. Specify multiple in list form.",
				"flag | ssl-3.0 |",
				"flag | tls-1.0 |",
				"flag | tls-1.1 |",
				"flag | tls-1.2 |",
			]
			required: false
			choices: ["ssl-3.0", "tls-1.0", "tls-1.1", "tls-1.2"]
		}

		realservers: {
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

		realservers_client_ip: {
			description: [
				"Only clients in this IP range can connect to this real server.",
			]
			required: false
		}

		realservers_healthcheck: {
			description: [
				"Enable to check the responsiveness of the real server before forwarding traffic.",
				"choice | disable | Disable per server health check.",
				"choice | enable | Enable per server health check.",
				"choice | vip | Use health check defined in VIP.",
			]
			required: false
			choices: ["disable", "enable", "vip"]
		}

		realservers_holddown_interval: {
			description: [
				"Time in seconds that the health check monitor monitors an unresponsive server that should be active.",
			]
			required: false
		}

		realservers_http_host: {
			description: [
				"HTTP server domain name in HTTP header.",
			]
			required: false
		}

		realservers_ip: {
			description: [
				"IP address of the real server.",
			]
			required: false
		}

		realservers_max_connections: {
			description: [
				"Max number of active connections that can be directed to the real server. When reached, sessions are sent to",
				"their real servers.",
			]
			required: false
		}

		realservers_monitor: {
			description: [
				"Name of the health check monitor to use when polling to determine a virtual server's connectivity status.",
			]
			required: false
		}

		realservers_port: {
			description: [
				"Port for communicating with the real server. Required if port forwarding is enabled.",
			]
			required: false
		}

		realservers_seq: {
			description: [
				"Real Server Sequence Number",
			]
			required: false
		}

		realservers_status: {
			description: [
				"Set the status of the real server to active so that it can accept traffic.",
				"Or on standby or disabled so no traffic is sent.",
				"choice | active | Server status active.",
				"choice | standby | Server status standby.",
				"choice | disable | Server status disable.",
			]
			required: false
			choices: ["active", "standby", "disable"]
		}

		realservers_weight: {
			description: [
				"Weight of the real server. If weighted load balancing is enabled, the server with the highest weight gets more",
				"connections.",
			]
			required: false
		}

		ssl_cipher_suites: {
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

		ssl_cipher_suites_cipher: {
			description: [
				"Cipher suite name.",
				"choice | TLS-RSA-WITH-RC4-128-MD5 | Cipher suite TLS-RSA-WITH-RC4-128-MD5.",
				"choice | TLS-RSA-WITH-RC4-128-SHA | Cipher suite TLS-RSA-WITH-RC4-128-SHA.",
				"choice | TLS-RSA-WITH-DES-CBC-SHA | Cipher suite TLS-RSA-WITH-DES-CBC-SHA.",
				"choice | TLS-RSA-WITH-3DES-EDE-CBC-SHA | Cipher suite TLS-RSA-WITH-3DES-EDE-CBC-SHA.",
				"choice | TLS-RSA-WITH-AES-128-CBC-SHA | Cipher suite TLS-RSA-WITH-AES-128-CBC-SHA.",
				"choice | TLS-RSA-WITH-AES-256-CBC-SHA | Cipher suite TLS-RSA-WITH-AES-256-CBC-SHA.",
				"choice | TLS-RSA-WITH-AES-128-CBC-SHA256 | Cipher suite TLS-RSA-WITH-AES-128-CBC-SHA256.",
				"choice | TLS-RSA-WITH-AES-256-CBC-SHA256 | Cipher suite TLS-RSA-WITH-AES-256-CBC-SHA256.",
				"choice | TLS-RSA-WITH-CAMELLIA-128-CBC-SHA | Cipher suite TLS-RSA-WITH-CAMELLIA-128-CBC-SHA.",
				"choice | TLS-RSA-WITH-CAMELLIA-256-CBC-SHA | Cipher suite TLS-RSA-WITH-CAMELLIA-256-CBC-SHA.",
				"choice | TLS-RSA-WITH-CAMELLIA-128-CBC-SHA256 | Cipher suite TLS-RSA-WITH-CAMELLIA-128-CBC-SHA256.",
				"choice | TLS-RSA-WITH-CAMELLIA-256-CBC-SHA256 | Cipher suite TLS-RSA-WITH-CAMELLIA-256-CBC-SHA256.",
				"choice | TLS-RSA-WITH-SEED-CBC-SHA | Cipher suite TLS-RSA-WITH-SEED-CBC-SHA.",
				"choice | TLS-RSA-WITH-ARIA-128-CBC-SHA256 | Cipher suite TLS-RSA-WITH-ARIA-128-CBC-SHA256.",
				"choice | TLS-RSA-WITH-ARIA-256-CBC-SHA384 | Cipher suite TLS-RSA-WITH-ARIA-256-CBC-SHA384.",
				"choice | TLS-DHE-RSA-WITH-DES-CBC-SHA | Cipher suite TLS-DHE-RSA-WITH-DES-CBC-SHA.",
				"choice | TLS-DHE-RSA-WITH-3DES-EDE-CBC-SHA | Cipher suite TLS-DHE-RSA-WITH-3DES-EDE-CBC-SHA.",
				"choice | TLS-DHE-RSA-WITH-AES-128-CBC-SHA | Cipher suite TLS-DHE-RSA-WITH-AES-128-CBC-SHA.",
				"choice | TLS-DHE-RSA-WITH-AES-256-CBC-SHA | Cipher suite TLS-DHE-RSA-WITH-AES-256-CBC-SHA.",
				"choice | TLS-DHE-RSA-WITH-AES-128-CBC-SHA256 | Cipher suite TLS-DHE-RSA-WITH-AES-128-CBC-SHA256.",
				"choice | TLS-DHE-RSA-WITH-AES-256-CBC-SHA256 | Cipher suite TLS-DHE-RSA-WITH-AES-256-CBC-SHA256.",
				"choice | TLS-DHE-RSA-WITH-CAMELLIA-128-CBC-SHA | Cipher suite TLS-DHE-RSA-WITH-CAMELLIA-128-CBC-SHA.",
				"choice | TLS-DHE-RSA-WITH-CAMELLIA-256-CBC-SHA | Cipher suite TLS-DHE-RSA-WITH-CAMELLIA-256-CBC-SHA.",
				"choice | TLS-DHE-RSA-WITH-CAMELLIA-128-CBC-SHA256 | Cipher suite TLS-DHE-RSA-WITH-CAMELLIA-128-CBC-SHA256.",
				"choice | TLS-DHE-RSA-WITH-CAMELLIA-256-CBC-SHA256 | Cipher suite TLS-DHE-RSA-WITH-CAMELLIA-256-CBC-SHA256.",
				"choice | TLS-DHE-RSA-WITH-SEED-CBC-SHA | Cipher suite TLS-DHE-RSA-WITH-SEED-CBC-SHA.",
				"choice | TLS-DHE-RSA-WITH-ARIA-128-CBC-SHA256 | Cipher suite TLS-DHE-RSA-WITH-ARIA-128-CBC-SHA256.",
				"choice | TLS-DHE-RSA-WITH-ARIA-256-CBC-SHA384 | Cipher suite TLS-DHE-RSA-WITH-ARIA-256-CBC-SHA384.",
				"choice | TLS-ECDHE-RSA-WITH-RC4-128-SHA | Cipher suite TLS-ECDHE-RSA-WITH-RC4-128-SHA.",
				"choice | TLS-ECDHE-RSA-WITH-3DES-EDE-CBC-SHA | Cipher suite TLS-ECDHE-RSA-WITH-3DES-EDE-CBC-SHA.",
				"choice | TLS-ECDHE-RSA-WITH-AES-128-CBC-SHA | Cipher suite TLS-ECDHE-RSA-WITH-AES-128-CBC-SHA.",
				"choice | TLS-ECDHE-RSA-WITH-AES-256-CBC-SHA | Cipher suite TLS-ECDHE-RSA-WITH-AES-256-CBC-SHA.",
				"choice | TLS-ECDHE-RSA-WITH-CHACHA20-POLY1305-SHA256 | Cipher suite TLS-ECDHE-RSA-WITH-CHACHA20-POLY1305-SHA256.",
				"choice | TLS-ECDHE-ECDSA-WITH-CHACHA20-POLY1305-SHA256 | Cipher suite TLS-ECDHE-ECDSA-WITH-CHACHA20-POLY1305-SHA256.",
				"choice | TLS-DHE-RSA-WITH-CHACHA20-POLY1305-SHA256 | Cipher suite TLS-DHE-RSA-WITH-CHACHA20-POLY1305-SHA256.",
				"choice | TLS-DHE-RSA-WITH-AES-128-GCM-SHA256 | Cipher suite TLS-DHE-RSA-WITH-AES-128-GCM-SHA256.",
				"choice | TLS-DHE-RSA-WITH-AES-256-GCM-SHA384 | Cipher suite TLS-DHE-RSA-WITH-AES-256-GCM-SHA384.",
				"choice | TLS-DHE-DSS-WITH-AES-128-CBC-SHA | Cipher suite TLS-DHE-DSS-WITH-AES-128-CBC-SHA.",
				"choice | TLS-DHE-DSS-WITH-AES-256-CBC-SHA | Cipher suite TLS-DHE-DSS-WITH-AES-256-CBC-SHA.",
				"choice | TLS-DHE-DSS-WITH-AES-128-CBC-SHA256 | Cipher suite TLS-DHE-DSS-WITH-AES-128-CBC-SHA256.",
				"choice | TLS-DHE-DSS-WITH-AES-128-GCM-SHA256 | Cipher suite TLS-DHE-DSS-WITH-AES-128-GCM-SHA256.",
				"choice | TLS-DHE-DSS-WITH-AES-256-CBC-SHA256 | Cipher suite TLS-DHE-DSS-WITH-AES-256-CBC-SHA256.",
				"choice | TLS-DHE-DSS-WITH-AES-256-GCM-SHA384 | Cipher suite TLS-DHE-DSS-WITH-AES-256-GCM-SHA384.",
				"choice | TLS-ECDHE-RSA-WITH-AES-128-CBC-SHA256 | Cipher suite TLS-ECDHE-RSA-WITH-AES-128-CBC-SHA256.",
				"choice | TLS-ECDHE-RSA-WITH-AES-128-GCM-SHA256 | Cipher suite TLS-ECDHE-RSA-WITH-AES-128-GCM-SHA256.",
				"choice | TLS-ECDHE-RSA-WITH-AES-256-CBC-SHA384 | Cipher suite TLS-ECDHE-RSA-WITH-AES-256-CBC-SHA384.",
				"choice | TLS-ECDHE-RSA-WITH-AES-256-GCM-SHA384 | Cipher suite TLS-ECDHE-RSA-WITH-AES-256-GCM-SHA384.",
				"choice | TLS-ECDHE-ECDSA-WITH-AES-128-CBC-SHA | Cipher suite TLS-ECDHE-ECDSA-WITH-AES-128-CBC-SHA.",
				"choice | TLS-ECDHE-ECDSA-WITH-AES-128-CBC-SHA256 | Cipher suite TLS-ECDHE-ECDSA-WITH-AES-128-CBC-SHA256.",
				"choice | TLS-ECDHE-ECDSA-WITH-AES-128-GCM-SHA256 | Cipher suite TLS-ECDHE-ECDSA-WITH-AES-128-GCM-SHA256.",
				"choice | TLS-ECDHE-ECDSA-WITH-AES-256-CBC-SHA384 | Cipher suite TLS-ECDHE-ECDSA-WITH-AES-256-CBC-SHA384.",
				"choice | TLS-ECDHE-ECDSA-WITH-AES-256-GCM-SHA384 | Cipher suite TLS-ECDHE-ECDSA-WITH-AES-256-GCM-SHA384.",
				"choice | TLS-RSA-WITH-AES-128-GCM-SHA256 | Cipher suite TLS-RSA-WITH-AES-128-GCM-SHA256.",
				"choice | TLS-RSA-WITH-AES-256-GCM-SHA384 | Cipher suite TLS-RSA-WITH-AES-256-GCM-SHA384.",
				"choice | TLS-DHE-DSS-WITH-CAMELLIA-128-CBC-SHA | Cipher suite TLS-DSS-RSA-WITH-CAMELLIA-128-CBC-SHA.",
				"choice | TLS-DHE-DSS-WITH-CAMELLIA-256-CBC-SHA | Cipher suite TLS-DHE-DSS-WITH-CAMELLIA-256-CBC-SHA.",
				"choice | TLS-DHE-DSS-WITH-CAMELLIA-128-CBC-SHA256 | Cipher suite TLS-DHE-DSS-WITH-CAMELLIA-128-CBC-SHA256.",
				"choice | TLS-DHE-DSS-WITH-CAMELLIA-256-CBC-SHA256 | Cipher suite TLS-DHE-DSS-WITH-CAMELLIA-256-CBC-SHA256.",
				"choice | TLS-DHE-DSS-WITH-SEED-CBC-SHA | Cipher suite TLS-DHE-DSS-WITH-SEED-CBC-SHA.",
				"choice | TLS-DHE-DSS-WITH-ARIA-128-CBC-SHA256 | Cipher suite TLS-DHE-DSS-WITH-ARIA-128-CBC-SHA256.",
				"choice | TLS-DHE-DSS-WITH-ARIA-256-CBC-SHA384 | Cipher suite TLS-DHE-DSS-WITH-ARIA-256-CBC-SHA384.",
				"choice | TLS-ECDHE-RSA-WITH-ARIA-128-CBC-SHA256 | Cipher suite TLS-ECDHE-RSA-WITH-ARIA-128-CBC-SHA256.",
				"choice | TLS-ECDHE-RSA-WITH-ARIA-256-CBC-SHA384 | Cipher suite TLS-ECDHE-RSA-WITH-ARIA-256-CBC-SHA384.",
				"choice | TLS-ECDHE-ECDSA-WITH-ARIA-128-CBC-SHA256 | Cipher suite TLS-ECDHE-ECDSA-WITH-ARIA-128-CBC_SHA256.",
				"choice | TLS-ECDHE-ECDSA-WITH-ARIA-256-CBC-SHA384 | Cipher suite TLS-ECDHE-ECDSA-WITH-ARIA-256-CBC_SHA384.",
				"choice | TLS-DHE-DSS-WITH-3DES-EDE-CBC-SHA | Cipher suite TLS-DHE-DSS-WITH-3DES-EDE-CBC-SHA.",
				"choice | TLS-DHE-DSS-WITH-DES-CBC-SHA | Cipher suite TLS-DHE-DSS-WITH-DES-CBC-SHA.",
			]
			required: false
			choices: [
				"TLS-RSA-WITH-RC4-128-MD5",
				"TLS-RSA-WITH-RC4-128-SHA",
				"TLS-RSA-WITH-DES-CBC-SHA",
				"TLS-RSA-WITH-3DES-EDE-CBC-SHA",
				"TLS-RSA-WITH-AES-128-CBC-SHA",
				"TLS-RSA-WITH-AES-256-CBC-SHA",
				"TLS-RSA-WITH-AES-128-CBC-SHA256",
				"TLS-RSA-WITH-AES-256-CBC-SHA256",
				"TLS-RSA-WITH-CAMELLIA-128-CBC-SHA",
				"TLS-RSA-WITH-CAMELLIA-256-CBC-SHA",
				"TLS-RSA-WITH-CAMELLIA-128-CBC-SHA256",
				"TLS-RSA-WITH-CAMELLIA-256-CBC-SHA256",
				"TLS-RSA-WITH-SEED-CBC-SHA",
				"TLS-RSA-WITH-ARIA-128-CBC-SHA256",
				"TLS-RSA-WITH-ARIA-256-CBC-SHA384",
				"TLS-DHE-RSA-WITH-DES-CBC-SHA",
				"TLS-DHE-RSA-WITH-3DES-EDE-CBC-SHA",
				"TLS-DHE-RSA-WITH-AES-128-CBC-SHA",
				"TLS-DHE-RSA-WITH-AES-256-CBC-SHA",
				"TLS-DHE-RSA-WITH-AES-128-CBC-SHA256",
				"TLS-DHE-RSA-WITH-AES-256-CBC-SHA256",
				"TLS-DHE-RSA-WITH-CAMELLIA-128-CBC-SHA",
				"TLS-DHE-RSA-WITH-CAMELLIA-256-CBC-SHA",
				"TLS-DHE-RSA-WITH-CAMELLIA-128-CBC-SHA256",
				"TLS-DHE-RSA-WITH-CAMELLIA-256-CBC-SHA256",
				"TLS-DHE-RSA-WITH-SEED-CBC-SHA",
				"TLS-DHE-RSA-WITH-ARIA-128-CBC-SHA256",
				"TLS-DHE-RSA-WITH-ARIA-256-CBC-SHA384",
				"TLS-ECDHE-RSA-WITH-RC4-128-SHA",
				"TLS-ECDHE-RSA-WITH-3DES-EDE-CBC-SHA",
				"TLS-ECDHE-RSA-WITH-AES-128-CBC-SHA",
				"TLS-ECDHE-RSA-WITH-AES-256-CBC-SHA",
				"TLS-ECDHE-RSA-WITH-CHACHA20-POLY1305-SHA256",
				"TLS-ECDHE-ECDSA-WITH-CHACHA20-POLY1305-SHA256",
				"TLS-DHE-RSA-WITH-CHACHA20-POLY1305-SHA256",
				"TLS-DHE-RSA-WITH-AES-128-GCM-SHA256",
				"TLS-DHE-RSA-WITH-AES-256-GCM-SHA384",
				"TLS-DHE-DSS-WITH-AES-128-CBC-SHA",
				"TLS-DHE-DSS-WITH-AES-256-CBC-SHA",
				"TLS-DHE-DSS-WITH-AES-128-CBC-SHA256",
				"TLS-DHE-DSS-WITH-AES-128-GCM-SHA256",
				"TLS-DHE-DSS-WITH-AES-256-CBC-SHA256",
				"TLS-DHE-DSS-WITH-AES-256-GCM-SHA384",
				"TLS-ECDHE-RSA-WITH-AES-128-CBC-SHA256",
				"TLS-ECDHE-RSA-WITH-AES-128-GCM-SHA256",
				"TLS-ECDHE-RSA-WITH-AES-256-CBC-SHA384",
				"TLS-ECDHE-RSA-WITH-AES-256-GCM-SHA384",
				"TLS-ECDHE-ECDSA-WITH-AES-128-CBC-SHA",
				"TLS-ECDHE-ECDSA-WITH-AES-128-CBC-SHA256",
				"TLS-ECDHE-ECDSA-WITH-AES-128-GCM-SHA256",
				"TLS-ECDHE-ECDSA-WITH-AES-256-CBC-SHA384",
				"TLS-ECDHE-ECDSA-WITH-AES-256-GCM-SHA384",
				"TLS-RSA-WITH-AES-128-GCM-SHA256",
				"TLS-RSA-WITH-AES-256-GCM-SHA384",
				"TLS-DHE-DSS-WITH-CAMELLIA-128-CBC-SHA",
				"TLS-DHE-DSS-WITH-CAMELLIA-256-CBC-SHA",
				"TLS-DHE-DSS-WITH-CAMELLIA-128-CBC-SHA256",
				"TLS-DHE-DSS-WITH-CAMELLIA-256-CBC-SHA256",
				"TLS-DHE-DSS-WITH-SEED-CBC-SHA",
				"TLS-DHE-DSS-WITH-ARIA-128-CBC-SHA256",
				"TLS-DHE-DSS-WITH-ARIA-256-CBC-SHA384",
				"TLS-ECDHE-RSA-WITH-ARIA-128-CBC-SHA256",
				"TLS-ECDHE-RSA-WITH-ARIA-256-CBC-SHA384",
				"TLS-ECDHE-ECDSA-WITH-ARIA-128-CBC-SHA256",
				"TLS-ECDHE-ECDSA-WITH-ARIA-256-CBC-SHA384",
				"TLS-DHE-DSS-WITH-3DES-EDE-CBC-SHA",
				"TLS-DHE-DSS-WITH-DES-CBC-SHA",
			]
		}

		ssl_cipher_suites_versions: {
			description: [
				"SSL/TLS versions that the cipher suite can be used with.",
				"FLAG Based Options. Specify multiple in list form.",
				"flag | ssl-3.0 | SSL 3.0.",
				"flag | tls-1.0 | TLS 1.0.",
				"flag | tls-1.1 | TLS 1.1.",
				"flag | tls-1.2 | TLS 1.2.",
			]
			required: false
			choices: ["ssl-3.0", "tls-1.0", "tls-1.1", "tls-1.2"]
		}

		ssl_server_cipher_suites: {
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

		ssl_server_cipher_suites_cipher: {
			description: [
				"Cipher suite name.",
				"choice | TLS-RSA-WITH-RC4-128-MD5 | Cipher suite TLS-RSA-WITH-RC4-128-MD5.",
				"choice | TLS-RSA-WITH-RC4-128-SHA | Cipher suite TLS-RSA-WITH-RC4-128-SHA.",
				"choice | TLS-RSA-WITH-DES-CBC-SHA | Cipher suite TLS-RSA-WITH-DES-CBC-SHA.",
				"choice | TLS-RSA-WITH-3DES-EDE-CBC-SHA | Cipher suite TLS-RSA-WITH-3DES-EDE-CBC-SHA.",
				"choice | TLS-RSA-WITH-AES-128-CBC-SHA | Cipher suite TLS-RSA-WITH-AES-128-CBC-SHA.",
				"choice | TLS-RSA-WITH-AES-256-CBC-SHA | Cipher suite TLS-RSA-WITH-AES-256-CBC-SHA.",
				"choice | TLS-RSA-WITH-AES-128-CBC-SHA256 | Cipher suite TLS-RSA-WITH-AES-128-CBC-SHA256.",
				"choice | TLS-RSA-WITH-AES-256-CBC-SHA256 | Cipher suite TLS-RSA-WITH-AES-256-CBC-SHA256.",
				"choice | TLS-RSA-WITH-CAMELLIA-128-CBC-SHA | Cipher suite TLS-RSA-WITH-CAMELLIA-128-CBC-SHA.",
				"choice | TLS-RSA-WITH-CAMELLIA-256-CBC-SHA | Cipher suite TLS-RSA-WITH-CAMELLIA-256-CBC-SHA.",
				"choice | TLS-RSA-WITH-CAMELLIA-128-CBC-SHA256 | Cipher suite TLS-RSA-WITH-CAMELLIA-128-CBC-SHA256.",
				"choice | TLS-RSA-WITH-CAMELLIA-256-CBC-SHA256 | Cipher suite TLS-RSA-WITH-CAMELLIA-256-CBC-SHA256.",
				"choice | TLS-RSA-WITH-SEED-CBC-SHA | Cipher suite TLS-RSA-WITH-SEED-CBC-SHA.",
				"choice | TLS-RSA-WITH-ARIA-128-CBC-SHA256 | Cipher suite TLS-RSA-WITH-ARIA-128-CBC-SHA256.",
				"choice | TLS-RSA-WITH-ARIA-256-CBC-SHA384 | Cipher suite TLS-RSA-WITH-ARIA-256-CBC-SHA384.",
				"choice | TLS-DHE-RSA-WITH-DES-CBC-SHA | Cipher suite TLS-DHE-RSA-WITH-DES-CBC-SHA.",
				"choice | TLS-DHE-RSA-WITH-3DES-EDE-CBC-SHA | Cipher suite TLS-DHE-RSA-WITH-3DES-EDE-CBC-SHA.",
				"choice | TLS-DHE-RSA-WITH-AES-128-CBC-SHA | Cipher suite TLS-DHE-RSA-WITH-AES-128-CBC-SHA.",
				"choice | TLS-DHE-RSA-WITH-AES-256-CBC-SHA | Cipher suite TLS-DHE-RSA-WITH-AES-256-CBC-SHA.",
				"choice | TLS-DHE-RSA-WITH-AES-128-CBC-SHA256 | Cipher suite TLS-DHE-RSA-WITH-AES-128-CBC-SHA256.",
				"choice | TLS-DHE-RSA-WITH-AES-256-CBC-SHA256 | Cipher suite TLS-DHE-RSA-WITH-AES-256-CBC-SHA256.",
				"choice | TLS-DHE-RSA-WITH-CAMELLIA-128-CBC-SHA | Cipher suite TLS-DHE-RSA-WITH-CAMELLIA-128-CBC-SHA.",
				"choice | TLS-DHE-RSA-WITH-CAMELLIA-256-CBC-SHA | Cipher suite TLS-DHE-RSA-WITH-CAMELLIA-256-CBC-SHA.",
				"choice | TLS-DHE-RSA-WITH-CAMELLIA-128-CBC-SHA256 | Cipher suite TLS-DHE-RSA-WITH-CAMELLIA-128-CBC-SHA256.",
				"choice | TLS-DHE-RSA-WITH-CAMELLIA-256-CBC-SHA256 | Cipher suite TLS-DHE-RSA-WITH-CAMELLIA-256-CBC-SHA256.",
				"choice | TLS-DHE-RSA-WITH-SEED-CBC-SHA | Cipher suite TLS-DHE-RSA-WITH-SEED-CBC-SHA.",
				"choice | TLS-DHE-RSA-WITH-ARIA-128-CBC-SHA256 | Cipher suite TLS-DHE-RSA-WITH-ARIA-128-CBC-SHA256.",
				"choice | TLS-DHE-RSA-WITH-ARIA-256-CBC-SHA384 | Cipher suite TLS-DHE-RSA-WITH-ARIA-256-CBC-SHA384.",
				"choice | TLS-ECDHE-RSA-WITH-RC4-128-SHA | Cipher suite TLS-ECDHE-RSA-WITH-RC4-128-SHA.",
				"choice | TLS-ECDHE-RSA-WITH-3DES-EDE-CBC-SHA | Cipher suite TLS-ECDHE-RSA-WITH-3DES-EDE-CBC-SHA.",
				"choice | TLS-ECDHE-RSA-WITH-AES-128-CBC-SHA | Cipher suite TLS-ECDHE-RSA-WITH-AES-128-CBC-SHA.",
				"choice | TLS-ECDHE-RSA-WITH-AES-256-CBC-SHA | Cipher suite TLS-ECDHE-RSA-WITH-AES-256-CBC-SHA.",
				"choice | TLS-ECDHE-RSA-WITH-CHACHA20-POLY1305-SHA256 | Cipher suite TLS-ECDHE-RSA-WITH-CHACHA20-POLY1305-SHA256.",
				"choice | TLS-ECDHE-ECDSA-WITH-CHACHA20-POLY1305-SHA256 | Suite TLS-ECDHE-ECDSA-WITH-CHACHA20-POLY1305-SHA256.",
				"choice | TLS-DHE-RSA-WITH-CHACHA20-POLY1305-SHA256 | Cipher suite TLS-DHE-RSA-WITH-CHACHA20-POLY1305-SHA256.",
				"choice | TLS-DHE-RSA-WITH-AES-128-GCM-SHA256 | Cipher suite TLS-DHE-RSA-WITH-AES-128-GCM-SHA256.",
				"choice | TLS-DHE-RSA-WITH-AES-256-GCM-SHA384 | Cipher suite TLS-DHE-RSA-WITH-AES-256-GCM-SHA384.",
				"choice | TLS-DHE-DSS-WITH-AES-128-CBC-SHA | Cipher suite TLS-DHE-DSS-WITH-AES-128-CBC-SHA.",
				"choice | TLS-DHE-DSS-WITH-AES-256-CBC-SHA | Cipher suite TLS-DHE-DSS-WITH-AES-256-CBC-SHA.",
				"choice | TLS-DHE-DSS-WITH-AES-128-CBC-SHA256 | Cipher suite TLS-DHE-DSS-WITH-AES-128-CBC-SHA256.",
				"choice | TLS-DHE-DSS-WITH-AES-128-GCM-SHA256 | Cipher suite TLS-DHE-DSS-WITH-AES-128-GCM-SHA256.",
				"choice | TLS-DHE-DSS-WITH-AES-256-CBC-SHA256 | Cipher suite TLS-DHE-DSS-WITH-AES-256-CBC-SHA256.",
				"choice | TLS-DHE-DSS-WITH-AES-256-GCM-SHA384 | Cipher suite TLS-DHE-DSS-WITH-AES-256-GCM-SHA384.",
				"choice | TLS-ECDHE-RSA-WITH-AES-128-CBC-SHA256 | Cipher suite TLS-ECDHE-RSA-WITH-AES-128-CBC-SHA256.",
				"choice | TLS-ECDHE-RSA-WITH-AES-128-GCM-SHA256 | Cipher suite TLS-ECDHE-RSA-WITH-AES-128-GCM-SHA256.",
				"choice | TLS-ECDHE-RSA-WITH-AES-256-CBC-SHA384 | Cipher suite TLS-ECDHE-RSA-WITH-AES-256-CBC-SHA384.",
				"choice | TLS-ECDHE-RSA-WITH-AES-256-GCM-SHA384 | Cipher suite TLS-ECDHE-RSA-WITH-AES-256-GCM-SHA384.",
				"choice | TLS-ECDHE-ECDSA-WITH-AES-128-CBC-SHA | Cipher suite TLS-ECDHE-ECDSA-WITH-AES-128-CBC-SHA.",
				"choice | TLS-ECDHE-ECDSA-WITH-AES-128-CBC-SHA256 | Cipher suite TLS-ECDHE-ECDSA-WITH-AES-128-CBC-SHA256.",
				"choice | TLS-ECDHE-ECDSA-WITH-AES-128-GCM-SHA256 | Cipher suite TLS-ECDHE-ECDSA-WITH-AES-128-GCM-SHA256.",
				"choice | TLS-ECDHE-ECDSA-WITH-AES-256-CBC-SHA384 | Cipher suite TLS-ECDHE-ECDSA-WITH-AES-256-CBC-SHA384.",
				"choice | TLS-ECDHE-ECDSA-WITH-AES-256-GCM-SHA384 | Cipher suite TLS-ECDHE-ECDSA-WITH-AES-256-GCM-SHA384.",
				"choice | TLS-RSA-WITH-AES-128-GCM-SHA256 | Cipher suite TLS-RSA-WITH-AES-128-GCM-SHA256.",
				"choice | TLS-RSA-WITH-AES-256-GCM-SHA384 | Cipher suite TLS-RSA-WITH-AES-256-GCM-SHA384.",
				"choice | TLS-DHE-DSS-WITH-CAMELLIA-128-CBC-SHA | Cipher suite TLS-DSS-RSA-WITH-CAMELLIA-128-CBC-SHA.",
				"choice | TLS-DHE-DSS-WITH-CAMELLIA-256-CBC-SHA | Cipher suite TLS-DHE-DSS-WITH-CAMELLIA-256-CBC-SHA.",
				"choice | TLS-DHE-DSS-WITH-CAMELLIA-128-CBC-SHA256 | Cipher suite TLS-DHE-DSS-WITH-CAMELLIA-128-CBC-SHA256.",
				"choice | TLS-DHE-DSS-WITH-CAMELLIA-256-CBC-SHA256 | Cipher suite TLS-DHE-DSS-WITH-CAMELLIA-256-CBC-SHA256.",
				"choice | TLS-DHE-DSS-WITH-SEED-CBC-SHA | Cipher suite TLS-DHE-DSS-WITH-SEED-CBC-SHA.",
				"choice | TLS-DHE-DSS-WITH-ARIA-128-CBC-SHA256 | Cipher suite TLS-DHE-DSS-WITH-ARIA-128-CBC-SHA256.",
				"choice | TLS-DHE-DSS-WITH-ARIA-256-CBC-SHA384 | Cipher suite TLS-DHE-DSS-WITH-ARIA-256-CBC-SHA384.",
				"choice | TLS-ECDHE-RSA-WITH-ARIA-128-CBC-SHA256 | Cipher suite TLS-ECDHE-RSA-WITH-ARIA-128-CBC-SHA256.",
				"choice | TLS-ECDHE-RSA-WITH-ARIA-256-CBC-SHA384 | Cipher suite TLS-ECDHE-RSA-WITH-ARIA-256-CBC-SHA384.",
				"choice | TLS-ECDHE-ECDSA-WITH-ARIA-128-CBC-SHA256 | Cipher suite TLS-ECDHE-ECDSA-WITH-ARIA-128-CBC_SHA256.",
				"choice | TLS-ECDHE-ECDSA-WITH-ARIA-256-CBC-SHA384 | Cipher suite TLS-ECDHE-ECDSA-WITH-ARIA-256-CBC_SHA384.",
				"choice | TLS-DHE-DSS-WITH-3DES-EDE-CBC-SHA | Cipher suite TLS-DHE-DSS-WITH-3DES-EDE-CBC-SHA.",
				"choice | TLS-DHE-DSS-WITH-DES-CBC-SHA | Cipher suite TLS-DHE-DSS-WITH-DES-CBC-SHA.",
			]
			required: false
			choices: [
				"TLS-RSA-WITH-RC4-128-MD5",
				"TLS-RSA-WITH-RC4-128-SHA",
				"TLS-RSA-WITH-DES-CBC-SHA",
				"TLS-RSA-WITH-3DES-EDE-CBC-SHA",
				"TLS-RSA-WITH-AES-128-CBC-SHA",
				"TLS-RSA-WITH-AES-256-CBC-SHA",
				"TLS-RSA-WITH-AES-128-CBC-SHA256",
				"TLS-RSA-WITH-AES-256-CBC-SHA256",
				"TLS-RSA-WITH-CAMELLIA-128-CBC-SHA",
				"TLS-RSA-WITH-CAMELLIA-256-CBC-SHA",
				"TLS-RSA-WITH-CAMELLIA-128-CBC-SHA256",
				"TLS-RSA-WITH-CAMELLIA-256-CBC-SHA256",
				"TLS-RSA-WITH-SEED-CBC-SHA",
				"TLS-RSA-WITH-ARIA-128-CBC-SHA256",
				"TLS-RSA-WITH-ARIA-256-CBC-SHA384",
				"TLS-DHE-RSA-WITH-DES-CBC-SHA",
				"TLS-DHE-RSA-WITH-3DES-EDE-CBC-SHA",
				"TLS-DHE-RSA-WITH-AES-128-CBC-SHA",
				"TLS-DHE-RSA-WITH-AES-256-CBC-SHA",
				"TLS-DHE-RSA-WITH-AES-128-CBC-SHA256",
				"TLS-DHE-RSA-WITH-AES-256-CBC-SHA256",
				"TLS-DHE-RSA-WITH-CAMELLIA-128-CBC-SHA",
				"TLS-DHE-RSA-WITH-CAMELLIA-256-CBC-SHA",
				"TLS-DHE-RSA-WITH-CAMELLIA-128-CBC-SHA256",
				"TLS-DHE-RSA-WITH-CAMELLIA-256-CBC-SHA256",
				"TLS-DHE-RSA-WITH-SEED-CBC-SHA",
				"TLS-DHE-RSA-WITH-ARIA-128-CBC-SHA256",
				"TLS-DHE-RSA-WITH-ARIA-256-CBC-SHA384",
				"TLS-ECDHE-RSA-WITH-RC4-128-SHA",
				"TLS-ECDHE-RSA-WITH-3DES-EDE-CBC-SHA",
				"TLS-ECDHE-RSA-WITH-AES-128-CBC-SHA",
				"TLS-ECDHE-RSA-WITH-AES-256-CBC-SHA",
				"TLS-ECDHE-RSA-WITH-CHACHA20-POLY1305-SHA256",
				"TLS-ECDHE-ECDSA-WITH-CHACHA20-POLY1305-SHA256",
				"TLS-DHE-RSA-WITH-CHACHA20-POLY1305-SHA256",
				"TLS-DHE-RSA-WITH-AES-128-GCM-SHA256",
				"TLS-DHE-RSA-WITH-AES-256-GCM-SHA384",
				"TLS-DHE-DSS-WITH-AES-128-CBC-SHA",
				"TLS-DHE-DSS-WITH-AES-256-CBC-SHA",
				"TLS-DHE-DSS-WITH-AES-128-CBC-SHA256",
				"TLS-DHE-DSS-WITH-AES-128-GCM-SHA256",
				"TLS-DHE-DSS-WITH-AES-256-CBC-SHA256",
				"TLS-DHE-DSS-WITH-AES-256-GCM-SHA384",
				"TLS-ECDHE-RSA-WITH-AES-128-CBC-SHA256",
				"TLS-ECDHE-RSA-WITH-AES-128-GCM-SHA256",
				"TLS-ECDHE-RSA-WITH-AES-256-CBC-SHA384",
				"TLS-ECDHE-RSA-WITH-AES-256-GCM-SHA384",
				"TLS-ECDHE-ECDSA-WITH-AES-128-CBC-SHA",
				"TLS-ECDHE-ECDSA-WITH-AES-128-CBC-SHA256",
				"TLS-ECDHE-ECDSA-WITH-AES-128-GCM-SHA256",
				"TLS-ECDHE-ECDSA-WITH-AES-256-CBC-SHA384",
				"TLS-ECDHE-ECDSA-WITH-AES-256-GCM-SHA384",
				"TLS-RSA-WITH-AES-128-GCM-SHA256",
				"TLS-RSA-WITH-AES-256-GCM-SHA384",
				"TLS-DHE-DSS-WITH-CAMELLIA-128-CBC-SHA",
				"TLS-DHE-DSS-WITH-CAMELLIA-256-CBC-SHA",
				"TLS-DHE-DSS-WITH-CAMELLIA-128-CBC-SHA256",
				"TLS-DHE-DSS-WITH-CAMELLIA-256-CBC-SHA256",
				"TLS-DHE-DSS-WITH-SEED-CBC-SHA",
				"TLS-DHE-DSS-WITH-ARIA-128-CBC-SHA256",
				"TLS-DHE-DSS-WITH-ARIA-256-CBC-SHA384",
				"TLS-ECDHE-RSA-WITH-ARIA-128-CBC-SHA256",
				"TLS-ECDHE-RSA-WITH-ARIA-256-CBC-SHA384",
				"TLS-ECDHE-ECDSA-WITH-ARIA-128-CBC-SHA256",
				"TLS-ECDHE-ECDSA-WITH-ARIA-256-CBC-SHA384",
				"TLS-DHE-DSS-WITH-3DES-EDE-CBC-SHA",
				"TLS-DHE-DSS-WITH-DES-CBC-SHA",
			]
		}

		ssl_server_cipher_suites_priority: {
			description: [
				"SSL/TLS cipher suites priority.",
			]
			required: false
		}

		ssl_server_cipher_suites_versions: {
			description: [
				"SSL/TLS versions that the cipher suite can be used with.",
				"FLAG Based Options. Specify multiple in list form.",
				"flag | ssl-3.0 | SSL 3.0.",
				"flag | tls-1.0 | TLS 1.0.",
				"flag | tls-1.1 | TLS 1.1.",
				"flag | tls-1.2 | TLS 1.2.",
			]
			required: false
			choices: ["ssl-3.0", "tls-1.0", "tls-1.1", "tls-1.2"]
		}
	}
}
