package netbox

haproxy :: {

	// Fail whenever trying to enable/disable a backend host that does not exist

	fail_on_not_found?: bool

	// Name of the backend host to change.

	host: string

	// Path to the HAProxy socket file.

	socket?: string

	// Desired state of the provided backend host.
	// Note that C(drain) state was added in version 2.4.
	// It is supported only by HAProxy version 1.5 or later,
	// When used on versions < 1.5, it will be ignored.

	state: string

	// Name of the HAProxy backend pool.
	// If this parameter is unset, it will be auto-detected.

	backend?: string

	// Wait until the server has no active connections or until the timeout determined by wait_interval and wait_retries is reached.
	// Continue only after the status changes to 'MAINT'.
	// This overrides the shutdown_sessions option.

	drain?: bool

	// When disabling a server, immediately terminate all the sessions attached to the specified server.
	// This can be used to terminate long-running sessions after a server is put into maintenance mode. Overridden by the drain option.

	shutdown_sessions?: bool

	// Wait until the server reports a status of 'UP' when C(state=enabled), status of 'MAINT' when C(state=disabled) or status of 'DRAIN' when C(state=drain)

	wait?: bool

	// Number of seconds to wait between retries.

	wait_interval?: int

	// Number of times to check for status after changing the state.

	wait_retries?: int

	// The value passed in argument.
	// If the value ends with the `%` sign, then the new weight will be relative to the initially configured weight.
	// Relative weights are only permitted between 0 and 100% and absolute weights are permitted between 0 and 256.

	weight?: string
}

lldp :: {
}

netbox_device :: {

	// Defines the device configuration

	data: string

	// The token created within Netbox to authorize API access

	netbox_token: string

	// URL of the Netbox instance resolvable by Ansible control host

	netbox_url: string

	// Use C(present) or C(absent) for adding or removing.

	state?: string

	// If C(no), SSL certificates will not be validated. This should only be used on personally controlled sites using self-signed certificates.

	validate_certs?: bool
}

netbox_site :: {

	// The token created within Netbox to authorize API access

	netbox_token: string

	// URL of the Netbox instance resolvable by Ansible control host

	netbox_url: string

	// Use C(present) or C(absent) for adding or removing.

	state?: string

	// If C(no), SSL certificates will not be validated.
This should only be used on personally controlled sites using self-signed certificates.


	validate_certs?: bool

	// Defines the site configuration

	data: string
}

