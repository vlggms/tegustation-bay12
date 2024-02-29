#include "casino_areas.dm"
#include "casino_objects.dm"
#include "../mining/mining_areas.dm"

/obj/effect/overmap/visitable/ship/casino
	name = "passenger liner"
	desc = "Sensors detect an undamaged vessel without any signs of activity."
	color = "#bd6100"
	vessel_mass = 5000
	max_speed = 1/(2 SECONDS)
	burn_delay = 1 SECOND
	initial_generic_waypoints = list(
		"nav_casino_1",
		"nav_casino_2",
		"nav_casino_3",
		"nav_casino_4",
		"nav_casino_antag",
		"nav_casino_hangar",
	)
	initial_restricted_waypoints = list(
		"Casino Cutter" = list("nav_casino_hangar"),
	)

/obj/effect/overmap/visitable/ship/casino/New(nloc, max_x, max_y)
	name = "IPV [pick("Fortuna","Gold Rush","Ebisu","Lucky Paw","Four Leaves")], \a [name]"
	..()

/datum/map_template/ruin/away_site/casino
	name = "Casino"
	id = "awaysite_casino"
	description = "A casino ship!"
	suffixes = list("casino/casino.dmm")
	spawn_cost = 1
	shuttles_to_initialise = list(/datum/shuttle/autodock/overmap/casino_cutter)
	area_usage_test_exempted_root_areas = list(/area/casino)
	apc_test_exempt_areas = list(
		/area/casino/casino_hangar = NO_SCRUBBER,
		/area/casino/casino_cutter = NO_SCRUBBER|NO_VENT,
		/area/casino/casino_solar_control = NO_SCRUBBER,
		/area/casino/casino_maintenance = NO_SCRUBBER|NO_VENT
	)

/obj/effect/shuttle_landmark/nav_casino/nav1
	name = "Casino Ship Navpoint #1"
	landmark_tag = "nav_casino_1"

/obj/effect/shuttle_landmark/nav_casino/nav2
	name = "Casino Ship Navpoint #2"
	landmark_tag = "nav_casino_2"

/obj/effect/shuttle_landmark/nav_casino/nav3
	name = "Casino Ship Navpoint #3"
	landmark_tag = "nav_casino_3"

/obj/effect/shuttle_landmark/nav_casino/nav4
	name = "Casino Ship Navpoint #4"
	landmark_tag = "nav_casino_4"

/obj/effect/shuttle_landmark/nav_casino/nav5
	name = "Casino Ship Navpoint #5"
	landmark_tag = "nav_casino_antag"

/datum/shuttle/autodock/overmap/casino_cutter
	name = "Casino Cutter"
	warmup_time = 15
	move_time = 60
	shuttle_area = /area/casino/casino_cutter
	current_location = "nav_casino_hangar"
	landmark_transition = "nav_casino_transit"
	fuel_consumption = 0.5//it's small
	range = 1
	defer_initialisation = TRUE
