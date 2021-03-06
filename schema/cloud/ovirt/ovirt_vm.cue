package ansible

module: ovirt_vm: {
	module:            "ovirt_vm"
	short_description: "Module to manage Virtual Machines in oVirt/RHV"
	version_added:     "2.2"
	author: [
		"Ondra Machacek (@machacekondra)",
	]
	description: [
		"This module manages whole lifecycle of the Virtual Machine(VM) in oVirt/RHV.",
		"Since VM can hold many states in oVirt/RHV, this see notes to see how the states of the VM are handled.",
	]
	options: {
		name: description: [
			"Name of the Virtual Machine to manage.",
			"If VM don't exists C(name) is required. Otherwise C(id) or C(name) can be used.",
		]
		id: description: [
			"ID of the Virtual Machine to manage.",
		]
		state: {
			description: [
				"Should the Virtual Machine be running/stopped/present/absent/suspended/next_run/registered/exported/reboot. When C(state) is I(registered) and the unregistered VM's name belongs to an already registered in engine VM in the same DC then we fail to register the unregistered template.",
				"I(present) state will create/update VM and don't change its state if it already exists.",
				"I(running) state will create/update VM and start it.",
				"I(next_run) state updates the VM and if the VM has next run configuration it will be rebooted.",
				"Please check I(notes) to more detailed description of states.",
				"I(exported) state will export the VM to export domain or as OVA.",
				"I(registered) is supported since 2.4.",
				"I(reboot) is supported since 2.10, virtual machine is rebooted only if it's in up state.",
			]
			choices: ["absent", "next_run", "present", "registered", "running", "stopped", "suspended", "exported", "reboot"]
			default: "present"
		}
		cluster: description: [
			"Name of the cluster, where Virtual Machine should be created.",
			"Required if creating VM.",
		]
		allow_partial_import: {
			description: [
				"Boolean indication whether to allow partial registration of Virtual Machine when C(state) is registered.",
			]
			type:          "bool"
			version_added: "2.4"
		}
		vnic_profile_mappings: {
			description: [
				"Mapper which maps an external virtual NIC profile to one that exists in the engine when C(state) is registered. vnic_profile is described by the following dictionary:",
			]

			suboptions: {
				source_network_name: description: [
					"The network name of the source network.",
				]
				source_profile_name: description: [
					"The profile name related to the source network.",
				]
				target_profile_id: description: [
					"The id of the target profile id to be mapped to in the engine.",
				]
			}
			version_added: "2.5"
		}
		cluster_mappings: {
			description: [
				"Mapper which maps cluster name between VM's OVF and the destination cluster this VM should be registered to, relevant when C(state) is registered. Cluster mapping is described by the following dictionary:",
			]

			suboptions: {
				source_name: description: [
					"The name of the source cluster.",
				]
				dest_name: description: [
					"The name of the destination cluster.",
				]
			}
			version_added: "2.5"
		}
		role_mappings: {
			description: [
				"Mapper which maps role name between VM's OVF and the destination role this VM should be registered to, relevant when C(state) is registered. Role mapping is described by the following dictionary:",
			]

			suboptions: {
				source_name: description: [
					"The name of the source role.",
				]
				dest_name: description: [
					"The name of the destination role.",
				]
			}
			version_added: "2.5"
		}
		domain_mappings: {
			description: [
				"Mapper which maps aaa domain name between VM's OVF and the destination aaa domain this VM should be registered to, relevant when C(state) is registered. The aaa domain mapping is described by the following dictionary:",
			]

			suboptions: {
				source_name: description: [
					"The name of the source aaa domain.",
				]
				dest_name: description: [
					"The name of the destination aaa domain.",
				]
			}
			version_added: "2.5"
		}
		affinity_group_mappings: {
			description: [
				"Mapper which maps affinity name between VM's OVF and the destination affinity this VM should be registered to, relevant when C(state) is registered.",
			]

			version_added: "2.5"
		}
		affinity_label_mappings: {
			description: [
				"Mapper which maps affinity label name between VM's OVF and the destination label this VM should be registered to, relevant when C(state) is registered.",
			]

			version_added: "2.5"
		}
		lun_mappings: {
			description: [
				"Mapper which maps lun between VM's OVF and the destination lun this VM should contain, relevant when C(state) is registered. lun_mappings is described by the following dictionary: - C(logical_unit_id): The logical unit number to identify a logical unit, - C(logical_unit_port): The port being used to connect with the LUN disk. - C(logical_unit_portal): The portal being used to connect with the LUN disk. - C(logical_unit_address): The address of the block storage host. - C(logical_unit_target): The iSCSI specification located on an iSCSI server - C(logical_unit_username): Username to be used to connect to the block storage host. - C(logical_unit_password): Password to be used to connect to the block storage host. - C(storage_type): The storage type which the LUN reside on (iscsi or fcp)",
			]

			version_added: "2.5"
		}
		reassign_bad_macs: {
			description: [
				"Boolean indication whether to reassign bad macs when C(state) is registered.",
			]
			type:          "bool"
			version_added: "2.5"
		}
		template: description: [
			"Name of the template, which should be used to create Virtual Machine.",
			"Required if creating VM.",
			"If template is not specified and VM doesn't exist, VM will be created from I(Blank) template.",
		]
		template_version: {
			description: [
				"Version number of the template to be used for VM.",
				"By default the latest available version of the template is used.",
			]
			version_added: "2.3"
		}
		use_latest_template_version: {
			description: [
				"Specify if latest template version should be used, when running a stateless VM.",
				"If this parameter is set to I(yes) stateless VM is created.",
			]
			type:          "bool"
			version_added: "2.3"
		}
		storage_domain: {
			description: [
				"Name of the storage domain where all template disks should be created.",
				"This parameter is considered only when C(template) is provided.",
				"IMPORTANT - This parameter is not idempotent, if the VM exists and you specify different storage domain, disk won't move.",
			]

			version_added: "2.4"
		}
		disk_format: {
			description: [
				"Specify format of the disk.",
				"If C(cow) format is used, disk will by created as sparse, so space will be allocated for the volume as needed, also known as I(thin provision).",
				"If C(raw) format is used, disk storage will be allocated right away, also known as I(preallocated).",
				"Note that this option isn't idempotent as it's not currently possible to change format of the disk via API.",
				"This parameter is considered only when C(template) and C(storage domain) is provided.",
			]
			choices: ["cow", "raw"]
			default:       "cow"
			version_added: "2.4"
		}
		memory: description: [
			"Amount of memory of the Virtual Machine. Prefix uses IEC 60027-2 standard (for example 1GiB, 1024MiB).",
			"Default value is set by engine.",
		]
		memory_guaranteed: description: [
			"Amount of minimal guaranteed memory of the Virtual Machine. Prefix uses IEC 60027-2 standard (for example 1GiB, 1024MiB).",
			"C(memory_guaranteed) parameter can't be lower than C(memory) parameter.",
			"Default value is set by engine.",
		]
		memory_max: {
			description: [
				"Upper bound of virtual machine memory up to which memory hot-plug can be performed. Prefix uses IEC 60027-2 standard (for example 1GiB, 1024MiB).",
				"Default value is set by engine.",
			]
			version_added: "2.5"
		}
		cpu_shares: description: [
			"Set a CPU shares for this Virtual Machine.",
			"Default value is set by oVirt/RHV engine.",
		]
		cpu_cores: description: [
			"Number of virtual CPUs cores of the Virtual Machine.",
			"Default value is set by oVirt/RHV engine.",
		]
		cpu_sockets: description: [
			"Number of virtual CPUs sockets of the Virtual Machine.",
			"Default value is set by oVirt/RHV engine.",
		]
		cpu_threads: {
			description: [
				"Number of threads per core of the Virtual Machine.",
				"Default value is set by oVirt/RHV engine.",
			]
			version_added: "2.5"
		}
		type: {
			description: [
				"Type of the Virtual Machine.",
				"Default value is set by oVirt/RHV engine.",
				"I(high_performance) is supported since Ansible 2.5 and oVirt/RHV 4.2.",
			]
			choices: ["desktop", "server", "high_performance"]
		}
		quota_id: {
			description: [
				"Virtual Machine quota ID to be used for disk. By default quota is chosen by oVirt/RHV engine.",
			]
			version_added: "2.5"
		}
		operating_system: description: [
			"Operating system of the Virtual Machine.",
			"Default value is set by oVirt/RHV engine.",
			"Possible values: debian_7, freebsd, freebsdx64, other, other_linux, other_linux_ppc64, other_ppc64, rhel_3, rhel_4, rhel_4x64, rhel_5, rhel_5x64, rhel_6, rhel_6x64, rhel_6_ppc64, rhel_7x64, rhel_7_ppc64, sles_11, sles_11_ppc64, ubuntu_12_04, ubuntu_12_10, ubuntu_13_04, ubuntu_13_10, ubuntu_14_04, ubuntu_14_04_ppc64, windows_10, windows_10x64, windows_2003, windows_2003x64, windows_2008, windows_2008x64, windows_2008r2x64, windows_2008R2x64, windows_2012x64, windows_2012R2x64, windows_7, windows_7x64, windows_8, windows_8x64, windows_xp",
		]

		boot_devices: {
			description: [
				"List of boot devices which should be used to boot. For example C([ cdrom, hd ]).",
				"Default value is set by oVirt/RHV engine.",
			]
			choices: ["cdrom", "hd", "network"]
		}
		boot_menu: {
			description: [
				"I(True) enable menu to select boot device, I(False) to disable it. By default is chosen by oVirt/RHV engine.",
			]
			type:          "bool"
			version_added: "2.5"
		}
		usb_support: {
			description: [
				"I(True) enable USB support, I(False) to disable it. By default is chosen by oVirt/RHV engine.",
			]
			type:          "bool"
			version_added: "2.5"
		}
		serial_console: {
			description: [
				"I(True) enable VirtIO serial console, I(False) to disable it. By default is chosen by oVirt/RHV engine.",
			]
			type:          "bool"
			version_added: "2.5"
		}
		sso: {
			description: [
				"I(True) enable Single Sign On by Guest Agent, I(False) to disable it. By default is chosen by oVirt/RHV engine.",
			]
			type:          "bool"
			version_added: "2.5"
		}
		host: description: [
			"Specify host where Virtual Machine should be running. By default the host is chosen by engine scheduler.",
			"This parameter is used only when C(state) is I(running) or I(present).",
		]
		high_availability: {
			description: [
				"If I(yes) Virtual Machine will be set as highly available.",
				"If I(no) Virtual Machine won't be set as highly available.",
				"If no value is passed, default value is set by oVirt/RHV engine.",
			]
			type: "bool"
		}
		high_availability_priority: {
			description: [
				"Indicates the priority of the virtual machine inside the run and migration queues. Virtual machines with higher priorities will be started and migrated before virtual machines with lower priorities. The value is an integer between 0 and 100. The higher the value, the higher the priority.",
				"If no value is passed, default value is set by oVirt/RHV engine.",
			]
			version_added: "2.5"
		}
		lease: {
			description: [
				"Name of the storage domain this virtual machine lease reside on. Pass an empty string to remove the lease.",
				"NOTE - Supported since oVirt 4.1.",
			]
			version_added: "2.4"
		}
		custom_compatibility_version: {
			description: [
				"Enables a virtual machine to be customized to its own compatibility version. If 'C(custom_compatibility_version)' is set, it overrides the cluster's compatibility version for this particular virtual machine.",
			]

			version_added: "2.7"
		}
		host_devices: {
			description: [
				"Single Root I/O Virtualization - technology that allows single device to expose multiple endpoints that can be passed to VMs",
				"host_devices is an list which contain dictionary with name and state of device",
			]
			version_added: "2.7"
		}
		delete_protected: {
			description: [
				"If I(yes) Virtual Machine will be set as delete protected.",
				"If I(no) Virtual Machine won't be set as delete protected.",
				"If no value is passed, default value is set by oVirt/RHV engine.",
			]
			type: "bool"
		}
		stateless: {
			description: [
				"If I(yes) Virtual Machine will be set as stateless.",
				"If I(no) Virtual Machine will be unset as stateless.",
				"If no value is passed, default value is set by oVirt/RHV engine.",
			]
			type: "bool"
		}
		clone: {
			description: [
				"If I(yes) then the disks of the created virtual machine will be cloned and independent of the template.",
				"This parameter is used only when C(state) is I(running) or I(present) and VM didn't exist before.",
			]
			type:    "bool"
			default: "no"
		}
		clone_permissions: {
			description: [
				"If I(yes) then the permissions of the template (only the direct ones, not the inherited ones) will be copied to the created virtual machine.",
				"This parameter is used only when C(state) is I(running) or I(present) and VM didn't exist before.",
			]
			type:    "bool"
			default: "no"
		}
		cd_iso: description: [
			"ISO file from ISO storage domain which should be attached to Virtual Machine.",
			"If you pass empty string the CD will be ejected from VM.",
			"If used with C(state) I(running) or I(present) and VM is running the CD will be attached to VM.",
			"If used with C(state) I(running) or I(present) and VM is down the CD will be attached to VM persistently.",
		]
		force: {
			description: [
				"Please check to I(Synopsis) to more detailed description of force parameter, it can behave differently in different situations.",
			]

			type:    "bool"
			default: "no"
		}
		nics: {
			description: [
				"List of NICs, which should be attached to Virtual Machine. NIC is described by following dictionary.",
			]
			suboptions: {
				name: description: [
					"Name of the NIC.",
				]
				profile_name: description: [
					"Profile name where NIC should be attached.",
				]
				interface: {
					description: [
						"Type of the network interface.",
					]
					choices: ["virtio", "e1000", "rtl8139"]
					default: "virtio"
				}
				mac_address: description: [
					"Custom MAC address of the network interface, by default it's obtained from MAC pool.",
					"NOTE - This parameter is used only when C(state) is I(running) or I(present) and is able to only create NICs. To manage NICs of the VM in more depth please use M(ovirt_nic) module instead.",
				]
			}
		}

		disks: {
			description: [
				"List of disks, which should be attached to Virtual Machine. Disk is described by following dictionary.",
			]
			suboptions: {
				name: description: [
					"Name of the disk. Either C(name) or C(id) is required.",
				]
				id: description: [
					"ID of the disk. Either C(name) or C(id) is required.",
				]
				interface: {
					description: [
						"Interface of the disk.",
					]
					choices: ["virtio", "ide"]
					default: "virtio"
				}
				bootable: {
					description: [
						"I(True) if the disk should be bootable, default is non bootable.",
					]
					type: "bool"
				}
				activate: {
					description: [
						"I(True) if the disk should be activated, default is activated.",
						"NOTE - This parameter is used only when C(state) is I(running) or I(present) and is able to only attach disks. To manage disks of the VM in more depth please use M(ovirt_disk) module instead.",
					]

					type: "bool"
				}
			}
		}
		sysprep: {
			description: [
				"Dictionary with values for Windows Virtual Machine initialization using sysprep.",
			]
			suboptions: {
				host_name: description: [
					"Hostname to be set to Virtual Machine when deployed.",
				]
				active_directory_ou: description: [
					"Active Directory Organizational Unit, to be used for login of user.",
				]
				org_name: description: [
					"Organization name to be set to Windows Virtual Machine.",
				]
				domain: description: [
					"Domain to be set to Windows Virtual Machine.",
				]
				timezone: description: [
					"Timezone to be set to Windows Virtual Machine.",
				]
				ui_language: description: [
					"UI language of the Windows Virtual Machine.",
				]
				system_locale: description: [
					"System localization of the Windows Virtual Machine.",
				]
				input_locale: description: [
					"Input localization of the Windows Virtual Machine.",
				]
				windows_license_key: description: [
					"License key to be set to Windows Virtual Machine.",
				]
				user_name: description: [
					"Username to be used for set password to Windows Virtual Machine.",
				]
				root_password: description: [
					"Password to be set for username to Windows Virtual Machine.",
				]
			}
		}
		cloud_init: {
			description: [
				"Dictionary with values for Unix-like Virtual Machine initialization using cloud init.",
			]
			suboptions: {
				host_name: description: [
					"Hostname to be set to Virtual Machine when deployed.",
				]
				timezone: description: [
					"Timezone to be set to Virtual Machine when deployed.",
				]
				user_name: description: [
					"Username to be used to set password to Virtual Machine when deployed.",
				]
				root_password: description: [
					"Password to be set for user specified by C(user_name) parameter.",
				]
				authorized_ssh_keys: description: [
					"Use this SSH keys to login to Virtual Machine.",
				]
				regenerate_ssh_keys: {
					description: [
						"If I(True) SSH keys will be regenerated on Virtual Machine.",
					]
					type: "bool"
				}
				custom_script: description: [
					"Cloud-init script which will be executed on Virtual Machine when deployed.",
					"This is appended to the end of the cloud-init script generated by any other options.",
				]
				dns_servers: description: [
					"DNS servers to be configured on Virtual Machine.",
				]
				dns_search: description: [
					"DNS search domains to be configured on Virtual Machine.",
				]
				nic_boot_protocol: {
					description: [
						"Set boot protocol of the network interface of Virtual Machine.",
					]
					choices: ["none", "dhcp", "static"]
				}
				nic_ip_address: description: [
					"If boot protocol is static, set this IP address to network interface of Virtual Machine.",
				]
				nic_netmask: description: [
					"If boot protocol is static, set this netmask to network interface of Virtual Machine.",
				]
				nic_gateway: description: [
					"If boot protocol is static, set this gateway to network interface of Virtual Machine.",
				]
				nic_boot_protocol_v6: {
					description: [
						"Set boot protocol of the network interface of Virtual Machine.",
					]
					choices: ["none", "dhcp", "static"]
					version_added: "2.9"
				}
				nic_ip_address_v6: {
					description: [
						"If boot protocol is static, set this IP address to network interface of Virtual Machine.",
					]
					version_added: "2.9"
				}
				nic_netmask_v6: {
					description: [
						"If boot protocol is static, set this netmask to network interface of Virtual Machine.",
					]
					version_added: "2.9"
				}
				nic_gateway_v6: {
					description: [
						"If boot protocol is static, set this gateway to network interface of Virtual Machine.",
						"For IPv6 addresses the value is an integer in the range of 0-128, which represents the subnet prefix.",
					]
					version_added: "2.9"
				}
				nic_name: description: [
					"Set name to network interface of Virtual Machine.",
				]
				nic_on_boot: {
					description: [
						"If I(True) network interface will be set to start on boot.",
					]
					type: "bool"
				}
			}
		}
		cloud_init_nics: {
			description: [
				"List of dictionaries representing network interfaces to be setup by cloud init.",
				"This option is used, when user needs to setup more network interfaces via cloud init.",
				"If one network interface is enough, user should use C(cloud_init) I(nic_*) parameters. C(cloud_init) I(nic_*) parameters are merged with C(cloud_init_nics) parameters.",
			]

			suboptions: {
				nic_boot_protocol: description: [
					"Set boot protocol of the network interface of Virtual Machine. Can be one of C(none), C(dhcp) or C(static).",
				]
				nic_ip_address: description: [
					"If boot protocol is static, set this IP address to network interface of Virtual Machine.",
				]
				nic_netmask: description: [
					"If boot protocol is static, set this netmask to network interface of Virtual Machine.",
				]
				nic_gateway: description: [
					"If boot protocol is static, set this gateway to network interface of Virtual Machine.",
				]
				nic_boot_protocol_v6: {
					description: [
						"Set boot protocol of the network interface of Virtual Machine. Can be one of C(none), C(dhcp) or C(static).",
					]
					version_added: "2.9"
				}
				nic_ip_address_v6: {
					description: [
						"If boot protocol is static, set this IP address to network interface of Virtual Machine.",
					]
					version_added: "2.9"
				}
				nic_netmask_v6: {
					description: [
						"If boot protocol is static, set this netmask to network interface of Virtual Machine.",
					]
					version_added: "2.9"
				}
				nic_gateway_v6: {
					description: [
						"If boot protocol is static, set this gateway to network interface of Virtual Machine.",
						"For IPv6 addresses the value is an integer in the range of 0-128, which represents the subnet prefix.",
					]
					version_added: "2.9"
				}
				nic_name: description: [
					"Set name to network interface of Virtual Machine.",
				]
				nic_on_boot: {
					description: [
						"If I(True) network interface will be set to start on boot.",
					]
					type: "bool"
				}
			}
			version_added: "2.3"
		}
		cloud_init_persist: {
			description: [
				"If I(yes) the C(cloud_init) or C(sysprep) parameters will be saved for the virtual machine and the virtual machine won't be started as run-once.",
			]

			type:          "bool"
			version_added: "2.5"
			aliases: ["sysprep_persist"]
			default: "no"
		}
		kernel_params_persist: {
			description: [
				"If I(true) C(kernel_params), C(initrd_path) and C(kernel_path) will persist in virtual machine configuration, if I(False) it will be used for run once.",
				"Usable with oVirt 4.3 and lower; removed in oVirt 4.4.",
			]
			type:          "bool"
			version_added: "2.8"
		}
		kernel_path: {
			description: [
				"Path to a kernel image used to boot the virtual machine.",
				"Kernel image must be stored on either the ISO domain or on the host's storage.",
				"Usable with oVirt 4.3 and lower; removed in oVirt 4.4.",
			]
			version_added: "2.3"
		}
		initrd_path: {
			description: [
				"Path to an initial ramdisk to be used with the kernel specified by C(kernel_path) option.",
				"Ramdisk image must be stored on either the ISO domain or on the host's storage.",
				"Usable with oVirt 4.3 and lower; removed in oVirt 4.4.",
			]
			version_added: "2.3"
		}
		kernel_params: {
			description: [
				"Kernel command line parameters (formatted as string) to be used with the kernel specified by C(kernel_path) option.",
				"Usable with oVirt 4.3 and lower; removed in oVirt 4.4.",
			]
			version_added: "2.3"
		}
		instance_type: {
			description: [
				"Name of virtual machine's hardware configuration.",
				"By default no instance type is used.",
			]
			version_added: "2.3"
		}
		description: {
			description: [
				"Description of the Virtual Machine.",
			]
			version_added: "2.3"
		}
		comment: {
			description: [
				"Comment of the Virtual Machine.",
			]
			version_added: "2.3"
		}
		timezone: {
			description: [
				"Sets time zone offset of the guest hardware clock.",
				"For example C(Etc/GMT)",
			]
			version_added: "2.3"
		}
		serial_policy: {
			description: [
				"Specify a serial number policy for the Virtual Machine.",
				"Following options are supported.",
				"C(vm) - Sets the Virtual Machine's UUID as its serial number.",
				"C(host) - Sets the host's UUID as the Virtual Machine's serial number.",
				"C(custom) - Allows you to specify a custom serial number in C(serial_policy_value).",
			]
			choices: ["vm", "host", "custom"]
			version_added: "2.3"
		}
		serial_policy_value: {
			description: [
				"Allows you to specify a custom serial number.",
				"This parameter is used only when C(serial_policy) is I(custom).",
			]
			version_added: "2.3"
		}
		vmware: {
			description: [
				"Dictionary of values to be used to connect to VMware and import a virtual machine to oVirt.",
			]

			suboptions: {
				username: description: [
					"The username to authenticate against the VMware.",
				]
				password: description: [
					"The password to authenticate against the VMware.",
				]
				url: description: [
					"The URL to be passed to the I(virt-v2v) tool for conversion.",
					"For example I(vpx://wmware_user@vcenter-host/DataCenter/Cluster/esxi-host?no_verify=1)",
				]
				drivers_iso: description: [
					"The name of the ISO containing drivers that can be used during the I(virt-v2v) conversion process.",
				]
				sparse: {
					description: [
						"Specifies the disk allocation policy of the resulting virtual machine. I(true) for sparse, I(false) for preallocated.",
					]
					type:    "bool"
					default: true
				}
				storage_domain: description: [
					"Specifies the target storage domain for converted disks. This is required parameter.",
				]
			}
			version_added: "2.3"
		}
		xen: {
			description: [
				"Dictionary of values to be used to connect to XEN and import a virtual machine to oVirt.",
			]

			suboptions: {
				url: description: [
					"The URL to be passed to the I(virt-v2v) tool for conversion.",
					"For example I(xen+ssh://root@zen.server). This is required parameter.",
				]
				drivers_iso: description: [
					"The name of the ISO containing drivers that can be used during the I(virt-v2v) conversion process.",
				]
				sparse: {
					description: [
						"Specifies the disk allocation policy of the resulting virtual machine. I(true) for sparse, I(false) for preallocated.",
					]
					type:    "bool"
					default: true
				}
				storage_domain: description: [
					"Specifies the target storage domain for converted disks. This is required parameter.",
				]
			}
			version_added: "2.3"
		}
		kvm: {
			description: [
				"Dictionary of values to be used to connect to kvm and import a virtual machine to oVirt.",
			]

			suboptions: {
				name: description: [
					"The name of the KVM virtual machine.",
				]
				username: description: [
					"The username to authenticate against the KVM.",
				]
				password: description: [
					"The password to authenticate against the KVM.",
				]
				url: description: [
					"The URL to be passed to the I(virt-v2v) tool for conversion.",
					"For example I(qemu:///system). This is required parameter.",
				]
				drivers_iso: description: [
					"The name of the ISO containing drivers that can be used during the I(virt-v2v) conversion process.",
				]
				sparse: {
					description: [
						"Specifies the disk allocation policy of the resulting virtual machine. I(true) for sparse, I(false) for preallocated.",
					]
					type:    "bool"
					default: true
				}
				storage_domain: description: [
					"Specifies the target storage domain for converted disks. This is required parameter.",
				]
			}
			version_added: "2.3"
		}
		cpu_mode: {
			description: [
				"CPU mode of the virtual machine. It can be some of the following: I(host_passthrough), I(host_model) or I(custom).",
				"For I(host_passthrough) CPU type you need to set C(placement_policy) to I(pinned).",
				"If no value is passed, default value is set by oVirt/RHV engine.",
			]
			version_added: "2.5"
		}
		placement_policy: {
			description: [
				"The configuration of the virtual machine's placement policy.",
				"If no value is passed, default value is set by oVirt/RHV engine.",
				"Placement policy can be one of the following values:",
			]
			suboptions: {
				migratable: description: [
					"Allow manual and automatic migration.",
				]
				pinned: description: [
					"Do not allow migration.",
				]
				user_migratable: description: [
					"Allow manual migration only.",
				]
			}
			version_added: "2.5"
		}
		ticket: {
			description: [
				"If I(true), in addition return I(remote_vv_file) inside I(vm) dictionary, which contains compatible content for remote-viewer application. Works only C(state) is I(running).",
			]

			version_added: "2.7"
			type:          "bool"
		}
		cpu_pinning: {
			description: [
				"CPU Pinning topology to map virtual machine CPU to host CPU.",
				"CPU Pinning topology is a list of dictionary which can have following values:",
			]
			suboptions: {
				cpu: description: [
					"Number of the host CPU.",
				]
				vcpu: description: [
					"Number of the virtual machine CPU.",
				]
			}
			version_added: "2.5"
		}
		soundcard_enabled: {
			description: [
				"If I(true), the sound card is added to the virtual machine.",
			]
			type:          "bool"
			version_added: "2.5"
		}
		smartcard_enabled: {
			description: [
				"If I(true), use smart card authentication.",
			]
			type:          "bool"
			version_added: "2.5"
		}
		io_threads: {
			description: [
				"Number of IO threads used by virtual machine. I(0) means IO threading disabled.",
			]
			version_added: "2.5"
		}
		ballooning_enabled: {
			description: [
				"If I(true), use memory ballooning.",
				"Memory balloon is a guest device, which may be used to re-distribute / reclaim the host memory based on VM needs in a dynamic way. In this way it's possible to create memory over commitment states.",
			]

			type:          "bool"
			version_added: "2.5"
		}
		numa_tune_mode: {
			description: [
				"Set how the memory allocation for NUMA nodes of this VM is applied (relevant if NUMA nodes are set for this VM).",
				"It can be one of the following: I(interleave), I(preferred) or I(strict).",
				"If no value is passed, default value is set by oVirt/RHV engine.",
			]
			choices: ["interleave", "preferred", "strict"]
			version_added: "2.6"
		}
		numa_nodes: {
			description: [
				"List of vNUMA Nodes to set for this VM and pin them to assigned host's physical NUMA node.",
				"Each vNUMA node is described by following dictionary:",
			]
			suboptions: {
				index: description: [
					"The index of this NUMA node (mandatory).",
				]
				memory: description: [
					"Memory size of the NUMA node in MiB (mandatory).",
				]
				cores: description: [
					"list of VM CPU cores indexes to be included in this NUMA node (mandatory).",
				]
				numa_node_pins: description: [
					"list of physical NUMA node indexes to pin this virtual NUMA node to.",
				]
			}
			version_added: "2.6"
		}
		rng_device: {
			description: [
				"Random number generator (RNG). You can choose of one the following devices I(urandom), I(random) or I(hwrng).",
				"In order to select I(hwrng), you must have it enabled on cluster first.",
				"/dev/urandom is used for cluster version >= 4.1, and /dev/random for cluster version <= 4.0",
			]
			version_added: "2.5"
		}
		custom_properties: {
			description: [
				"Properties sent to VDSM to configure various hooks.",
				"Custom properties is a list of dictionary which can have following values:",
			]
			suboptions: {
				name: description: [
					"Name of the custom property. For example: I(hugepages), I(vhost), I(sap_agent), etc.",
				]
				regexp: description: [
					"Regular expression to set for custom property.",
				]
				value: description: [
					"Value to set for custom property.",
				]
			}
			version_added: "2.5"
		}
		watchdog: {
			description: [
				"Assign watchdog device for the virtual machine.",
				"Watchdogs is a dictionary which can have following values:",
			]
			suboptions: {
				model: description: [
					"Model of the watchdog device. For example: I(i6300esb), I(diag288) or I(null).",
				]
				action: description: [
					"Watchdog action to be performed when watchdog is triggered. For example: I(none), I(reset), I(poweroff), I(pause) or I(dump).",
				]
			}
			version_added: "2.5"
		}
		graphical_console: {
			description: [
				"Assign graphical console to the virtual machine.",
			]
			suboptions: {
				headless_mode: {
					description: [
						"If I(true) disable the graphics console for this virtual machine.",
					]
					type: "bool"
				}
				protocol: {
					description: [
						"Graphical protocol, a list of I(spice), I(vnc), or both.",
					]
					type: "list"
				}
				disconnect_action: {
					description: [
						"Returns the action that will take place when the graphic console(SPICE only) is disconnected. The options are:",
						"I(none) No action is taken.",
						"I(lock_screen) Locks the currently active user session.",
						"I(logout) Logs out the currently active user session.",
						"I(reboot) Initiates a graceful virtual machine reboot.",
						"I(shutdown) Initiates a graceful virtual machine shutdown.",
					]
					type:          "str"
					version_added: "2.10"
				}
				keyboard_layout: {
					description: [
						"The keyboard layout to use with this graphic console.",
						"This option is only available for the VNC console type.",
						"If no keyboard is enabled then it won't be reported.",
					]
					type:          "str"
					version_added: "2.10"
				}
				monitors: {
					description: [
						"The number of monitors opened for this graphic console.",
						"This option is only available for the SPICE protocol.",
						"Possible values are 1, 2 or 4.",
					]
					type:          "int"
					version_added: "2.10"
				}
			}
			version_added: "2.5"
		}
		exclusive: {
			description: [
				"When C(state) is I(exported) this parameter indicates if the existing VM with the same name should be overwritten.",
			]

			version_added: "2.8"
			type:          "bool"
		}
		export_domain: {
			description: [
				"When C(state) is I(exported)this parameter specifies the name of the export storage domain.",
			]
			version_added: "2.8"
		}
		export_ova: {
			description: [
				"Dictionary of values to be used to export VM as OVA.",
			]
			suboptions: {
				host: description: [
					"The name of the destination host where the OVA has to be exported.",
				]
				directory: description: [
					"The name of the directory where the OVA has to be exported.",
				]
				filename: description: [
					"The name of the exported OVA file.",
				]
			}
			version_added: "2.8"
		}
		force_migrate: {
			description: [
				"If I(true), the VM will migrate when I(placement_policy=user-migratable) but not when I(placement_policy=pinned).",
			]
			version_added: "2.8"
			type:          "bool"
		}
		migrate: {
			description: [
				"If I(true), the VM will migrate to any available host.",
			]
			version_added: "2.8"
			type:          "bool"
		}
		next_run: {
			description: [
				"If I(true), the update will not be applied to the VM immediately and will be only applied when virtual machine is restarted.",
				"NOTE - If there are multiple next run configuration changes on the VM, the first change may get reverted if this option is not passed.",
			]
			version_added: "2.8"
			type:          "bool"
		}
		snapshot_name: {
			description: [
				"Snapshot to clone VM from.",
				"Snapshot with description specified should exist.",
				"You have to specify C(snapshot_vm) parameter with virtual machine name of this snapshot.",
			]
			version_added: "2.9"
		}
		snapshot_vm: {
			description: [
				"Source VM to clone VM from.",
				"VM should have snapshot specified by C(snapshot).",
				"If C(snapshot_name) specified C(snapshot_vm) is required.",
			]
			version_added: "2.9"
		}
		custom_emulated_machine: {
			description: [
				"Sets the value of the custom_emulated_machine attribute.",
			]
			version_added: "2.10"
		}
	}

	notes: [
		"If VM is in I(UNASSIGNED) or I(UNKNOWN) state before any operation, the module will fail. If VM is in I(IMAGE_LOCKED) state before any operation, we try to wait for VM to be I(DOWN). If VM is in I(SAVING_STATE) state before any operation, we try to wait for VM to be I(SUSPENDED). If VM is in I(POWERING_DOWN) state before any operation, we try to wait for VM to be I(UP) or I(DOWN). VM can get into I(UP) state from I(POWERING_DOWN) state, when there is no ACPI or guest agent running inside VM, or if the shutdown operation fails. When user specify I(UP) C(state), we always wait to VM to be in I(UP) state in case VM is I(MIGRATING), I(REBOOTING), I(POWERING_UP), I(RESTORING_STATE), I(WAIT_FOR_LAUNCH). In other states we run start operation on VM. When user specify I(stopped) C(state), and If user pass C(force) parameter set to I(true) we forcibly stop the VM in any state. If user don't pass C(force) parameter, we always wait to VM to be in UP state in case VM is I(MIGRATING), I(REBOOTING), I(POWERING_UP), I(RESTORING_STATE), I(WAIT_FOR_LAUNCH). If VM is in I(PAUSED) or I(SUSPENDED) state, we start the VM. Then we gracefully shutdown the VM. When user specify I(suspended) C(state), we always wait to VM to be in UP state in case VM is I(MIGRATING), I(REBOOTING), I(POWERING_UP), I(RESTORING_STATE), I(WAIT_FOR_LAUNCH). If VM is in I(PAUSED) or I(DOWN) state, we start the VM. Then we suspend the VM. When user specify I(absent) C(state), we forcibly stop the VM in any state and remove it.",
		"If you update a VM parameter that requires a reboot, the oVirt engine always creates a new snapshot for the VM, and an Ansible playbook will report this as changed.",
	]

	extends_documentation_fragment: "ovirt"
}
