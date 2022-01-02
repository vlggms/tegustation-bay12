//Lift Control Interface objects. (Lift computer)
/obj/machinery/computer/shuttle_control/lift/port
	name = "portside lift controls"
	shuttle_tag = "Port Lift"
	ui_template = "shuttle_control_console_lift.tmpl"
	icon_state = "tiny"
	icon_keyboard = "tiny_keyboard"
	icon_screen = "lift"
	density = FALSE

/obj/machinery/computer/shuttle_control/lift/starboard
	name = "starboardside lift controls"
	shuttle_tag = "Starboard Lift"
	ui_template = "shuttle_control_console_lift.tmpl"
	icon_state = "tiny"
	icon_keyboard = "tiny_keyboard"
	icon_screen = "lift"
	density = FALSE

//Data for those lifts. (The actual shuttle data)
/datum/shuttle/autodock/ferry/port
	name = "Port Lift"
	shuttle_area = /area/turbolift/port
	warmup_time = 3
	waypoint_station = "nav_port_lift_top"
	waypoint_offsite = "nav_port_lift_bottom"
	sound_takeoff = 'sound/effects/lift_heavy_start.ogg'
	sound_landing = 'sound/effects/lift_heavy_stop.ogg'
	ceiling_type = null
	knockdown = 0

/datum/shuttle/autodock/ferry/starboard
	name = "Starboard Lift"
	shuttle_area = /area/turbolift/starboard
	warmup_time = 3
	waypoint_station = "nav_starboard_lift_top"
	waypoint_offsite = "nav_starboard_lift_bottom"
	sound_takeoff = 'sound/effects/lift_heavy_start.ogg'
	sound_landing = 'sound/effects/lift_heavy_stop.ogg'
	ceiling_type = null
	knockdown = 0

//Landmarks for those lifts. (So they know where to go)
/obj/effect/shuttle_landmark/lift/port_top
	name = "Port Lift Top Deck"
	landmark_tag = "nav_port_lift_top"
	base_area = /area/turbolift/port
	base_turf = /turf/simulated/open

/obj/effect/shuttle_landmark/lift/port_bottom
	name = "Port Lift Lower Deck"
	landmark_tag = "nav_port_lift_bottom"
	flags = SLANDMARK_FLAG_AUTOSET
	base_area = /area/turbolift/port
	base_turf = /turf/simulated/floor/plating

/obj/effect/shuttle_landmark/lift/starboard_top
	name = "Starboard Lift Top Deck"
	landmark_tag = "nav_starboard_lift_top"
	base_area = /area/turbolift/starboard
	base_turf = /turf/simulated/open

/obj/effect/shuttle_landmark/lift/starboard_bottom
	name = "Starboard Lower Deck"
	landmark_tag = "nav_starboard_lift_bottom"
	flags = SLANDMARK_FLAG_AUTOSET
	base_area = /area/turbolift/starboard
	base_turf = /turf/simulated/floor/plating