nmcli :: {

	// The name used to call the connection. Pattern is <type>[-<ifname>][-<num>].

	conn_name: string

	// A list of up to 3 dns servers.
	// IPv4 format e.g. to add two IPv4 DNS server addresses, use C(192.0.2.53 198.51.100.53).

	dns4?: [..._]

	// This is only used with bridge - [hello-time <1-10>] STP hello time, in seconds.

	hellotime?: int

	// This is only used with 'bridge-slave' - [<1-65535>] - STP port cost for destinations via this slave.

	path_cost?: int

	// Whether the device should exist or not, taking action if the state is different from what is stated.

	state: string

	// Whether the connection should start on boot.
	// Whether the connection profile can be automatically activated

	autoconnect?: bool

	// Master <master (ifname, or connection UUID or conn_name) of bridge, team, bond master connection profile.

	master?: string

	// This is only used with bond - ARP IP target.

	arp_ip_target?: string

	// A list of DNS search domains.

	dns4_search?: [..._]

	// The IPv6 address to this interface.
	// Use the format C(abbe::cafe).

	ip6?: string

	// This is only used with bridge and controls whether Spanning Tree Protocol (STP) is enabled for this bridge.

	stp?: bool

	// This is the type of device or network connection that you wish to create or modify.
	// Type C(generic) is added in Ansible 2.5.

	type?: string

	// This is only used with bond - updelay.

	updelay?: int

	// This is only used with VXLAN - VXLAN local IP address.

	vxlan_local?: string

	// This is only used with bridge - [ageing-time <0-1000000>] the Ethernet MAC address aging time, in seconds.

	ageingtime?: int

	// This is only used with 'bridge-slave' - [<0-63>] - STP priority of this slave.

	slavepriority?: int

	// This is only used with bond - miimon.
	// This parameter defaults to C(100) when unset.

	miimon?: int

	// A list of up to 3 dns servers.
	// IPv6 format e.g. to add two IPv6 DNS server addresses, use C(2001:4860:4860::8888 2001:4860:4860::8844).

	dns6?: [..._]

	// This is only used with VLAN - VLAN egress priority mapping.

	egress?: string

	// The IPv4 gateway for this interface.
	// Use the format C(192.0.2.1).

	gw4?: string

	// The IPv6 gateway for this interface.
	// Use the format C(2001:db8::1).

	gw6?: string

	// This is used with IPIP/SIT - IPIP/SIT destination IP address.

	ip_tunnel_remote?: string

	// This is only used with bond - ARP interval.

	arp_interval?: int

	// This is only used with bridge - [forward-delay <2-30>] STP forwarding delay, in seconds.

	forwarddelay?: int

	// The interface to bind the connection to.
	// The connection will only be applicable to this interface name.
	// A special value of C('*') can be used for interface-independent connections.
	// The ifname argument is mandatory for all connection types except bond, team, bridge and vlan.
	// This parameter defaults to C(conn_name) when left unset.

	ifname?: string

	// This is used with IPIP/SIT - parent device this IPIP/SIT tunnel, can use ifname.

	ip_tunnel_dev?: string

	// This is only used with bridge - MAC address of the bridge.
	// Note this requires a recent kernel feature, originally introduced in 3.15 upstream kernel.

	mac?: string

	// This is the type of device or network connection that you wish to create for a bond, team or bridge.

	mode?: string

	// This is only used with VXLAN - VXLAN destination IP address.

	vxlan_remote?: string

	// This is only used with VLAN - flags.

	flags?: string

	// This is only used with 'bridge-slave' - 'hairpin mode' for the slave, which allows frames to be sent back out through the slave the frame was received on.

	hairpin?: bool

	// This is used with IPIP/SIT - IPIP/SIT local IP address.

	ip_tunnel_local?: string

	// The IPv4 address to this interface.
	// Use the format C(192.0.2.24/24).

	ip4?: string

	// This is only used with bridge - [max-age <6-42>] STP maximum message age, in seconds.

	maxage?: int

	// The connection MTU, e.g. 9000. This can't be applied when creating the interface and is done once the interface has been created.
	// Can be used when modifying Team, VLAN, Ethernet (Future plans to implement wifi, pppoe, infiniband)
	// This parameter defaults to C(1500) when unset.

	mtu?: int

	// This is only used with VLAN - parent device this VLAN is on, can use ifname.

	vlandev?: string

	// This is only used with VLAN - VLAN ID in range <0-4095>.

	vlanid?: int

	// This is only used with bond - downdelay.

	downdelay?: int

	// This is only used with VXLAN - VXLAN ID.

	vxlan_id?: int

	// A list of DNS search domains.

	dns6_search?: [..._]

	// This is only used with VLAN - VLAN ingress priority mapping.

	ingress?: string

	// This is only used with bond and is the primary interface name (for "active-backup" mode), this is the usually the 'ifname'.

	primary?: string

	// This is only used with 'bridge' - sets STP priority.

	priority?: int

	// DHCP Client Identifier sent to the DHCP server.

	dhcp_client_id?: string
}

