//Data for those lifts. (The actual shuttle data)
/datum/shuttle/autodock/ferry/port
	name = "Port Lift"
	shuttle_area = /area/turbolift/port/lift
	warmup_time = 3
	waypoint_station = "nav_port_lift_top"
	waypoint_offsite = "nav_port_lift_bottom"
	sound_takeoff = 'sound/effects/lift_heavy_start.ogg'
	sound_landing = 'sound/effects/lift_heavy_stop.ogg'
	ceiling_type = null
	knockdown = 0

/datum/shuttle/autodock/ferry/starboard/lift
	name = "Starboard Lift"
	shuttle_area = /area/turbolift/starboard/lift
	warmup_time = 3
	waypoint_station = "nav_starboard_lift_top"
	waypoint_offsite = "nav_starboard_lift_bottom"
	sound_takeoff = 'sound/effects/lift_heavy_start.ogg'
	sound_landing = 'sound/effects/lift_heavy_stop.ogg'
	ceiling_type = null
	knockdown = 0

/datum/shuttle/autodock/ferry/intrepidcargo/lift
	name = "Cargobay Lift"
	shuttle_area = /area/turbolift/intrepidcargo/lift
	warmup_time = 3
	waypoint_station = "nav_intrepidcargo_lift_bottom"
	waypoint_offsite = "nav_intrepidcargo_lift_top"
	sound_takeoff = 'sound/effects/lift_heavy_start.ogg'
	sound_landing = 'sound/effects/lift_heavy_stop.ogg'
	ceiling_type = null
	knockdown = 0

/datum/shuttle/autodock/ferry/marine/lift
	name = "Pandora Hangar Lift"
	shuttle_area = /area/turbolift/marine/lift
	warmup_time = 3
	waypoint_station = "nav_marine_lift_bottom"
	waypoint_offsite = "nav_marine_lift_top"
	sound_takeoff = 'sound/effects/lift_heavy_start.ogg'
	sound_landing = 'sound/effects/lift_heavy_stop.ogg'
	ceiling_type = null
	knockdown = 3

//Lift Control Interface objects. (Lift computer)
/obj/machinery/computer/shuttle_control/lift
	ui_template = "shuttle_control_console_lift.tmpl"
	icon_state = "tiny"
	icon_keyboard = "tiny_keyboard"
	icon_screen = "lift"
	density = FALSE

/obj/machinery/computer/shuttle_control/lift/port
	name = "portside lift controls"
	shuttle_tag = "Port Lift"

/obj/machinery/computer/shuttle_control/lift/starboard
	name = "starboardside lift controls"
	shuttle_tag = "Starboard Lift"

/obj/machinery/computer/shuttle_control/lift/intrepidcargo
	name = "cargo bay lift controls"
	shuttle_tag = "Cargobay Lift"

/obj/machinery/computer/shuttle_control/lift/marine
	name = "pandora hangar lift controls"
	shuttle_tag = "Pandora Hangar Lift"


// Landmarks for those lifts. (So they know where to go)
// Egor's note: SLANDMARK_FLAG_AUTOSET flag makes base_area and base_turf set automatically to what is in there
// DO NOT USE IT ON LANDMARKS WHERE SHUTTLE IS INITIALLY AT, IT WILL BREAK IT ALL
/obj/effect/shuttle_landmark/lift/port_top
	name = "Port Lift Top Deck"
	landmark_tag = "nav_port_lift_top"
	base_area = /area/intrepid/misc/maint/upper
	base_turf = /turf/simulated/open

/obj/effect/shuttle_landmark/lift/port_bottom
	name = "Port Lift Lower Deck"
	landmark_tag = "nav_port_lift_bottom"
	flags = SLANDMARK_FLAG_AUTOSET
	base_area = /area/intrepid/department/engineering/drone_fabrication
	base_turf = /turf/simulated/floor/plating

/obj/effect/shuttle_landmark/lift/starboard_top
	name = "Starboard Lift Top Deck"
	landmark_tag = "nav_starboard_lift_top"
	base_area = /area/intrepid/misc/maint/upper
	base_turf = /turf/simulated/open

/obj/effect/shuttle_landmark/lift/starboard_bottom
	name = "Starboard Lower Deck"
	landmark_tag = "nav_starboard_lift_bottom"
	flags = SLANDMARK_FLAG_AUTOSET
	base_area = /area/intrepid/department/engineering/drone_fabrication
	base_turf = /turf/simulated/floor/plating

/obj/effect/shuttle_landmark/lift/marine_top
	name = "Pandora Hangar Upper Deck"
	landmark_tag = "nav_marine_lift_top"
	flags = SLANDMARK_FLAG_AUTOSET
	base_area = /area/intrepid/department/exploration/hangar
	base_turf = /turf/simulated/open

/obj/effect/shuttle_landmark/lift/marine_bottom
	name = "Pandora Hangar Lower Deck"
	landmark_tag = "nav_marine_lift_bottom"
	base_area = /area/intrepid/department/exploration/storage
	base_turf = /turf/simulated/floor/plating

/obj/effect/shuttle_landmark/lift/intrepidcargo_top
	name = "Intrepid Cargo Upper Deck"
	landmark_tag = "nav_intrepidcargo_lift_top"
	flags = SLANDMARK_FLAG_AUTOSET

/obj/effect/shuttle_landmark/lift/intrepidcargo_bottom
	name = "Intrepid Cargo Lower Deck"
	landmark_tag = "nav_intrepidcargo_lift_bottom"
	base_area = /area/intrepid/department/cargo/cargostorage
	base_turf = /turf/simulated/floor/plating
