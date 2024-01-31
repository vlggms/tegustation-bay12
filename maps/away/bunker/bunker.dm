#include "bunker_access.dm"
#include "bunker_areas.dm"
#include "bunker_objects.dm"
#include "bunker_random_rooms.dm"

/obj/effect/overmap/visitable/sector/arcticplanet_bunker
	name = "arctic moon"
	desc = "Sensor arrays detect a tiny moon with sub-zero surface conditions and sparse flora, possibly seeded from Earth species.<br><br>Topographical scans highlight the profile of a small building, located on the south-western side of a valley surrounded by mineral-rich mountains.<br><br>The moon has a very long rotational period, with sunrise in an estimated 56 hours."
	in_space = 0
	known = 1
	icon_state = "globe"
	initial_generic_waypoints = list(
		"nav_bunker_1",
		"nav_bunker_2",
		"nav_bunker_3",
		"nav_bunker_antag"
	)

/obj/effect/overmap/visitable/sector/arcticplanet_bunker/Initialize()
	. = ..()
	GLOB.number_of_planetoids++
	name = "[generate_planet_name()], \an [name]"
	var/matrix/M = new
	M.Turn(90)
	transform = M

/datum/map_template/ruin/away_site/abandoned_bunker
	name = "Abandoned Bunker"
	description = "Two z-level map with an arctic planet and an underground complex"
	id = "abandoned_bunker"
	spawn_cost = 2
	suffixes = list("bunker/bunker-1.dmm", "bunker/bunker-2.dmm")
	generate_mining_by_z = 2
	area_usage_test_exempted_root_areas = list(/area/abandoned_bunker)
	apc_test_exempt_areas = list(
		/area/abandoned_bunker/underground = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/abandoned_bunker/ground = NO_SCRUBBER|NO_VENT|NO_APC
	)

/obj/effect/shuttle_landmark/nav_bunker/nav1
	name = "Arctic Moon Landing Point #1"
	landmark_tag = "nav_bunker_1"
	base_area = /area/abandoned_bunker/ground

/obj/effect/shuttle_landmark/nav_bunker/nav2
	name = "Arctic Moon Landing Point #2"
	landmark_tag = "nav_bunker_2"
	base_area = /area/abandoned_bunker/ground

/obj/effect/shuttle_landmark/nav_bunker/nav3
	name = "Arctic Moon Landing Point #3"
	landmark_tag = "nav_bunker_3"
	base_area = /area/abandoned_bunker/ground

/obj/effect/shuttle_landmark/nav_bunker/nav4
	name = "Arctic Moon Navpoint #4"
	landmark_tag = "nav_bunker_antag"
	base_area = /area/abandoned_bunker/ground