nsupdate :: {

	// Sets the transport protocol (TCP or UDP). TCP is the recommended and a more robust option.

	protocol?: string

	// Apply DNS modification on this server.

	server: string

	// Sets the record type.

	type?: string

	// Use TSIG key name to authenticate against DNS C(server)

	key_name?: string

	// Use TSIG key secret, associated with C(key_name), to authenticate against C(server)

	key_secret?: string

	// Use this TCP port when connecting to C(server).

	port?: string

	// Sets the DNS record to modify. When zone is omitted this has to be absolute (ending with a dot).

	record: string

	// Manage DNS record.

	state?: string

	// Sets the record TTL.

	ttl?: string

	// Sets the record value.

	value?: string

	// DNS record will be modified on this C(zone).
	// When omitted DNS will be queried to attempt finding the correct zone.
	// Starting with Ansible 2.7 this parameter is optional.

	zone?: string

	// Specify key algorithm used by C(key_secret).

	key_algorithm?: string
}

dnsimple :: {

	// whether the record should exist or not.

	state?: string

	// Record value.
	// Must be specified when trying to ensure a record exists.

	value?: string

	// Account API token. See I(account_email) for more information.

	account_api_token?: string

	// Domain to work with. Can be the domain name (e.g. "mydomain.com") or the numeric ID of the domain in DNSimple.
	// If omitted, a list of domains will be returned.
	// If domain is present but the domain doesn't exist, it will be created.

	domain?: string

	// Record to add, if blank a record for the domain will be created, supports the wildcard (*).

	record?: string

	// List of records to ensure they either exist or do not exist.

	record_ids?: [..._]

	// The type of DNS record to create.

	type?: string

	// Account email. If omitted, the environment variables C(DNSIMPLE_EMAIL) and C(DNSIMPLE_API_TOKEN) will be looked for.
	// If those aren't found, a C(.dnsimple) file will be looked for, see: U(https://github.com/mikemaccana/dnsimple-python#getting-started).

	account_email?: string

	// Record priority.

	priority?: int

	// Whether the record should be the only one for that record type and record name.
	// Only use with C(state) is set to C(present) on a record.

	solo?: bool

	// The TTL to give the new record in seconds.

	ttl?: int
}

ip_netns :: {

	// Name of the namespace

	name?: string

	// Whether the namespace should exist

	state?: string
}

netbox_interface :: {

	// URL of the Netbox instance resolvable by Ansible control host

	netbox_url: string

	// Use C(present) or C(absent) for adding or removing.

	state?: string

	// If C(no), SSL certificates will not be validated.
This should only be used on personally controlled sites using self-signed certificates.


	validate_certs?: bool

	// Defines the prefix configuration

	data: string

	// The token created within Netbox to authorize API access

	netbox_token: string
}

netbox_ip_address :: {

	// Defines the IP address configuration

	data: string

	// The token created within Netbox to authorize API access

	netbox_token: string

	// URL of the Netbox instance resolvable by Ansible control host

	netbox_url: string

	// Use C(present), C(new) or C(absent) for adding, force adding or removing.
C(present) will check if the IP is already created, and return it if
true. C(new) will force to create it anyway (useful for anycasts, for
example).


	state?: string

	// If C(no), SSL certificates will not be validated. This should only be used on personally controlled sites using self-signed certificates.

	validate_certs?: bool
}

omapi_host :: {

	// Sets OMAPI server host to interact with.

	host?: string

	// Sets the host lease hostname (mandatory if state=present).

	hostname?: string

	// Sets the TSIG key name for authenticating against OMAPI server.

	key_name: string

	// Sets the OMAPI server port to interact with.

	port?: int

	// Create or remove OMAPI host.

	state: string

	// Attach a list of OMAPI DHCP statements with host lease (without ending semicolon).

	statements?: [..._]

	// Enable dynamic DNS updates for this host.

	ddns?: bool

	// Sets the lease host IP address.

	ip?: string

	// Sets the TSIG key content for authenticating against OMAPI server.

	key: string

	// Sets the lease host MAC address.

	macaddr: string
}

hetzner_failover_ip :: {

	// The new value for the failover IP address.
	// Required when setting I(state) to C(routed).

	value?: string

	// The failover IP address.

	failover_ip: string

	// Defines whether the IP will be routed or not.
	// If set to C(routed), I(value) must be specified.

	state?: string

	// Timeout to use when routing or unrouting the failover IP.
	// Note that the API call returns when the failover IP has been successfully routed to the new address, respectively successfully unrouted.

	timeout?: int
}

