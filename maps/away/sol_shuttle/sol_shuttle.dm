#include "sol_shuttle_jobs.dm"
#include "sol_shuttle_areas.dm"
#include "sol_shuttle_radio.dm"

/datum/map_template/ruin/away_site/sol_shuttle
	name = "SolGov Shuttle"
	id = "awaysite_sol"
	description = "SolGov Cruiser."
	suffixes = list("sol_shuttle/sol_shuttle.dmm")
	area_usage_test_exempted_root_areas = list(/area/sol_shuttle)
	spawn_cost = 0.6
	player_cost = 4
	spawn_weight = 0.67
	shuttles_to_initialise = list(/datum/shuttle/autodock/overmap/sol_shuttle)

/datum/shuttle/autodock/overmap/sol_shuttle
	name = "SolGov Cruiser"
	move_time = 10
	shuttle_area = list(
		/area/sol_shuttle/cryo,
		/area/sol_shuttle/crew,
		/area/sol_shuttle/ofd,
		/area/sol_shuttle/science,
		/area/sol_shuttle/bridge,
		/area/sol_shuttle/primaryhall,
		/area/sol_shuttle/secondaryhall,
		/area/sol_shuttle/medbay,
		/area/sol_shuttle/hydro,
		/area/sol_shuttle/engineering,
		/area/sol_shuttle/engine1,
		/area/sol_shuttle/engine2,
		/area/sol_shuttle/electrical,
		/area/sol_shuttle/atmospherics,
		/area/sol_shuttle/lounge,
		/area/sol_shuttle/capsroom,
		/area/sol_shuttle/telecomms,
	)
	dock_target = "sol_shuttle"
	current_location = "nav_hangar_sol_shuttle"
	landmark_transition = "nav_transit_sol_shuttle"
	range = 1
	fuel_consumption = 4
	ceiling_type = /turf/simulated/floor/shuttle_ceiling
	defer_initialisation = TRUE

/obj/effect/overmap/visitable/sector/sol_shuttle_spawn
	name = "small asteroid cluster"
	desc = "Sensor array detects a small asteroid cluster."
	in_space = 1
	icon_state = "meteor2"
	hide_from_reports = TRUE
	initial_generic_waypoints = list(
		"nav_sol_1"
	)

	initial_restricted_waypoints = list(
		"SolGov Cruiser" = list("nav_hangar_sol_shuttle")
	)

/obj/effect/overmap/visitable/ship/landable/sol_shuttle
	name = "SolGov Cruiser"
	desc = "Sensor array detects a small SolGov Cruiser."
	color = "#0099cc"
	icon_state = "ship"
	moving_state = "ship_moving"
	fore_dir = NORTH
	vessel_size = SHIP_SIZE_SMALL

/obj/effect/overmap/visitable/ship/landable/sol_shuttle/New()
	name = "SEV [pick("Quantum", "Enterprise", "Event Horizon", "Notch","Discovery","Vagrant")]"
	for(var/area/sol_shuttle/A)
		A.name = "\improper [name] - [A.name]"
		GLOB.using_map.area_purity_test_exempt_areas += A.type
	name = "[name], \a [initial(name)]"
	..()
/obj/machinery/computer/shuttle_control/explore/sol_shuttle
	name = "landing control console"
	shuttle_tag = "SolGov Cruiser"
	req_access = list(access_sol_shuttle)

/obj/effect/shuttle_landmark/sol_shuttle/one
	name = "SEV Quantum Docked"
	landmark_tag = "nav_hangar_sol_shuttle"

/obj/effect/shuttle_landmark/sol_shuttle/two
	name = "East of the Asteroid"
	landmark_tag = "nav_sol_1"

/obj/effect/submap_landmark/joinable_submap/sol_shuttle
	name = "SEV Quantum"
	archetype = /decl/submap_archetype/derelict/sol_shuttle

/decl/submap_archetype/derelict/sol_shuttle
	descriptor = "Sol Shuttle"
	map = "SEV Quantum"
	crew_jobs = list(
		/datum/job/submap/sol,
		/datum/job/submap/sol/captain,
		/datum/job/submap/sol/scientist
	)
	whitelisted_species = list(SPECIES_HUMAN)
	blacklisted_species = null
