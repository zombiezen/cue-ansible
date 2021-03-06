package ansible

module: nxos_evpn_global: {
	module:                         "nxos_evpn_global"
	extends_documentation_fragment: "nxos"
	version_added:                  "2.2"
	short_description:              "Handles the EVPN control plane for VXLAN."
	description: [
		"Handles the EVPN control plane for VXLAN.",
	]
	author: "Gabriele Gerbino (@GGabriele)"
	notes: [
		"This module is not supported on Nexus 3000 series of switches.",
	]
	options: nv_overlay_evpn: {
		description: [
			"EVPN control plane.",
		]
		required: true
		type:     "bool"
	}
}
