package ansible

module: vmware_vmkernel: {
	module:            "vmware_vmkernel"
	short_description: "Manages a VMware VMkernel Adapter of an ESXi host."
	description: [
		"This module can be used to manage the VMKernel adapters / VMKernel network interfaces of an ESXi host.",
		"The module assumes that the host is already configured with the Port Group in case of a vSphere Standard Switch (vSS).",
		"The module assumes that the host is already configured with the Distributed Port Group in case of a vSphere Distributed Switch (vDS).",
		"The module automatically migrates the VMKernel adapter from vSS to vDS or vice versa if present.",
	]
	version_added: 2.0
	author: [
		"Joseph Callen (@jcpowermac)",
		"Russell Teague (@mtnbikenc)",
		"Abhijeet Kasurde (@Akasurde)",
		"Christian Kotte (@ckotte)",
	]
	notes: [
		"The option C(device) need to be used with DHCP because otherwise it's not possible to check if a VMkernel device is already present",
		"You can only change from DHCP to static, and vSS to vDS, or vice versa, in one step, without creating a new device, with C(device) specified.",
		"You can only create the VMKernel adapter on a vDS if authenticated to vCenter and not if authenticated to ESXi.",
		"Tested on vSphere 5.5 and 6.5",
	]
	requirements: [
		"python >= 2.6",
		"PyVmomi",
	]
	options: {
		vswitch_name: {
			description: [
				"The name of the vSwitch where to add the VMKernel interface.",
				"Required parameter only if C(state) is set to C(present).",
				"Optional parameter from version 2.5 and onwards.",
			]
			type: "str"
			aliases: ["vswitch"]
		}
		dvswitch_name: {
			description: [
				"The name of the vSphere Distributed Switch (vDS) where to add the VMKernel interface.",
				"Required parameter only if C(state) is set to C(present).",
				"Optional parameter from version 2.8 and onwards.",
			]
			type: "str"
			aliases: ["dvswitch"]
			version_added: 2.8
		}
		portgroup_name: {
			description: [
				"The name of the port group for the VMKernel interface.",
			]
			required: true
			aliases: ["portgroup"]
			type: "str"
		}
		network: {
			description: [
				"A dictionary of network details.",
				"The following parameter is required:",
				" - C(type) (string): Type of IP assignment (either C(dhcp) or C(static)).",
				"The following parameters are required in case of C(type) is set to C(static):",
				" - C(ip_address) (string): Static IP address (implies C(type: static)).",
				" - C(subnet_mask) (string): Static netmask required for C(ip_address).",
				"The following parameter is optional in case of C(type) is set to C(static):",
				" - C(default_gateway) (string): Default gateway (Override default gateway for this adapter).",
				"The following parameter is optional:",
				" - C(tcpip_stack) (string): The TCP/IP stack for the VMKernel interface. Can be default, provisioning, vmotion, or vxlan. (default: default)",
			]
			type: "dict"
			default: {
				type:        "static"
				tcpip_stack: "default"
			}

			version_added: 2.5
		}
		ip_address: {
			description: [
				"The IP Address for the VMKernel interface.",
				"Use C(network) parameter with C(ip_address) instead.",
				"Deprecated option, will be removed in version 2.9.",
			]
			type: "str"
		}
		subnet_mask: {
			description: [
				"The Subnet Mask for the VMKernel interface.",
				"Use C(network) parameter with C(subnet_mask) instead.",
				"Deprecated option, will be removed in version 2.9.",
			]
			type: "str"
		}
		mtu: {
			description: [
				"The MTU for the VMKernel interface.",
				"The default value of 1500 is valid from version 2.5 and onwards.",
			]
			default: 1500
			type:    "int"
		}
		device: {
			description: [
				"Search VMkernel adapter by device name.",
				"The parameter is required only in case of C(type) is set to C(dhcp).",
			]
			version_added: 2.8
			type:          "str"
		}
		enable_vsan: {
			description: [
				"Enable VSAN traffic on the VMKernel adapter.",
				"This option is only allowed if the default TCP/IP stack is used.",
			]
			type: "bool"
		}
		enable_vmotion: {
			description: [
				"Enable vMotion traffic on the VMKernel adapter.",
				"This option is only allowed if the default TCP/IP stack is used.",
				"You cannot enable vMotion on an additional adapter if you already have an adapter with the vMotion TCP/IP stack configured.",
			]
			type: "bool"
		}
		enable_mgmt: {
			description: [
				"Enable Management traffic on the VMKernel adapter.",
				"This option is only allowed if the default TCP/IP stack is used.",
			]
			type: "bool"
		}
		enable_ft: {
			description: [
				"Enable Fault Tolerance traffic on the VMKernel adapter.",
				"This option is only allowed if the default TCP/IP stack is used.",
			]
			type: "bool"
		}
		enable_provisioning: {
			description: [
				"Enable Provisioning traffic on the VMKernel adapter.",
				"This option is only allowed if the default TCP/IP stack is used.",
			]
			type:          "bool"
			version_added: 2.8
		}
		enable_replication: {
			description: [
				"Enable vSphere Replication traffic on the VMKernel adapter.",
				"This option is only allowed if the default TCP/IP stack is used.",
			]
			type:          "bool"
			version_added: 2.8
		}
		enable_replication_nfc: {
			description: [
				"Enable vSphere Replication NFC traffic on the VMKernel adapter.",
				"This option is only allowed if the default TCP/IP stack is used.",
			]
			type:          "bool"
			version_added: 2.8
		}
		state: {
			description: [
				"If set to C(present), the VMKernel adapter will be created with the given specifications.",
				"If set to C(absent), the VMKernel adapter will be removed.",
				"If set to C(present) and VMKernel adapter exists, the configurations will be updated.",
			]
			choices: ["present", "absent"]
			default:       "present"
			version_added: 2.5
			type:          "str"
		}
		esxi_hostname: {
			description: [
				"Name of ESXi host to which VMKernel is to be managed.",
				"From version 2.5 onwards, this parameter is required.",
			]
			required:      true
			version_added: 2.5
			type:          "str"
		}
	}
	extends_documentation_fragment: "vmware.documentation"
}