hetzner_failover_ip_info :: {

	// The failover IP address.

	failover_ip: string
}

ipify_facts :: {

	// URL of the ipify.org API service.
	// C(?format=json) will be appended per default.

	api_url?: string

	// HTTP connection timeout in seconds.

	timeout?: int

	// When set to C(NO), SSL certificates will not be validated.

	validate_certs?: bool
}

ipinfoio_facts :: {

	// Set http user agent

	http_agent?: string

	// HTTP connection timeout in seconds

	timeout?: string
}

netbox_prefix :: {

	// The token created within Netbox to authorize API access

	netbox_token: string

	// URL of the Netbox instance resolvable by Ansible control host

	netbox_url: string

	// Use C(present) or C(absent) for adding or removing.

	state?: string

	// If C(no), SSL certificates will not be validated. This should only be used on personally controlled sites using self-signed certificates.

	validate_certs?: bool

	// Defines the prefix configuration

	data: string

	// If C(yes) and state C(present), if an parent is given, it will get the first available prefix of the given prefix_length inside the given parent (and vrf, if given). Unused with state C(absent).

	first_available?: bool
}

dnsmadeeasy :: {

	// If C(yes), add or change the monitor.  This is applicable only for A records.

	monitor?: bool

	// Description used by the monitor.

	systemDescription: string

	// The file at the Fqdn that the monitor queries for HTTP or HTTPS.

	httpFile?: string

	// Quinary IP address for the failover.

	ip5?: string

	// Protocol used by the monitor.

	protocol: string

	// Record name to get/create/delete/update. If record_name is not specified; all records for the domain will be returned in "result" regardless of the state argument.

	record_name?: string

	// Account API Key.

	account_key: string

	// Number of checks the monitor performs before a failover occurs where Low = 8, Medium = 5,and High = 3.

	sensitivity: string

	// Record type.

	record_type?: string

	// Decides if the sandbox API should be used. Otherwise (default) the production API of DNS Made Easy is used.

	sandbox?: bool

	// Name or id of the contact list that the monitor will notify.
	// The default C('') means the Account Owner.

	contactList: string

	// Number of emails sent to the contact list by the monitor.

	maxEmails: string

	// Port used by the monitor.

	port: string

	// Quaternary IP address for the failover.

	ip4?: string

	// record's "Time to live".  Number of seconds the record remains cached in DNS servers.

	record_ttl?: string

	// The fully qualified domain name used by the monitor.

	httpFqdn?: string

	// Tertiary IP address for the failover.

	ip3?: string

	// Primary IP address for the failover.
	// Required if adding or changing the monitor or failover.

	ip1?: string

	// If true, fallback to the primary IP address is manual after a failover.
	// If false, fallback to the primary IP address is automatic after a failover.

	autoFailover?: bool

	// Domain to work with. Can be the domain name (e.g. "mydomain.com") or the numeric ID of the domain in DNS Made Easy (e.g. "839989") for faster resolution

	domain: string

	// The string in the httpFile that the monitor queries for HTTP or HTTPS.

	httpQueryString?: string

	// whether the record should exist or not

	state: string

	// If C(no), SSL certificates will not be validated. This should only be used on personally controlled sites using self-signed certificates.

	validate_certs?: bool

	// Account Secret Key.

	account_secret: string

	// If C(yes), add or change the failover.  This is applicable only for A records.

	failover?: bool

	// Record value. HTTPRED: <redirection URL>, MX: <priority> <target name>, NS: <name server>, PTR: <target name>, SRV: <priority> <weight> <port> <target name>, TXT: <text value>"

	// If record_value is not specified; no changes will be made and the record will be returned in 'result' (in other words, this module can be used to fetch a record's current id, type, and ttl)


	record_value?: string

	// Secondary IP address for the failover.
	// Required if adding or changing the failover.

	ip2?: string
}

