/obj/effect/mapping_helpers
	icon = 'icons/effects/mapping_helpers.dmi'
	icon_state = ""
	var/late = FALSE

/obj/effect/mapping_helpers/Initialize()
	..()
	return late ? INITIALIZE_HINT_LATELOAD : INITIALIZE_HINT_QDEL


//airlock helpers
/obj/effect/mapping_helpers/airlock
	layer = DOOR_HELPER_LAYER

/obj/effect/mapping_helpers/airlock/Initialize(mapload)
	. = ..()
	if(!mapload)
		log_warning("[src] spawned outside of mapload!")
		return
	var/obj/machinery/door/airlock/airlock = locate(/obj/machinery/door/airlock) in loc
	if(!airlock)
		log_warning("[src] failed to find an airlock at [get_log_info_line(src)]")
	else
		Payload(airlock)

/obj/effect/mapping_helpers/airlock/proc/Payload(obj/machinery/door/airlock/payload)
	return

/obj/effect/mapping_helpers/airlock/cyclelink_helper
	name = "airlock cyclelink helper"
	icon_state = "airlock_cyclelink_helper"

/obj/effect/mapping_helpers/airlock/cyclelink_helper/Payload(obj/machinery/door/airlock/airlock)
	if(airlock.cycle_link_dir)
		log_warning("[src] at [get_log_info_line(src)] tried to set [airlock] cyclelinkeddir, but it's already set!")
	else
		airlock.cycle_link_dir = dir


/obj/effect/mapping_helpers/airlock/locked
	name = "airlock lock helper"
	icon_state = "airlock_locked_helper"

/obj/effect/mapping_helpers/airlock/locked/Payload(obj/machinery/door/airlock/airlock)
	if(airlock.locked)
		log_warning("[src] at [get_log_info_line(src)] tried to bolt [airlock] but it's already locked!")
	else
		airlock.locked = TRUE


/obj/effect/mapping_helpers/airlock/unres
	name = "airlock unresctricted side helper"
	icon_state = "airlock_unres_helper"

/obj/effect/mapping_helpers/airlock/unres/Payload(obj/machinery/door/airlock/airlock)
	airlock.unres_sides ^= dir


/obj/effect/mapping_helpers/airlock/cutaiwire
	name = "airlock cut ai wire helper"
	icon_state = "airlock_cutaiwire"

/obj/effect/mapping_helpers/airlock/cutaiwire/Payload(obj/machinery/door/airlock/airlock)
	if(airlock.isWireCut(AIRLOCK_WIRE_AI_CONTROL))
		log_warning("[src] at [get_log_info_line(src)] tried to cut the ai wire on [airlock] but it's already cut!")
	else
		airlock.wires.CutWireIndex(AIRLOCK_WIRE_AI_CONTROL)
