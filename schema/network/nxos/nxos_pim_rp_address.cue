package ansible

module: nxos_pim_rp_address: {
	module:                         "nxos_pim_rp_address"
	extends_documentation_fragment: "nxos"
	version_added:                  "2.2"
	short_description:              "Manages configuration of an PIM static RP address instance."
	description: [
		"Manages configuration of an Protocol Independent Multicast (PIM) static rendezvous point (RP) address instance.",
	]

	author: "Gabriele Gerbino (@GGabriele)"
	notes: [
		"Tested against NXOSv 7.3.(0)D1(1) on VIRL",
		"C(state=absent) is currently not supported on all platforms.",
	]
	options: {
		rp_address: {
			description: [
				"Configures a Protocol Independent Multicast (PIM) static rendezvous point (RP) address. Valid values are unicast addresses.",
			]

			required: true
		}
		group_list: description: [
			"Group range for static RP. Valid values are multicast addresses.",
		]
		prefix_list: description: [
			"Prefix list policy for static RP. Valid values are prefix-list policy names.",
		]

		route_map: description: [
			"Route map policy for static RP. Valid values are route-map policy names.",
		]

		bidir: {
			description: [
				"Group range is treated in PIM bidirectional mode.",
			]
			type: "bool"
		}
		state: {
			description: [
				"Specify desired state of the resource.",
			]
			required: true
			default:  "present"
			choices: ["present", "absent", "default"]
		}
	}
}
