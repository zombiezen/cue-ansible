package ansible

module: rhevm: {
	module:            "rhevm"
	short_description: "RHEV/oVirt automation"
	description: [
		"This module only supports oVirt/RHEV version 3.",
		"A newer module M(ovirt_vm) supports oVirt/RHV version 4.",
		"Allows you to create/remove/update or powermanage virtual machines on a RHEV/oVirt platform.",
	]
	version_added: "2.2"
	requirements: [
		"ovirtsdk",
	]
	author: [
		"Timothy Vandenbrande (@TimothyVandenbrande)",
	]
	options: {
		user: {
			description: [
				"The user to authenticate with.",
			]
			type:    "str"
			default: "admin@internal"
		}
		password: {
			description: [
				"The password for user authentication.",
			]
			type: "str"
		}
		server: {
			description: [
				"The name/IP of your RHEV-m/oVirt instance.",
			]
			type:    "str"
			default: "127.0.0.1"
		}
		port: {
			description: [
				"The port on which the API is reachable.",
			]
			type:    "int"
			default: 443
		}
		insecure_api: {
			description: [
				"A boolean switch to make a secure or insecure connection to the server.",
			]
			type:    "bool"
			default: false
		}
		name: {
			description: [
				"The name of the VM.",
			]
			type: "str"
		}
		cluster: {
			description: [
				"The RHEV/oVirt cluster in which you want you VM to start.",
			]
			type: "str"
		}
		datacenter: {
			description: [
				"The RHEV/oVirt datacenter in which you want you VM to start.",
			]
			type:    "str"
			default: "Default"
		}
		state: {
			description: [
				"This serves to create/remove/update or powermanage your VM.",
			]
			type: "str"
			choices: ["absent", "cd", "down", "info", "ping", "present", "restarted", "up"]
			default: "present"
		}
		image: {
			description: [
				"The template to use for the VM.",
			]
			type: "str"
		}
		type: {
			description: [
				"To define if the VM is a server or desktop.",
			]
			type: "str"
			choices: ["desktop", "host", "server"]
			default: "server"
		}
		vmhost: {
			description: [
				"The host you wish your VM to run on.",
			]
			type: "str"
		}
		vmcpu: {
			description: [
				"The number of CPUs you want in your VM.",
			]
			type:    "int"
			default: 2
		}
		cpu_share: {
			description: [
				"This parameter is used to configure the CPU share.",
			]
			type:    "int"
			default: 0
		}
		vmmem: {
			description: [
				"The amount of memory you want your VM to use (in GB).",
			]
			type:    "int"
			default: 1
		}
		osver: {
			description: [
				"The operating system option in RHEV/oVirt.",
			]
			type:    "str"
			default: "rhel_6x64"
		}
		mempol: {
			description: [
				"The minimum amount of memory you wish to reserve for this system.",
			]
			type:    "int"
			default: 1
		}
		vm_ha: {
			description: [
				"To make your VM High Available.",
			]
			type:    "bool"
			default: true
		}
		disks: {
			description: [
				"This option uses complex arguments and is a list of disks with the options name, size and domain.",
			]
			type: "list"
		}
		ifaces: {
			description: [
				"This option uses complex arguments and is a list of interfaces with the options name and vlan.",
			]
			type: "list"
			aliases: ["interfaces", "nics"]
		}
		boot_order: {
			description: [
				"This option uses complex arguments and is a list of items that specify the bootorder.",
			]
			type: "list"
			default: ["hd", "network"]
		}
		del_prot: {
			description: [
				"This option sets the delete protection checkbox.",
			]
			type:    "bool"
			default: true
		}
		cd_drive: {
			description: [
				"The CD you wish to have mounted on the VM when I(state = 'CD').",
			]
			type: "str"
		}
		timeout: {
			description: [
				"The timeout you wish to define for power actions.",
				"When I(state = 'up').",
				"When I(state = 'down').",
				"When I(state = 'restarted').",
			]
			type: "int"
		}
	}
}
