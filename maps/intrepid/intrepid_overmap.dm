/obj/effect/overmap/visitable/ship/intrepid
	name = "TGLV Intrepid"
	desc = "A light exploration corvette, broadcasting SCGEC codes and the designation \"TGLV Intrepid - A-12-C\"."
	fore_dir = WEST
	vessel_mass = 30000
	burn_delay = 1 SECONDS
	base = TRUE

	initial_restricted_waypoints = list(
		"Pandora" = list("nav_hangar_pandora")
	)

	initial_generic_waypoints = list(

	)

/obj/effect/overmap/visitable/ship/intrepid/Initialize()
	. = ..()

	var/obj/effect/overmap/visitable/sector/residue/R = new()
	R.forceMove(locate(src.x, src.y, GLOB.using_map.overmap_z))

	for(var/obj/machinery/computer/ship/helm/H in SSmachines.machinery)
		H.add_known_sector(R)

/obj/effect/overmap/visitable/sector/residue
	name = "Bluespace Residue"
	desc = "Trace radiation emanating from this sector is consistent with the aftermath of a bluespace jump."
	icon_state = "event"
	known = TRUE

/obj/effect/overmap/visitable/ship/landable/exploration_shuttle
	name = "Pandora"
	desc = "An SSE-U11 long range shuttle, broadcasting SCGEC codes and the callsign \"Intrepid-2 Pandora\"."
	shuttle = "Pandora"
	max_speed = 1/(2 SECONDS)
	burn_delay = 1 SECONDS
	vessel_mass = 5000
	fore_dir = NORTH
	skill_needed = SKILL_BASIC
	vessel_size = SHIP_SIZE_SMALL

/obj/machinery/computer/shuttle_control/explore/exploration_shuttle
	name = "shuttle control console"
	shuttle_tag = "Pandora"
	req_access = list(access_expedition_shuttle_helm)
