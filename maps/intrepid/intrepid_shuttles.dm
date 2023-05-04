/obj/effect/shuttle_landmark/lower_level
	name = "Lower Level Dock"
	landmark_tag = "nav_example_station"
	docking_controller = "lower_level_dock"

/obj/effect/shuttle_landmark/upper_level
	name = "Upper Level Dock"
	landmark_tag = "nav_example_offsite"
	special_dock_targets = list("Example" = "example_shuttle_port")
	docking_controller = "upper_level_dock"

/datum/shuttle/autodock/ferry/example
	name = "Example"
	shuttle_area = /area/shuttle/escape
	dock_target = "example_shuttle_starboard"
	warmup_time = 10

	location = 0
	waypoint_station = "nav_example_station"
	waypoint_offsite = "nav_example_offsite"

//Supply Drone
/datum/shuttle/autodock/ferry/supply/drone
	name = "Supply Drone"
	location = 1
	warmup_time = 10
	shuttle_area = /area/shuttle/cargodrone
	waypoint_offsite = "nav_cargo_start"
	waypoint_station = "nav_cargo_station"

/obj/effect/shuttle_landmark/supply/centcom
	name = "Offsite"
	landmark_tag = "nav_cargo_start"

/obj/effect/shuttle_landmark/supply/station
	name = "Hangar"
	landmark_tag = "nav_cargo_station"
	base_area = /area/intrepid/department/cargo/cargobay
	base_turf = /turf/simulated/floor/plating

// Stardust
/datum/shuttle/autodock/ferry/stardust
	name = "Stardust"
	warmup_time = 10
	dock_target = "stardust_shuttle_airlock"
	waypoint_station = "nav_stardust_start"
	waypoint_offsite = "nav_stardust_out"
	logging_home_tag = "nav_stardust_start"
	logging_access = access_stardust_helm
	ceiling_type = /turf/simulated/floor/shuttle_ceiling

/datum/shuttle/autodock/ferry/stardust/New(_name, var/obj/effect/shuttle_landmark/initial_location)
	shuttle_area = subtypesof(/area/shuttle/research)
	..()

/obj/effect/shuttle_landmark/stardust/start
	name = "First Deck"
	landmark_tag = "nav_stardust_start"
	docking_controller = "stardust_shuttle_dock_airlock"

/obj/effect/shuttle_landmark/stardust/out
	name = "Space near the ship"
	landmark_tag = "nav_stardust_out"

// Pandora
/datum/shuttle/autodock/overmap/exploration_shuttle
	name = "Pandora"
	move_time = 90
	shuttle_area = list(/area/shuttle/pandora/cockpit, /area/shuttle/pandora/electrical, /area/shuttle/pandora/lifesupport,/area/shuttle/pandora/cargo )
	dock_target = "pandora_shuttle"
	current_location = "nav_hangar_pandora"
	landmark_transition = "nav_transit_pandora"
	range = 1
	fuel_consumption = 4
	logging_home_tag = "nav_hangar_pandora"
	logging_access = access_expedition_shuttle_helm
	ceiling_type = /turf/simulated/floor/shuttle_ceiling

/obj/effect/shuttle_landmark/intrepid/hangar/exploration_shuttle
	name = "Pandora Hangar"
	landmark_tag = "nav_hangar_pandora"
	base_area = /area/intrepid/department/cargo/cargobay
	base_turf = /turf/simulated/floor/plating

/obj/effect/shuttle_landmark/transit/intrepid/exploration_shuttle
	name = "In transit"
	landmark_tag = "nav_transit_pandora"

// Caduceus
/datum/shuttle/autodock/ferry/ambulance
	name = "Caduceus"
	shuttle_area = /area/shuttle/ambulance/home
	current_location = "nav_hangar_ambulance"
	move_time = 60
	dock_target = "ambulance_shuttle_dock"

/obj/effect/shuttle_landmark/intrepid/hangar/ambulance_shuttle
	name = "Caduceus Dock"
	landmark_tag = "nav_hangar_ambulance"
	docking_controller = "ambulance_intrepid_dock"

// Merchant
/datum/shuttle/autodock/ferry/merchant
	name = "Merchant"
	warmup_time = 10
	shuttle_area = /area/shuttle/merchant/home
	waypoint_station = "nav_merchant_start"
	waypoint_offsite = "nav_merchant_out"
	dock_target = "merchant_ship_dock"

/obj/effect/shuttle_landmark/merchant/start
	name = "Merchant Base"
	landmark_tag = "nav_merchant_start"
	docking_controller = "merchant_station_dock"

/obj/effect/shuttle_landmark/merchant/out
	name = "Docking Bay"
	landmark_tag = "nav_merchant_out"
	//docking_controller = "merchant_shuttle_station_dock"

// Other
/obj/effect/shuttle_landmark/merc/deck1
	name = "North of First Deck"
	landmark_tag = "nav_merc_deck1"

/obj/effect/shuttle_landmark/merc/deck2
	name = "North of Second deck"
	landmark_tag = "nav_merc_deck2"

/obj/effect/shuttle_landmark/obs_shuttle/deck1
	name = "Northeast of First deck"
	landmark_tag = "nav_obs_deck1"
