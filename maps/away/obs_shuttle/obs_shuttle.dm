#include "obs_shuttle_jobs.dm"
#include "obs_shuttle_areas.dm"

/datum/map_template/ruin/away_site/obs_shuttle
	name = "OBS Shuttle"
	id = "awaysite_obs"
	description = "'Independent' Light Corvette."
	suffixes = list("obs_shuttle/obs_shuttle.dmm")
	area_usage_test_exempted_root_areas = list(/area/obs_shuttle)
	spawn_cost = 0.6
	player_cost = 4
	spawn_weight = 0.67
	shuttles_to_initialise = list(/datum/shuttle/autodock/overmap/obs_shuttle)

/datum/shuttle/autodock/overmap/obs_shuttle
	name = "Independent Light Corvette"
	move_time = 10
	shuttle_area = list(
		/area/obs_shuttle/cryo,
		/area/obs_shuttle/ofd,
		/area/obs_shuttle/ofdstorage,
		/area/obs_shuttle/bridge,
		/area/obs_shuttle/primaryhall,
		/area/obs_shuttle/medbay,
		/area/obs_shuttle/hydro,
		/area/obs_shuttle/equipment,
		/area/obs_shuttle/cargo,
		/area/obs_shuttle/electrical,
		/area/obs_shuttle/atmospherics,
	)
	dock_target = "obs_shuttle"
	current_location = "nav_hangar_obs_shuttle"
	landmark_transition = "nav_transit_obs_shuttle"
	range = 1
	fuel_consumption = 4
	ceiling_type = /turf/simulated/floor/shuttle_ceiling
	defer_initialisation = TRUE

/obj/effect/overmap/visitable/sector/obs_shuttle_spawn
	name = "small asteroid cluster"
	desc = "Sensor array detects a small asteroid cluster."
	in_space = 1
	icon_state = "meteor2"
	hide_from_reports = TRUE
	initial_generic_waypoints = list(
		"nav_obs_1"
	)

	initial_restricted_waypoints = list(
		"Independent Light Corvette" = list("nav_hangar_obs_shuttle")
	)

/obj/effect/overmap/visitable/ship/landable/obs_shuttle
	name = "ILC Proton"
	shuttle = "Independent Light Corvette"
	desc = "Sensor array detects a small independent corvette. Their ship designation is outdated."
	color = "#734545"
	icon_state = "ship"
	moving_state = "ship_moving"
	fore_dir = NORTH
	vessel_size = SHIP_SIZE_SMALL

/obj/machinery/computer/shuttle_control/explore/obs_shuttle
	name = "landing control console"
	shuttle_tag = "Independent Light Corvette"
	req_access = list(access_obs_shuttle)

/obj/effect/shuttle_landmark/obs_shuttle/one
	name = "ILC Proton Docked"
	landmark_tag = "nav_hangar_obs_shuttle"

/obj/effect/shuttle_landmark/obs_shuttle/two
	name = "East of the Asteroid"
	landmark_tag = "nav_obs_1"

/obj/effect/submap_landmark/joinable_submap/obs_shuttle
	name = "ILC Proton"
	archetype = /decl/submap_archetype/derelict/obs_shuttle

/decl/submap_archetype/derelict/obs_shuttle
	descriptor = "OBS Shuttle"
	map = "ILC Proton"
	crew_jobs = list(
		/datum/job/submap/obs,
		/datum/job/submap/obs/pilot,
		/datum/job/submap/obs/scientist
	)
	whitelisted_species = list(SPECIES_HUMAN)
	blacklisted_species = null
