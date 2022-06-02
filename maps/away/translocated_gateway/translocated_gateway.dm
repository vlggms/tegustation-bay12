#include "translocated_gateway_areas.dm"

/obj/effect/overmap/visitable/sector/translocated_gateway
	name = "debris cloud"
	desc = "Sensors detect a group of rock and metal structures. Unstable bluespace signatures have also been detected, similar to that of a bluespace drive."
	icon_state = "object"
	known = 0
	initial_generic_waypoints = list(
		"nav_gateway_1",
		"nav_gateway_2",
		"nav_gateway_3",
	)

/datum/map_template/ruin/away_site/translocated_gateway
	name = "Gateway"
	id = "awaysite_transgateway"
	description = "A debris cloud, thin enough for sensors to detect movement deeper within."
	suffixes = list("translocated_gateway/translocated_gateway.dmm")
	spawn_cost = 1
	area_usage_test_exempted_root_areas = list(/area/translocated_gateway)
	apc_test_exempt_areas = list(
		/area/translocated_gateway/engiroom = NO_SCRUBBER|NO_VENT,
		/area/translocated_gateway/janitorroom = NO_SCRUBBER|NO_VENT,
		/area/translocated_gateway/storage = NO_SCRUBBER|NO_VENT
	)

/obj/effect/shuttle_landmark/nav_transgateway/nav1
	name = "Debris Cloud Navpoint #1"
	landmark_tag = "nav_gateway_1"

/obj/effect/shuttle_landmark/nav_transgateway/nav2
	name = "Debris Cloud Navpoint #2"
	landmark_tag = "nav_gateway_2"

/obj/effect/shuttle_landmark/nav_transgateway/nav3
	name = "Debris Cloud Navpoint #3"
	landmark_tag = "nav_gateway_3"
