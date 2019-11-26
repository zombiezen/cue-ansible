package ansible

module: na_ontap_ndmp: {
	module:            "na_ontap_ndmp"
	short_description: "NetApp ONTAP NDMP services configuration"
	extends_documentation_fragment: [
		"netapp.na_ontap",
	]
	version_added: "2.9"
	author:        "NetApp Ansible Team (@carchi8py) <ng-ansibleteam@netapp.com>"

	description: [
		"Modify NDMP Services.",
	]

	options: {

		vserver: {
			description: [
				"Name of the vserver.",
			]
			required: true
			type:     "str"
		}

		abort_on_disk_error: {
			description: [
				"Enable abort on disk error.",
			]
			type: "bool"
		}

		authtype: {
			description: [
				"Authentication type.",
			]
			type: "list"
		}

		backup_log_enable: {
			description: [
				"Enable backup log.",
			]
			type: "bool"
		}

		data_port_range: {
			description: [
				"Data port range.",
			]
			type: "str"
		}

		debug_enable: {
			description: [
				"Enable debug.",
			]
			type: "bool"
		}

		debug_filter: {
			description: [
				"Debug filter.",
			]
			type: "str"
		}

		dump_detailed_stats: {
			description: [
				"Enable logging of VM stats for dump.",
			]
			type: "bool"
		}

		dump_logical_find: {
			description: [
				"Enable logical find for dump.",
			]
			type: "str"
		}

		enable: {
			description: [
				"Enable NDMP on vserver.",
			]
			type: "bool"
		}

		fh_dir_retry_interval: {
			description: [
				"FH throttle value for dir.",
			]
			type: "int"
		}

		fh_node_retry_interval: {
			description: [
				"FH throttle value for node.",
			]
			type: "int"
		}

		ignore_ctime_enabled: {
			description: [
				"Ignore ctime.",
			]
			type: "bool"
		}

		is_secure_control_connection_enabled: {
			description: [
				"Is secure control connection enabled.",
			]
			type: "bool"
		}

		offset_map_enable: {
			description: [
				"Enable offset map.",
			]
			type: "bool"
		}

		per_qtree_exclude_enable: {
			description: [
				"Enable per qtree exclusion.",
			]
			type: "bool"
		}

		preferred_interface_role: {
			description: [
				"Preferred interface role.",
			]
			type: "list"
		}

		restore_vm_cache_size: {
			description: [
				"Restore VM file cache size.",
			]
			type: "int"
		}

		secondary_debug_filter: {
			description: [
				"Secondary debug filter.",
			]
			type: "str"
		}

		tcpnodelay: {
			description: [
				"Enable TCP nodelay.",
			]
			type: "bool"
		}

		tcpwinsize: {
			description: [
				"TCP window size.",
			]
			type: "int"
		}
	}
}