netcup_dns :: {

	// Whether the record should be the only one for that record type and record name. Only use with C(state=present)
	// This will delete all other records with the same record name and type.

	solo?: bool

	// Whether the record should exist or not

	state?: string

	// Record type

	type: string

	// Record value

	value: string

	// Netcup customer id

	customer_id: string

	// API password for authentification, must be obtained via the netcup CCP (https://ccp.netcup.net)

	api_password: string

	// Domainname the records should be added / removed

	domain: string

	// Record priority. Required for C(type=MX)

	priority?: string

	// Record to add or delete, supports wildcard (*). Default is C(@) (e.g. the zone name)

	record?: string

	// API key for authentification, must be obtained via the netcup CCP (U(https://ccp.netcup.net))

	api_key: string
}

snmp_facts :: {

	// Authentication level.
	// Required if version is v3.

	level?: string

	// Encryption algorithm.
	// Required if level is authPriv.

	privacy?: string

	// Encryption key.
	// Required if version is authPriv.

	privkey?: string

	// Username for SNMPv3.
	// Required if version is v3.

	username?: string

	// SNMP Version to use, v2/v2c or v3.

	version: string

	// Authentication key.
	// Required if version is v3.

	authkey?: string

	// Set to target snmp server (normally C({{ inventory_hostname }})).

	host: string

	// Hashing algorithm.
	// Required if version is v3.

	integrity?: string

	// The SNMP community string, required if version is v2/v2c.

	community?: string
}

cloudflare_dns :: {

	// Record to add.
	// Required if C(state=present).
	// Default is C(@) (e.g. the zone name).

	record?: string

	// The record value.
	// Required for C(state=present).

	value?: string

	// The name of the Zone to work with (e.g. "example.com").
	// The Zone must already exist.

	zone: string

	// Account API key.
	// Required for api keys authentication.
	// You can obtain your API key from the bottom of the Cloudflare 'My Account' page, found here: U(https://dash.cloudflare.com/)

	account_api_key?: string

	// Algorithm number.
	// Required for C(type=DS) and C(type=SSHFP) when C(state=present).

	algorithm?: int

	// DNSSEC key tag.
	// Needed for C(type=DS) when C(state=present).

	key_tag?: int

	// Service weight.
	// Required for C(type=SRV).

	weight?: int

	// Proxy through Cloudflare network or just use DNS.

	proxied?: bool

	// Whether the record(s) should exist or not.

	state?: string

	// Timeout for Cloudflare API calls.

	timeout?: int

	// Selector number.
	// Required for C(type=TLSA) when C(state=present).

	selector?: int

	// Account email. Required for api keys authentication.

	account_email?: string

	// Certificate usage number.
	// Required for C(type=TLSA) when C(state=present).

	cert_usage?: int

	// Record priority.
	// Required for C(type=MX) and C(type=SRV)

	priority?: string

	// Service protocol. Required for C(type=SRV) and C(type=TLSA).
	// Common values are TCP and UDP.
	// Before Ansible 2.6 only TCP and UDP were available.

	proto?: string

	// Record service.
	// Required for C(type=SRV)

	service?: string

	// Whether the record should be the only one for that record type and record name.
	// Only use with C(state=present).
	// This will delete all other records with the same record name and type.

	solo?: bool

	// The TTL to give the new record.
	// Must be between 120 and 2,147,483,647 seconds, or 1 for automatic.

	ttl?: int

	// The type of DNS record to create. Required if C(state=present).
	// C(type=DS), C(type=SSHFP) and C(type=TLSA) added in Ansible 2.7.

	type?: string

	// API token.
	// Required for api token authentication.
	// You can obtain your API token from the bottom of the Cloudflare 'My Account' page, found here: U(https://dash.cloudflare.com/)

	api_token?: string

	// Hash type number.
	// Required for C(type=DS), C(type=SSHFP) and C(type=TLSA) when C(state=present).

	hash_type?: int

	// Service port.
	// Required for C(type=SRV) and C(type=TLSA).

	port?: int
}
