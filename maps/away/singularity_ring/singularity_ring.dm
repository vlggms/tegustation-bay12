#include "singularity_ring_areas.dm"

/obj/effect/overmap/visitable/sector/singularity_ring
	name = "singularity ring"
	desc = "An abandoned structure complete with tools for construction of a singularity engine."
	icon_state = "object_ring"
	known = 0
	initial_generic_waypoints = list(
		"nav_singuring_1",
		"nav_singuring_2",
		"nav_singuring_3",
	)

/datum/map_template/ruin/away_site/singularity_ring
	name = "Derelict Singularity Ring"
	id = "awaysite_singuring"
	description = "An abandoned structure complete with tools for construction of a singularity engine."
	suffixes = list("singularity_ring/singularity_ring.dmm")
	spawn_cost = 1
	area_usage_test_exempted_root_areas = list(/area/singularity_ring)
	apc_test_exempt_areas = list(
		/area/singularity_ring/inner = NO_SCRUBBER|NO_VENT,
		/area/singularity_ring/outer = NO_SCRUBBER|NO_VENT,
	)

/obj/effect/shuttle_landmark/singularity_ring/nav1
	name = "Singularity Ring Navpoint #1"
	landmark_tag = "nav_singuring_1"

/obj/effect/shuttle_landmark/singularity_ring/nav2
	name = "Singularity Ring Navpoint #2"
	landmark_tag = "nav_singuring_2"

/obj/effect/shuttle_landmark/singularity_ring/nav3
	name = "Singularity Ring Navpoint #3"
	landmark_tag = "nav_singuring_3"
